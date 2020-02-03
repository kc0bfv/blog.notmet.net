---
author: finity
date: 2018-06-16 15:03:51+00:00
draft: false
title: Confidentiality and Integrity vs Availability
type: post
url: /2018/06/confidentiality-and-integrity-vs-availability/
categories:
- Blog
tags:
- leaveweb
- network security
---

In computer security, there are three main axes for consideration - confidentiality, integrity, and availability (CIA).  These are commonly thought of as things you desire out of a secure system.  You want your communications to only be available to the intended agents, you want them to remain unchanged except when you intend them to change, and you want them to be available when you need them.  Preferably, you want your communications to have all of those properties.


> Organizations make trade offs between CIA daily, and in the real world increasing one necessarily decreases another.


This fact is obvious to most network security practitioners - but only considered in theory.  In practice, organizations trade off CIA each time they make a decision about their information systems.

This fact is not obvious to an organization's decision makers - management.


> Most computer security decisions seek to increase confidentiality and integrity without considering the costs to availability.


This is visible primarily in the standard Information Technology world, as contrasted to the SCADA/ICS Operational Technology world where most recognize availability as king.

To demonstrate C&I vs A, consider the way we "improve the security" of our information systems in the traditional IT world.  Improvements generally focus on the C&I, and they do so by adding defense in depth, or defense in breadth.


## Depth


Defense in depth, first.  Add a security measure to your IT system that is of a type not currently available - add a firewall, an IDS or IPS, include SSL introspection, endpoint virus scanners, host-based firewalls, host-based anomaly detection...  There are always new ways to add defense in depth.

These are methods that directly add fragility to your IT system!  This type of fragility is similar to a child's model bridge that is supported by one popsicle stick at each end, perhaps leaning against a wall.  Popsicle sticks snap, breaking the bridge, in the same way that network infrastructure has the potential to disrupt your network.


> Security infrastructure components have a non-zero probability of causing a problem with part of your organization's mission.


When you add defense in depth, you are gluing a popsicle stick to the bottom of the bridge's current supports.  You're making those bridge supports longer by one popsicle stick.  Now the chances of the bridge breaking have increased - the older stick can snap, or the newer, or both.  The probability for the older stick snapping and the bridge breaking remains the same, but you've added in a new possibility with the new stick.

In network security a popsicle stick snap looks like a device blocking legitimate traffic (false-positives), a device providing a new attack surface area for adversaries, a device adding just enough to the packet TTL that delivery fails, or a device delaying traffic long enough to disrupt communications at higher levels in the network model.

Adding defense in depth can provide benefit to confidentiality and integrity, but increases network fragility.  An increase in network fragility necessarily reduces network availability.  The reduction in availability may be difficult to detect, and most of the time has negligible effect.  However - networks are in place for months and years, and over that time the availability reductions become noticeable.


## Breadth


Defense in breadth is again like gluing an additional popsicle stick to the end of the existing bridge supports!  It is not similar to taping a second popsicle stick to the existing ones, nor is it similar to adding another connection point to the bridge for a popsicle stick.

Defense in breadth is adding a second version of an existing defensive measure with the idea that, if the first didn't catch a bad guy maybe the second will, and we'll still have caught the bad guy.  Increasing defense in breadth by adding measures to the system has all the same negatives as increasing defense in depth, all of the same outcomes, and increases fragility of the system in the same way.


> Adding network redundancies can improve availability, but stretches manpower, limiting the benefits of redundancy to availability.




## Practice


In practice, manpower is limited.  This is as true in the field of network security as it is in every other field.  The limited manpower that is monitoring your networks today is having some amount of success - you are able to use your networks with some level of CI&A.  By increasing the number of defensive measures those employees must maintain, and increasing the redundancy measures they must maintain, you are requiring more of those limited manpower resources.  This is all in addition to the growing size of other parts of your enterprise and the growing network requirements of our information age.

There is, of course, a rate at which you can increase C&I defenses, and increase network redundancy, and increase manpower, and remain in front of your decreasing network availability.  However, increases in organizational size increase complexity and decrease your return on investment.


> Implementing new confidentiality or integrity measures at a constant rate requires exponential increases in availability investment.


This is unsustainable!  Not to mention the fact that every organization has monetary resources and management motivation that will give out long before availability is substantially improved.

Of course - this type of problem has been common in history.  Automation technology and process improvements (defensive/operational tactics) usually save the day, and they can here too, but they are one more thing that will add complexity and fragility to your network, thus reducing availability.  The measures become self-limiting in the same way as before.

Others have discussed the trade offs in C&I vs A - however the idea that C&I trade off vs A is mostly found in discussions of availability's more human needs.  [For example, the idea](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.153.3974&rep=rep1&type=pdf) that increasing C or I by implementing password restrictions makes it more likely that a bank manager will forget their password, and therefore will be unable to run the bank, decreasing availability.  [Another paper discusses](http://discovery.ucl.ac.uk/20102/2/pym-weis-2008.pdf) how confidentiality decreases as redundancy measures (availability) increases, due to increased attack surface area.  However, I have seen very little discussion of a decrease in availability of the underlying technical network consequent from implementing new confidentiality and integrity measures.  I have seen ample evidence of this, though, especially in the business networks I a most familiar with.

Managers of the networks I'm familiar with regularly mandate new security measures, nearly always designed to improve confidentiality or integrity.  Availability issues are always cropping up, and network complexity is rarely considered as a possible cause.  Network complexity is almost never fingered as a problem worth fixing, and increased manpower is always the solution.  Increased manpower is also rarely politically practical.

Lastly - this thought is related to the idea of byzantine failures causing catastrophe within a complex system.  Availability issues are simply the small catastrophes leading up to the major one.


## What to do, what to do...





* We must remember that measures designed to increase confidentiality and integrity necessarily decrease availability.
* We must be bold enough to consider eliminating confidentiality and integrity measures.

Most of all, though,


_**We must always balance the risks related to confidentiality and integrity vs the risks to availability.**_
