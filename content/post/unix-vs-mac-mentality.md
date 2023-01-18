---
title: "Unix vs Mac Mentality"
date: 2022-12-19T15:47:39-06:00
draft: false
categories:
- Blog
tags:
- System Engineering
---

There are many schools of systems engineering philosophy, but one dichotomy that appears to me more commonly than others.  I think of it as a Unix vs Mac/Windows philosophy.  I'm writing down my thoughts on that here.

Just a disclosure at the start:

Sure Mac is Unix now, but in the same way that Android is Linux - the philosophies that pervade the builders and users of the commonly recognized forms of the latter are significantly different than those of the former.  They're different.

And - I like Mac OS but prefer Debian Linux for myself.

So...

Thinking of systems engineering - building a system of systems that solves a problem...  And thinking primarily of military type problems...

At one extreme there are open systems - the source code is available, they are very modular, components are easily swapped out, parts do one thing and do them well, things break and you can fix them.

At another extreme then there are closed system - source code may or may not be available, design choice between monolithic or modular is not visible to the admin or user, components are not swappable as a philosophy, the system acts as a beautiful monolithic whole, and things don't break and if they do you take it to the nerds to get it fixed.

Few systems clearly fall in one of these ends or the other.

Military solutions need the flexibility of the open system:

* We may design all the parts today, but any of the stakeholders might swap things out later
* Even if it's only us swapping things out, we will have this system for a while and need to be able to shift in unpredictable ways down the road
* Things will break, people will fix them - often the "fixers" will be people the original designers didn't plan for, just whichever knowledgeable person was around and available
* "Line replaceable units" have a long history of success in the military, and similar systems are applicable and useful in software too

What's a "line replaceable unit" (LRU)?  A device, sub-assembly, or box that you can pull out of the larger system, slap in a new copy of the LRU, and keep going.  Sometimes we fix those replaced units in depot, and sometimes we fix them in the field - ideally some mix of both when practical.

This is the biggest piece of this philosophy with a military history.  When a radio stack breaks, a low-skilled maintenance person can narrow it down to one unit then swap out that one unit, bringing a vehicle back online in an hour.  If you've got a trained technician (with a high skill level, and increasingly rare) they can possibly trace the bug in that replaced unit down to a resistor or fuse and swap it out, bringing a (now) spare back online in less than a day.

LRUs are enabled by the Unix philosophy.  With modularity, they allow a medium-skilled administrator to trace a system bug back to a specific unit (hardware device, software service, container, ...) and repair, replace, or work-around that unit.

Under the Mac philosophy the expected solution is to call in the system designer, and take it to their Genius Bar.  If you aren't the system designer, you'll need to reverse engineer the system to determine where your bug is, and this requires a highly-skilled and specialized administrator.

With LRUs you can also swap in something like a new amplifier when someone develops one that draws less power, or a new mixer and encoder section when someone needs to use a new set of frequencies.

This is also enabled by the Unix philosophy.  When technology improves and you want to employ a new quantum-resistant encryption method you modify or replace the existing SSH server or Nginx frontend.

Under the Mac philosophy a replacement needs to work within the current system, if that is even possible.  On actual Mac systems it is increasingly impossible to design software that works within the system.  Limiting user choice makes usability simpler for many, and limits security exposure, and certainly has benefits.  However, it is frustrating for the power user.

So what does it mean to design a Unix philosophy system?  It means building something that enables user creativity.  Instead of building something that tracks tasks, build something like Jira that tracks little tickets with description, metadata, and auditable changes, then build views and examples on top of it that allow users to track tasks, while allowing additional views that users can use to track anything.  Add flexible automation that allows users to do whatever they want.

Often I see people chase a Mac-like philosophy.  I think we think it's possible to create software that solves everybody's problems all in one neat package.  We think that solving the problems of today solves the problems of tomorrow.

Experience tells me that whoever your users are today - it's just a subset of your users tomorrow.  And, if the requirements were small enough to fully solve in the near-term, they will grow and evolve with your new users.  Experience tells me that while broad needs might remain consistent, many small changes will be required as the years go on.  Systems you interface with will change, mission sets will change.  Everything will change.  The neat package will eventually become a messy explosion.

When that happens - the equity that you threw into making much of the system will be wasted.

Instead, if we spend our resources on the underlying systems and the parts that are likely to remain consistent, then build lightweight tools on top and permit others to build low equity tools on top, users will solve their own problems and significantly less time will be wasted.
