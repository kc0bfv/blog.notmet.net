---
title: "OpenVMS"
date: 2021-11-23T09:25:05-06:00
draft: true
categories:
- blog
tags:
---

I need to look into OpenVMS a little.  This is an operating system back from the VAX days - this is the VMS that ran on VAX...  It's still around apparently in a few different critical infrastructure arenas.  I'd like to know more about it - there are some interesting features available for systems designers.  One that makes it interesting for areas that require high availability is the support for node failover in a cluster.  My understanding of this feature is that entire nodes can stop responding because they were rebooted nicely, or even just lost power, and other nodes can pick up where the failed one left-off.

This is an interesting feature to me - and just understanding more about this operating system sounds valuable to me.  I'd like to learn more about it, and it seems possible to do so via emulation, because I don't own any VAX or Alpha hardware.

I'd like to get a crash course in OpenVMS and write here along with my learning.  This looks like it will be significantly different from the Unix-like and Windows operating systems I've got experience with.  The areas I'd like to cover are:

* Setup
* Built-in utilities
* Network configuration
* Clustering
* Programming
