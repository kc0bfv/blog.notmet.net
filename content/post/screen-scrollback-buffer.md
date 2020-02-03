---
author: finity
date: 2012-08-31 17:05:05+00:00
draft: false
title: Screen Scrollback Buffer
type: post
url: /2012/08/screen-scrollback-buffer/
categories:
- Blog
---

I end up using GNU "screen" a lot.  It lets me SSH into my laptop, run something, then close the SSH connection with the task still running in the background.  Later I can SSH in and regain control of the task.  It's helpful for Counter-Strike server admin, compiling stuff, or building a test corpus...

Anyway, screen interferes with the regular terminal's ability to scroll back and view previous program output.  Today I found [a description](http://www.samsarin.com/blog/2007/03/11/gnu-screen-working-with-the-scrollback-buffer/) of how to fix that problem.  To set the scrollback buffer size:


> Hit _C-a (Ctrl-A) :_ to go to the Screen command line and type _scrollback num_, where _num_ is the number of scrollback lines.


That's Ctrl+A followed by a colon.  Or add a command to your ~/.screenrc file.  To view that scrollback buffer, go into screen's "copy mode":


> To enter scrollback hit _C-a [_. A status line will indicate that you've entered copy mode. To exit scrollback mode, hit the _escape_ button.


He also lists some navigation commands for copy mode, but the arrow keys work fine for me (call me a philistine if you wish).
