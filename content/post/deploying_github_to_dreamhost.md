---
title: "Deploying Github to Dreamhost"
date: 2020-02-08T10:00:00-07:00
draft: false
categories:
- Blog
tags:
- hugo
- programming
- shell
- php
---

One feature I lost moving from Wordpress to Hugo for this blog was the ability to write a blog post from anywhere.  I really liked being able to do that...  I could be riding in the car, or smoking brisket at 2 AM, or on vacation without a computer, and just login and write something.

I wanted that back - a posting solution from my cellphone.

The reason I lost that ability is because the simplest update process for Hugo is:

1. Create a new markdown file in the correct directory
2. Write markdown in it
3. Run hugo to recompile your site
4. Package the site for upload
5. Upload the site to your webhost
6. Unpack the site into the correct directory

My actual process differed a little, and I had some ways to do some of those things automatically, but the important thing is:

> **All resources are on my computer**

With Wordpress everything was in the cloud.  

Some solutions:

1. Use GitHub for storage and editing, Travis CI to rebuild, and GitHub Pages for publishing
2. [Put a copy of Hugo on my Dreamhost account](https://robinforest.net/post/hugo-questions/), then create, edit, run hugo, and deploy via SSH (I can do that from my phone)
3. Write in my email, then update when I get back to my computer
4. Rig some stuff up

I didn't want to use GitHub Pages - they're great and I use all of option one for project websites, but I wanted my stuff hosted via Dreamhost since I'm using them...

I didn't love number 2 because the editing solution over SSH on the cellphone is really awkward.  And, that binary of Hugo is just one more thing to keep up-to-date.

Number 3 is just giving up.

I went with option number 4.  This post is about rigging things up.

# Rigging What?

Target end-state:

1. Blog repo storage on GitHub
2. File creation and editing via GitHub, or in a draft email then I paste it into GitHub
3. Travis CI to build with Hugo
4. After build, signal my Dreamhost server that a new build is available
5. Git pull the repo onto Dreamhost to update the site

So - steps 1 and 2 are built-in to GitHub.  I created a repo on GitHub, then updated the repo on my computer to point to it, and pushed everything onto GitHub.  This is a publicly-available blog, so the source is public too.  It's pretty easy to create a new file in a spot within a repo, but saving it generates a new commit.  I'll probably generally edit in email then paste in so I only make one commit.

# Setting Up Travis CI to Build

Step 3 I've already had success with previously.  To set this up, first add Travis CI to your GitHub account.  Create a branch named `gh-pages` (make it empty, preferrably, but this is not necessary).  Create a "Personal Access Token" on GitHub (Profile Settings-\>Developer Settings-\>Personal Access Token).  Save that token code as `GITHUB_TOKEN` under the repo's settings' Environment Variables section on Travis CI (go to Travis CI's webpage, login, select your repo on the left, select the hamburger menu on right, then settings).  Then, create and commit this file into your repo:

`.travis.yml`
```yaml
language: generic
install:
  - sudo snap install hugo

script:
  - hugo

deploy:
  provider: pages
  skip_cleanup: true
  github_token: $GITHUB_TOKEN
  keep_history: true
  local_dir: public
  on:
    branch: master
```

That'll build your site and deploy it into the "gh-pages" branch (the one typically for GitHub Pages, but don't set that up and GitHub will ignore it).

# Signalling Dreamhost and Git-Pulling

Steps 4 and 5 were the slightly trickier part.  The best thing I came up with was a PHP file located on the server in a spot that wouldn't get overwritten by site updates...  I have a separate domain on there that I used.  The PHP file looks like this:

```php
<?php
  $trigger_code = "PUT SOMETHING NOBODY WILL GUESS HERE";
  if( $_POST["code"] == $trigger_code ) {
    shell_exec("/PULL/SCRIPT/PATH/pull_script.sh");
    echo "triggered";
  } else {
    echo "!triggered";
  }
?>
```

Basically - when someone does a POST request to this script's URL, and they include `code=YOUR TRIGGER CODE` as POST data, this script will run `pull_script.sh`.  Pull script looks like:

```bash
#!/bin/sh
EXECUTION_OUTPUT=`echo "DEPLOYING SITE 1" && cd ~/SITE_DIRECTORY_1 && git pull`
EXECUTION_OUTPUT="$EXECUTION_OUTPUT\n\n\n$(echo DEPLOYING SITE 2 && cd ~/SITE_DIRECTORY_2 & git pull)"
echo -e "$EXECUTION_OUTPUT" | mail -s "Execution output" YOUR_EMAIL@EMAIL.COM
```

When the PHP runs the pull script it'll change into the correct directory and run a git pull.  If you have multiple sites, that second line will deploy a second, then you can use it more times as needed.  The output will get emailed to you so you can see what's up.

Make sure you fill in the necessary directories, paths, script names, a trigger code (I made this a long random hash - nobody will guess it), and your email address.

Oh yeah - you need to set your Dreamhost website directory up...  So, your site is going to get messed up for a minute (you can get around this problem by renaming things later...  you can figure that part out).  Set up your directory by moving/removing the current one (delete `~/blog.notmet.net`, or whatever your site directory is).  Now `git clone` your GitHub repo into Dreamhost home directory.  Rename that repo clone as your site directory, if it isn't already.  Now CD in there and `git checkout gh-pages`.  You should be on the `gh-pages` branch now.

> This exposes your site's `.git` directory to everyone on the web, which may be a security issue - see the end of this for info

OK!  Now we just need to tell Travis CI to make a POST request to this URL with the right code after a build is successful.

First - add two more environment variables to Travis CI on your repo:

* `PULL_CODE` - make this the `trigger_code` you made up for your PHP script
* `PULL_ENDPOINT` - make this the URL to your PHP script

Now update your `.travis.yml` file to have a blank line followed by this at the very bottom:

```yaml
after_deploy:
  - curl -d "code=$PULL_CODE" $PULL_ENDPOINT
```

Travis CI images have curl installed by default.

Pushing this updated file to your GitHub repo should cause a site build.  Then the `after_deploy` curl trigger to Dreamhost.  Then Dreamhost should `git pull` the build.  Then it should email you the output from the pull...  Then you should see your website!

Only gotta set this up once, fortunately.  I think it's pretty slick.

# Git Directory Exposure

So, [exposing the `.git` directory can be a vulnerability](https://en.internetwache.org/dont-publicly-expose-git-or-how-we-downloaded-your-websites-sourcecode-an-analysis-of-alexas-1m-28-07-2015/).  **Can** is an important word in that sentence, though.  If you set your GitHub sourcecode repo up as "public", I don't think exposing your `.git` directory reveals anything to attackers.

But if you have something in your history that might be sensitive, it's visible if the .git directory is accessible.

So - let's block access.  It's easy enough.

Add this line into your site's `/static/.htaccess` file:

```htaccess
RedirectMatch 404 ^/.git/.*$
```

My full `.htaccess` file looks like:

```htaccess
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}
</IfModule>

Redirect /feed/ /index.xml
RewriteRule ^wp-content/(.*)$ https://static.notmet.net/wp-content/$1 [R=301,NC,L]
RedirectMatch 404 ^/.git/.*$
ErrorDocument 404 /404.html
ErrorDocument 403 /404.html
Options -Indexes
```

That makes sure users are on HTTPS, and redirects some old Wordpress directories to fit the new Hugo setup.  Then I block `.git` directory access, setup the error response documents, and disable directory indexing.
