---
title: "Creating a Roku Channel"
date: 2020-11-15T15:00:00-06:00
draft: false
categories:
- Blog
tags:
- Programming
- BrightScript
- Roku
---

I've been a Roku user for years.  They were one of the original streaming boxes you could plug into your TV.  Before I became one I debated over Mac Mini vs dedicated device...  As a programmer - I love the ability to have complete (-ish) control over a device that's outputting to a device so central to the home as a TV.  As a person who pays an energy bill - I love something that sips less electricity in-general, like a more-dedicated device.  Plus, the interface of the dedicated device is simpler than that for a Mac Mini.

I settled for Roku.

In all this time, I've never tried to build a Roku channel.  I've only had a few use cases, and none were strong enough to pull me away from other projects taking my time.

Until recently.

# The Problem

Now I've got a baby.  And she doesn't want to be interrupted by YouTube ads while watching Baby Einstein.  My wife doesn't want to have to pop in a DVD every time.  And I don't want to setup some always-on local media server.  (We don't watch Baby Einstein very much - but the girl loves it, so one episode is part of her morning routine, and it's a way to keep her distracted when the 12 hour car ride starts to get unbearable.)

I put some Baby Einstein on a Fire tablet so we could take it on the road.  While preparing to download it to the tablet, I realized I could just drop them on my web host (locked down to our IP address), and then figure out how to stream them to the Roku!

I don't know of many good ways to stream personal video to the Roku - the best is typically to setup a local media server and use a pre-built channel.  It seemed like I should be able to setup a Roku channel to stream to my Roku.

I was going to build a personal Roku channel.

# The Challenge

> Goal: build a Roku channel that streams specific videos from my website.

I settled on the third method I tried for building the channel.  I'll briefly explain each, and the problems that caused me to skip them.

