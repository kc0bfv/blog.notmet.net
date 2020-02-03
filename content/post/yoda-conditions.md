---
author: finity
date: 2011-04-22 16:12:00+00:00
draft: false
title: '"Yoda" Conditions'
type: post
url: /2011/04/yoda-conditions/
categories:
- Blog
tags:
- a tag this is
---

[Here's a creative idea](http://united-coders.com/christian-harms/what-are-yoda-conditions) I'd never considered before.  I've written code like this, but accidentally, and then it looks wrong so I change it back.  Here's a quick example:


**if ( 42 == myInt )**  as opposed to  **if ( myInt == 42 )**


The former may be better to use because occasionally we all forget to put that second "=" in there, and we accidentally turn our comparison operator into an assignment operator.  Compilers will complain if you try to assign a value to "42", but not if you try to assign 42 to a variable, and that'll make it easier to catch your mistake.
