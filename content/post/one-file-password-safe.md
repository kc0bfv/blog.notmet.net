---
title: "One-File Password Safe"
date: 2022-09-08T15:25:00-06:00
draft: false
categories:
- Blog
tags:
- Programming
- Anti-Cloud
- JavaScript
- One-File Tools
---

TLDR: if you need a one-file HTML/JS password safe check out https://passpilot.com

<!--more-->

This is a follow-up to my earlier one-file tool post, which is under the "one-file tools" tag.

I've been wanting a one-file password safe for a long time.  At work I do not have access to a password safe and have resorted to using an encrypted Word document.  This is not as insecure as it once was - but ergonomically it stinks.  It also doesn't help me with two-factor tokens, but I wrote a little Javascript to help with that.

I really am not supposed to need passwords much at work - or two factor tokens.  We have had a widely deployed, nice, secure two factor solution for years - smart cards.  I think smart cards are fantastic - I acknowledge that they have problems but I think the tradeoffs are pretty nice and compare favorably to other solutions.

Anyway - I still have lots of times where I have to use a password, or two factor TOTP, or both.  I want to use good passwords so I have to store them outside my brain.

A password safe I can use at work needs to meet these requirements:

* Approved by my organization - this is not something I can accomplish myself, and there's no real system for me to get software approved, so basically I can count on a web-browser and Microsoft Office.  Thus - HTML/JS or macros.
* Requires no resources external to my network - our network security is no joke, and our policies are no joke, and I also take them seriously, so I want all resources to remain on my desktop or work network.
* Needs to support TOTP - this is a compromise in how TOTP is supposed to be used...  But some things require 2FA TOTP and I have no other solution than to store the token like a second password, then run the TOTP algorithm on it when needed.  Ideally then my password safe would support it built-in.
* Better than an encrypted Word Doc.

That leads me to my discovery today...

### [PassPilot](https://passpilot.com)

It basically meets all those needs up there.  There's also a cloud storage version.  The interface looks great...  Check it out.

I need to verify that it makes no resource requests, but initially it doesn't seem to.

It's open-source-ish - by which I mean that while there's a Github, the source is basically just the final HTML/JS/CSS file.  I suspect the author had some other build components that got compiled into that combined file but :shrug:.

Check it out.
