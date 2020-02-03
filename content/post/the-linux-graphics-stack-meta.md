---
author: finity
date: 2012-10-02 15:13:04+00:00
draft: false
title: The Linux Graphics Stack - Meta
type: post
url: /2012/10/the-linux-graphics-stack-meta/
categories:
- Blog
---

Jasper St. Pierre [explains the Linux graphics stack](http://blog.mecheye.net/2012/06/the-linux-graphics-stack/) in detail.

I think X11 is the most complex piece of software I've ever tried to work with.  It has been a long time since I've had to open up xorg.conf (and before that I think it was x11.conf) to fix something that's broken, and that's a testament to the quality of modern versions of Ubuntu and Debian.  But there was a day when I had to open that massive config file up quite often to get the video card, or mouse, or keyboard or whatever working properly.

Maybe 5-10 years ago, trying to get games to work well was a pain.  Frequently when the distro packages would update, or the video card driver would update, or I'd update the kernel, the stack of cards that is OpenGL would break.  I remember being confused by what all the libraries (libGL.so...), packages (Mesa) and config files were doing, and how they all fit together.

Well, [this blog post](http://blog.mecheye.net/2012/06/the-linux-graphics-stack/) puts it all in context.


> 3D rendering with OpenGL
> 
> >
> >
> 1. Your program starts up, using “OpenGL” to draw.
> 2. A library, “Mesa”, implements the OpenGL API. It uses card-specific drivers to translate the API into a hardware-specific form. [...]
> 3. libdrm uses special secret card-specific `ioctl`s to talk to the Linux kernel
> 4. The Linux kernel, having special permissions, can allocate memory on and for the card.
> 5. Back out at the Mesa level, Mesa uses DRI2 to talk to Xorg to make sure that buffer flips and window positions, etc. are synchronized.
> 
> 2D rendering with cairo
> 
> * Your program starts up, using cairo to draw.
> * You draw some circles using a gradient. cairo decomposes the circles into trapezoids, and sends these trapezoids and gradients to the X server using the XRender extension [or] libpixman [...].
> * The X server acknowledges the XRender request. Xorg can use multiple specialized drivers to do the drawing.
> 
> 1. In a software fallback case [...] Xorg will use pixman to do the actual drawing [...].
> 2. In a hardware-accelerated case, the Xorg driver will speak libdrm to the kernel [...].



The post goes into much more detail about how all the pieces fit together.  To me, the most enlightening part was where Mesa actually fits into all this.  I've always been confused about why I need a copy of Mesa when I've also got the GL libraries provided by Nvidia or whomever.

One thing I still need enlightening on is why Nvidia still keeps their driver source secret.  What kinds of proprietary things would Nvidia be doing in there that's critical to keep secret?  Clearly they want their hardware designs proprietary, but surely the driver source can't reveal too much about the hardware design that would actually help a competitor...
