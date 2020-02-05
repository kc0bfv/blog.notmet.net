---
author: finity
date: 2012-10-05 14:17:45+00:00
draft: false
title: Python's super()
type: post
url: /2012/10/pythons-super/
categories:
- Blog
tags:
- programming
- python
---

I've been writing a lot of Python lately, and there are some things I love about it, some things I'm uncomfortable with, but nothing I hate.  The super() builtin function makes life a lot easier when you're using Python for object oriented code and have some inheritance going on.  [This blog post](http://rhettinger.wordpress.com/2011/05/26/super-considered-super/) describes the best way I've seen it used so far.

First of all, in Python3 you no longer need to write "super(CurrentClass, self).foo", "super().foo" does the right thing generally.  This is great, because it's easier to change class names, or copy a line of code, without breaking everything.

The blog post describes a simple way of passing arguments to parent classes, too.  The classes must work together, passing all arguments as a dictionary, and callers must name the arguments.  I think that's good practice anyway, especially because when you require inheritance things are already getting complex, and the extra verbosity helps make your intentions explicit.
