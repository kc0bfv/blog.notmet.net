---
author: finity
date: 2011-03-06 19:07:00+00:00
draft: false
title: MinGW and Cygwin to build a Windows DLL
type: post
url: /2011/03/mingw-and-cygwin-to-build-a-windows-dll/
categories:
- Blog
---

I was writing C++ in Linux - gvim + aterm is my development environment of choice.  I needed to turn my code into a Windows DLL, though, and the following webpage was really helpful.  
  
http://www.mingw.org/wiki/sampleDLL  
  
I installed Cygwin in a Windows XP virtual machine, used Cygwin to install MinGW, modded my code and Makefile a bit based on the samples on that page, then ran "make windows" in that virtual machine.  Everything built great and let me put my code into LabView on a computer which didn't have Cygwin libraries.  Job done.  Thanks MinGW and Cygwin.
