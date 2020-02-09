---
title: "Scope: Not Just Mouthwash"
date: 2020-02-10T10:00:00-07:00
draft: false
categories:
- Blog
tags:
- Programming
- Python
---

I'm teaching a Python class which acts as an introduction to programming, for most of the students there.  This is an awesome experience - for me personally because I enjoy this, and for my resume.  I hope to do this full-time someday, but today I've just got 3 sections of the same class.

We're doing a lot of cool things that I should write about some other time - one of them is using a free, open source textbook called, *Runestone - How to Think Like a Computer Scientist*.  It's interactive for students, so not only is it free for them but it's also a better resource.

Anyway, what I wanted to write about here was an example I came up with to help explain variable scoping to an audience who was encountering it for the first time.

I wanted something relatable - a comparison to a concept they'd be familiar with from everyday life.

Groups of friends was what I came up with...

So, I've got several groups of friends, most of them don't know each other because I've met them in different places and at different times in my life.

**High School Buddies**

* Peter
* Jesse
* Brent

**College Buddies**

* Dustin
* Kevin
* Adam

**Air Force Buddies**

* Dave
* Ben
* Mon

These folks don't know each other...  So if I'm hanging out with my High School Buddies and mention Kevin, they'll think I'm talking about some totally different Kevin that we went to high school with.  That's the wrong Kevin!

Each of these groups of friends has a different scope.  They only know about the names in their scope, and not about the others.

Now, I also have a dog, his name is Clapton.

**Karl's Friends**

* Dog - Clapton
* High School Buddies
* College Buddies
* Air Force Buddies

All of my friends know my dog's name.  We go hiking and stuff and I put pictures on Facebook.  All my friends know him.

Clapton doesn't know any of these guys.  The dog doesn't read Facebook.  He and I are in Idaho and all these groups of friends are in other places.

They all know his name, but he doesn't know any of theirs...

This is a different type of scope - Clapton's in my global scope.

Those smaller scopes have access to the larger, global scope, but the global scope can't just look down into the more specific scopes.

This analogy can't go too much further than this...  Actually - in class I used my wife in the global scope, but this breaks down a bit because my wife actually knows all these folks in the friends groups...