1. [Roku Direct Publisher](https://developer.roku.com/docs/direct-publisher/getting-started.md) - this method takes a JSON or MRSS feed you provide, some theme data, and builds you a channel quickly and easily.  This method has fantastic features, for something so easy to use.  Unfortunately it is a little broken.  The documentation for the JSON feed format specified some optional parts and mandatory, and other mandatory parts as optional/unspecified.  There are examples to work from, and the validation tool provides a little feedback which is generally helpful.  There are some bugs with this right now - I couldn't get my feed to show any videos despite ingesting correctly, and I'm not sure if that's due to the bugs or due to me doing something wrong.

2. InstantTVChannel - I'm not going to link to these guys because they don't really deserve it.  This is a service that will build a Direct Publisher or "SDK" channel for Roku.  It's reasonably easy to use for either, but this service pissed me off a bit.  There's a free level - which for me is perfect as I really don't need them to host anything for me, just to produce the channel app.  Unfortunately the free level is limited to 10 videos per channel, which is silly.  I thought I'd use the direct publisher feed to help debug my work with the direct publisher - these guys have the feed locked down to only be accessible from Roku's servers, though, requiring a username and password to access the feed.  That level of unfriendliness completely turned me off from them.  I'm sure they don't care - I wasn't going to pay $5 per month for the privilege of hosting all my own content other than a bit of XML or JSON.

3. [Custom "SDK" Channel](https://developer.roku.com/docs/developer-program/getting-started/roku-dev-prog.md) - this method requires writing or modifying BrightScript, building out the program that is the channel, packaging it, and then deploying it.  This sounds the most complicated, but it was actually fairly simple because Roku provided some excellent examples to start with.

# Solution

After some searching I found this excellent example: [VideoList.zip](https://github.com/rokudev/samples/blob/master/ux%20components/lists%20and%20grids/VideoList.zip).  That's from Roku's [samples repo](https://github.com/rokudev/samples), and just unzipping it reveals all the source code.

{{< fig-res res="video_list.jpg" alt="A list of videos to play, with a video preview shown - source https://sdkdocs-archive.roku.com/attachments/4262787/4262824.jpg" caption="This is what the example channel looks like, by default" >}}

I've taken that example and made some changes to suit me, and make your job easier.  [It's here](https://github.com/kc0bfv/sickendick_home_channel_roku_app/tree/clean).

> Dev Tools Required: Roku device, web browser, text editor, image editor

Yeah - this ain't rocket surgery.  Thankfully.

I'll walk through the files in there that need changes.

## `manifest`

This file sets the main properties of the channel so Roku can display and use it properly.  Change things as required.  `title` and `subtitle` are self-explanatory.

`major`, `minor`, and `build` `_version`s help Roku devices determine when they need to update the channel.  Starting with `1` `0` `0000` is fine, and I had no problem leaving it as that throughout the development process.  Once I deploy my channel, I will increment at least one of these versions so my Rokus will know to update.  There's a separate version that you specify in the Roku developer deployment interface - it doesn't seem to have to tie to this number, but it probably makes sense to keep it the same or similar and always increment in the same way.

The "splash" screen is what's shown first when you open up a channel, so Roku can display something nice while the channel loads, before the channel contents are displayed.  These properties are set with `splash_screen_sd`, `splash_screen_hd`, `splash_color`, and `splash_min_time`.  The `sd` and `hd` versions are shown on SD and HD screens respectively, and you'll see this naming convention throughout Roku.  I'll specify the required properties of these images below.  The color is specified as hexadecimal, and the time is in milliseconds.

The remaining lines specify icons displayed on the home screen.  I actually haven't seen any of the "side" ones used, so I'm not sure where they show up.  The `hd` `focus` versions are what the main menu displays on my Roku.

Note the `pkg:/images/...` format for specifying paths.  That format is relative to the package location, exactly as you might suspect.  There are other relative locations like `pkg` too, but it's the important one here.

## `components/videoexamplescene.xml`

This does a ton of the work for the channel - you'll see the BrightScript in this file.  There are several things you'll want to change in here. `m.top.backgroundURI` - set this to whatever you want to display in the background of your list/video preview.

> For non-programmers, things like `m.top.backgroundURI` are called "variables".  When I say "set this to whatever you want", I mean change the part inside the quotes after the equals sign.  If you use an image editor to create a new background image for your channel, you can save it in the "images" folder, then change what's inside the quotes to reflect the filename you chose.  Make sure to keep the quotation marks similar to how they were initially - at the beginning and the end.  Make sure not to mess up the variable name `m.top.backgroundURI`.  Make sure to still keep the equals sign.

`m.readVideoContentTask.videocontenturi` - this specifies the location of your videos list.  Initially you can find the video list in the package, in `server/videocontent.xml`.  The problem with this is that whenever you want to change your list of videos you'll have to update your channel package, and that's a bit of a pain.  I put the video list on my web server, which you can totally do - you'll have to make some changes in `components/videocontentreader.xml`, but we'll do that next.  To specify a web location, just change the URI from `pkg:/server...` to `https://whatever.com/something...`.

`uri` for `tvPoster` - this is way down on line 88, and is an XML property.  This URI specifies the image for the fake looking flat screen TV displayed in the example channel.  I didn't like this at all and changed the image, but this totally isn't required.  Image properties are below.

## `components/videocontentreader.xml`

The BrightScript in this file reads in the list of video entries.  If you are just modifying the `server/videocontent.xml` file then you don't need any changes here.  If you, like me, are putting the video list on a website, then you need to comment out lines 25 and 26, and uncomment and modify the block below it.  The changes you need to make are to the variable names which are just "foo"'d out.  You also need to add some lines that cause it to handle "https" correctly which you should be using.

Easier than making these changes yourself - just download [my modified version](https://github.com/kc0bfv/sickendick_home_channel_roku_app/blob/clean/components/videocontentreader.xml).

## `server/videocontent.xml`

This file contains the list of videos you want to be able to play.  Again - you can choose to keep this in the package, or serve it over the web.  This list will display on your Roku in-order, and each `video` entry in the `VideoContent` element will be one video.  The properties are fairly self-explanatory, but `hdposterurl` should point to the image you want displayed as a preview.  `streamformat` should be one of: mp4, wma, mp3, hls, ism, dash, mkv, mka, mks.  It's [described here](https://developer.roku.com/docs/developer-program/getting-started/architecture/content-metadata.md#playback-configuration-attributes).  `url` should point to your video file - which should be in the format you gave in `streamformat`.

> NOTE: Your URLs should be URL encoded - thus, instead of a space you'd have "%20", etc.

I made a little Python script for myself to build this file - I certainly don't recommend doing it by hand.  [Here's a Google Docs Spreadsheet that'll build it for you though](https://docs.google.com/spreadsheets/d/1O5BEbdVMRxqd1uZ9sPBkoW64Us1yaNfvusvlaU3e5i0/edit?usp=sharing).  You'll need to make a copy of the spreadsheet before you can edit it.  When you have your videos all entered, copy the entry in row 2 column O into your file.  I haven't tested this method, and am especially worried about the URL encoding I setup here - if you have trouble please let me know so I can fix this spreadsheet.

## Image Requirements

| Property | Required Resolution | File Format | Purpose |
| --- | --- | --- | --- |
| `splash_screen_hd` | 1280x720 | jpg or png (maybe others) | HD Splash Screen |
| `splash_screen_sd` | 720x480 | jpg or png (maybe others) | SD Splash Screen |
| `mm_icon_focus_hd` | 336x210 | jpg (maybe others, but **not png** for some reason) | HD main menu icon |
| `mm_icon_side_hd` | 108x69 | png (maybe others) | Unknown |
| `mm_icon_focus_sd` | 248x140 | png (maybe others) | SD main menu icon |
| `mm_icon_side_sd` | 248x140 | png (maybe others) | Unknown |
| `m.top.backgroundURI` | 1280x720 | jpg or png (maybe others) | Background image for your channel list/preview |
| `tvPoster` `uri` | 647x448 | png (maybe others) | The surrounding image for your channel video preview |
| `hdposterurl` | 540x304 | jpg or png (maybe others) | The image displayed as video preview |

## Publishing

Once you get your channel all edited, your videos, logos, and video list deployed, then you want to test your channel.  You need to package it as a zip file - you can do that by running `make` if you're using my repo.  Then you're ready to start publishing.  [Roku's guide is excellent, so just use that](https://developer.roku.com/docs/developer-program/publishing/pre-publishing-checklist.md).

I'll paraphrase.

1. Make sure you have rights to whatever you're doing.  Consider taking measures to prevent other people from accessing videos, if this is a private channel.  Like - use an `.htaccess` file to limit access to just your IP address.
2. Enable developer mode on your Roku.  [Instructions here, under quick start](https://github.com/rokudev/samples).
3. Sideload your channel from your Roku device's developer web page, then test out your channel by playing with it on the Roku.  Make sure it works like you want.
4. Generate a developer key on the Roku by telnetting to it and running `genkey`, keep track of the password and dev ID.
5. Go to your device's dev web page packager and package your side-loaded channel.  Download the result.
6. Go to [developer.roku.com](https://developer.roku.com/), create an account, and create a channel.  Set it as a "Developer SDK" channel, "non-certified" so it remains private, set required properties, upload a 540x405 sized poster when asked, upload the package you downloaded in step 5 and set the channel version as required (minimum firmware is probably 1.0 for you, unless you deviated), and click through to publish.
7. Click on the displayed "vanity access code" for your channel to start adding the private channel to your Roku.
8. Now you can go back to your Roku device's developer web page and remove the side-loaded channel.

If you picked a "non-certified" channel, unless someone guesses your Roku channel access code they cannot add your channel.  That's probably for the best.

# Conclusion

That should do it.  A couple things I hope to do in the future - get some security cameras for my home that provide local feeds on my network.  Then I could create a Roku channel that displays those.  Perhaps not as a list, like here, but in the typical quad format.  There are examples for how to create a screensaver - so perhaps I'd create one that displays those camera feeds.
