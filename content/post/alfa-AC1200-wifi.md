---
title: "Alfa AC1200 WiFi in Debian"
date: 2020-05-05 16:50:00-06:00
draft: false
categories:
- Blog
tags:
- Debian
- Linux Drivers
---

I recently built a new desktop computer, and wanted a WiFi adapter that worked well for all kinds of Linux-y things...  I'm not normally able to plug the desktop in over Ethernet, so WiFi is a simple choice.  After my first purchase on Amazon got delayed and screwed up, I went with the USB Alfa Network AC1200 - full model number AWUS036ACH.  This is reviewed pretty well, and folks say the drivers are capable of all kinds of things.

Anyway, plugging it in, the drivers are not immediately present in Debian.

At this point I had a few options:

1. try to find an official deb package containing the driver
2. try to find some unofficial deb package with the driver
3. build from source

It looks like Debian has no package for this, so option 1 is out.

Option 2 is never my preference, since this can introduce dependency issues to the distro.  Option 3 will probably require me to rebuild the driver every time Debian updates the kernel - which has been happening fairly frequently recently.  That would be extremely frustrating.

Kali has support for the driver in a package called realtek-rtl88xxau-dkms.  Kali is a Debian-based distro, but adding their full apt source was not appealing for the likelihood of accidental dependency issues.  I was able to [download the package from their package pool](http://archive.kali.org/kali/pool/contrib/r/realtek-rtl88xxau-dkms/).  I downloaded the .deb file.

> Debian will build the module for whatever Kernel version I need

This fact is what induced me to write this post.  After downloading the package, I used apt to install it and Debian built exactly what I needed automatically.  It looks to me like Debian will automatically rebuild the module later when the kernel updates, too.

This really blows my mind - it's exactly what I was hoping to find, an easy way to install the driver and keep it installed across kernel updates.

After installing via apt, I unplugged the adapter and plugged it back in, it was automatically detected and the kernel module loaded, and I had WiFi.  Very cool.

The caveat is - if I want to actually update the driver I will need to re-download it.  Since I did not install the apt source I have to do that part.  This is less important to me than getting the kernel updated and having everything keep working.
