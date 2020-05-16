---
title: "Switching to My Own Cloud"
date: 2020-05-16T14:21:18-06:00
draft: false
categories:
- Blog
tags:
---

[Google Music is disappearing](https://arstechnica.com/gadgets/2020/05/google-play-music-dies-this-year-yt-music-library-imports-begin-today/) - it's time to find a new way to host music in the cloud.  Google wants folks to move to YouTube Music as their music locker, but I'm tired of being jerked around.

To get away from Google Music I needed the following capabilities:

- Cloud-based method of storing music
- Browser-based method for listening to that music
- Android app for listening to music, with method for downloading some music to device storage

{{< fig-res res="next.gif" alt="Judge Judy saying 'next', with a confused look on her face." >}}

[Nextcloud](https://nextcloud.com/) hosted on Dreamhost with Dreamobjects is the solution I chose.  This post will talk about how I settled on this, and how I made it work well.

<!--more-->

# Picking a Solution

I need a cloud-based solution because:

- my music doesn't all fit on my phone
- I hop between several operating systems and computers
- I don't want to spend time replicating my setup on different devices

Storing music in the cloud avoids those.  I could serve music directly from my home computers, but this lets me get away from exposing my personal devices to the Internet, lets me listen even when those computers are disconnected from the Internet, and is a more efficient use of electricity I suspect.

It took me some searching to settle on Nextcloud.  At first I thought - "all my music is already backed up on S3, surely there's some way to stream directly from there."  I couldn't find any good solution for this.  There are some old Flash-based players...  I thought about building a website to solve this - store S3 info in a cookie, use CORS requests to load and play music.  One complication to building a tool like this is that you've got to build a catalog of available music, and that takes time and significant bucket download because you've got to parse every song's ID3 tag.  I'd want to cache that catalog somewhere.  I'd probably cache it there in the same S3 bucket, and use a simple-to-parse format so others could build on it too.  Building my own player wasn't a project I have time for right now.

Others trying to solve the same problem had recommendations for Cloudbeats (Android app), and Subsonic and Ampache (cloud music server standards).  Cloudbeats put me on the trail of Nextcloud and ownCloud, and Subsonic and Ampache standards were also supported by the Nextcloud/ownCloud music app.  There are a number of Android apps supporting Subsonic and Ampache, so it seemed like if I could get the server setup I'd be able to find something that worked on the Android side.

Nextcloud is the more open-source choice between the two, and otherwise they're extremely similar, so I went with it.  What is Nextcloud?  It's a self-hosted cloud storage solution.  It is a Dropbox you host yourself.  These days it is so much more - Nextcloud includes apps that let you collaborate on document editing, host your calendar and email, and more.  And of course stream music.

Now - where to setup Nextcloud?  The options were:

- on a personal computer
- on my existing shared-hosting service, Dreamhost
- on an AWS EC2 instance, or some other service's cloud computing instance

I already decided that running Nextcloud from my home desktop or server computer wasn't the best choice.  My 26 GB of music isn't a huge collection, and Dreamhost offers "unlimited" storage, but reading through some discussion, that unlimited data isn't really supposed to cover my use-case.  Using an EC2 instance or similar would cost $10 a month or so, and I wanted to avoid paying that if possible.  For $10 a month I'll just pay Spotify and get more music.

Fortunately Nextcloud has an "external storage" plugin that supports S3 storage.  It lets you use an S3 bucket just like a folder, even for the other apps supported by Nextcloud like the music player.  Dreamhost has a Ceph-based S3 storage offering called Dreamobjects that I calculate will cost me $2 per month tops - that's downright reasonable.

# Setting up Nextcloud

The most helpful resource I found was [this tutorial by Parvez Shaikh](https://techstuffer.com/install-nextcloud-shared-server/).  In short:

- Create a subdomain (give it a new username)
- Setup a dedicated database (give it its own username too)
- wget Nextcloud onto Dreamhost and unpack - it will unpack into a "nextcloud" directory
- Visit "https://domain/nextcloud" before anybody else does and go through the web-based setup

It's that easy.  The storage by default is in the "nextcloud/data" directory, and I saw no reason to change that.  It's possible to setup S3 as your default storage, but I decided to use some S3 buckets as folders.  This lets me choose at run-time whether to put data in S3 (a little slower) or on the shared-hosting disk (don't want to put big files there).

Setting up S3 / Dreamobjects was also easy - you must know the Dreamobjects hostname, region, and that it requires "path style access".  [Here's an easy walkthrough from Dreamhost](https://help.dreamhost.com/hc/en-us/articles/215987867-Connecting-ownCloud-to-DreamObjects) - it's for ownCloud but Nextcloud works the same.  There is one major difference in where you find the External Storage app...

- Setup a bucket from the Dreamhost panel (it's under Cloud Services on the left)
- Don't put underscores in your bucket name, and keep track of the server, access key, and secret key displayed there
- In Nextcloud enable the "External Storage" app by clicking your user profile in the top right, then clicking "Apps", then finding "External Storage Support" in the list and clicking "Enable"
- Configure external storage in Nextcloud by specifying the data for your bucket, region "us-east-1", "enable SSL", and "enable path style"

That's the basics...  But unfortunately you're still going to have some problems if you're on Nextcloud 18.  Nextcloud 19 (currently in beta) fixes some problems with streaming from S3, so update to that.  In the Nextcloud settings - administration - overview change your update channel to "Beta".  After refreshing the page and searching for updates the page should show one.  You can try to update directly via the web interface, but I had problems with that.  I had to SSH into my host, change to the "nextcloud" folder, and run this command:

`php -d memory_limit=156M updater.phar`

The memory limit was necessary for me, or after spending 4 minutes backing everything up PHP would run out of memory.  Dreamhost's default memory settings are only about 96 MB.

After the update completes you can switch back to the "Stable" update channel to fall back in sync next time a stable version is released that's greater than what you just installed.

At this point you can use Nextcloud for all kinds of things.

# Setting up Streaming

I recommend the "Music" app for Nextcloud - it builds your music catalog and stores it on the Nextcloud instance.  It provides a browser-based music player and playlist builder, and is an endpoint for Subsonic and Ampache apps.

Cloudbeats has great reviews - my major problem with it is that it builds and stores your catalog on your device.  This means that if you move devices or use multiple you must build a new catalog.  It also means you don't have shared playlists.  In my experience, the S3 storage has been significantly slower through Nextcloud, and Cloudbeats had to go through that slow connection to build the catalog, which caused issues.

The Music app can be installed from the Nextcloud web-based app store.  After installing, it will notice your music folder and offer to scan your music collection via the web interface.

Scanning my music collection to build the catalog took over a day - I did not do this through the web interface due to timeouts.  This slow process is due to the S3 setup, and is made faster in Nextcloud 19, but at least only needs to be done once.

I SSHed into my Dreamhost instance, changed to the Nextcloud directory, started up a "screen" instance and ran the following command:

`php ./occ music:scan --all`

I disconnected from the screen instance (Ctrl+a d) and let that run in the background for a day.  After that completed, my collection was cataloged and easy to stream.

# Android and Desktop Apps

Desktop apps for Nextcloud use: Debian's nextcloud-client package is great.

Android has a Nextcloud client, it's great too.

Android apps for playing music: DSub has worked best for me.  Perhaps start with the free "subsonic" app, and make sure your music is streaming well-enough.  But the $5 DSub app had much better usability for me than subsonic, so I went with it instead.  DSub started really eating my battery, so I disabled periodic sync and "DLNA" in the settings.

# Problems

- S3 is slower than I'd like through Nextcloud, but in normal use I don't notice this much
- Nextcloud requires quite a bit of debugging and command-line usage so far, it's not a layperson's solution yet
- I'm currently having trouble with Dreamobjects connectivity from Dreamhost - I've tracked this to an IPV6 issue and notified Dreamhost
- I have more sync errors with Nextcloud than I did with Dropbox - although with Dropbox they were always silent, and Nextcloud at least notifies me that **something** bad happened

# Summary

If this solution continues to work as well as it is today, I'll be extremely happy with it.  I went looking for a music streaming solution, but I found a whole self-hosted cloud solution.  I'm moving off Dropbox, I've decided to use it when I need to share things with others.  Nextcloud supports sharing like that, but I'd prefer to keep it out of that usage.  I'll probably try to get my wife using it for her data so we can back everything up more easily.
