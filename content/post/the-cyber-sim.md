---
author: finity
date: 2019-08-04 22:36:06+00:00
draft: false
title: The Cyber Sim
type: post
url: /2019/08/the-cyber-sim/
categories:
- Blog
tags:
- Stories
- Cyber
- Air Force
---




**_This is a fictional imagining of what could be._**







Dear Journal,







I took a refreshing break from my staff job today to keep up my "mission qualification", and it really re-centered me.  Sim time is something only pilots used to talk about, but the new "cyber sim" concept has brought that idea into the info ops world.  Stupid name, great concept.







I took my laptop out to the local library and sat in a back room one of the squadrons borrows regularly.  I set out my coffee and turned my noise cancelling headphones on to the Swordfish soundtrack on repeat.  I SSHed in to the cyber sim virtual machine and got started.







This quarter the sim works like a jeopardy-style capture-the-flag.  I say "this quarter", because the sim is updated quarterly by a rotating team of nerds working out of the 49th IOS Det in San Antonio.  The top contestants from the previous quarter get invited out for a two week TDY to invent new challenges, improve the scoring systems, add the occasional Easter egg, and feed their excellent skill back to the rest of the force.  The interaction and teamwork those top nerds get is almost a more valuable training experience than the sim they end up producing.







Categories this quarter were several of the typical: algorithmic problems, malware reversing, embedded device hacking, Windows service exploitation...  One of the special topics this time was Android exploitation, though.  It's tough to shoe-horn an odd topic like Android exploitation into an eight hour block, and even tougher to reward participants sufficiently to get them to spend time on the problem, but this quarter it was well-executed.







Just last month some researchers publicly released a simple exploit for the Chrome JavaScript engine.  Well - simple once you know where it is...  Their proof-of-concept (POC) didn't work on Android though, and with the speed at which the Chrome team publishes updates nobody released a public exploit beyond the POC.







The Android exploitation challenge this quarter was to create an Android POC.  The quarterly sim build-out team setup Android VMs with the correct version of Chrome, then added in some custom Chrome crash detection software.  Upon causing a Chrome crash, participants got full points for two entire CTF categories.







The risk-reward calculation was critical here...  My strength often lies in solving the algorithmic challenges.  I can finish the entire category in about three hours, then knock out the easy half of the malware reversing and embedded device categories.







A public x86 POC was released already...  How tough would it be to get a crash on ARM Android in eight hours for the same bug?







I bet on the Android vulnerability and got started.







After an hour I had fixed the obligatory POC bugs and could replicate the researchers' attack on Chrome x86.







After two I was starting to understand the vulnerability and was thinking about the differences between the current POC's target and the target devices.







After three I had my second target environment setup.  I needed two because the first one was 32-bit, and I realized after about 45 minutes that the CTF targets were 64-bit.  Oops.







Hour four I spent building a version of the POC that was written in a way I actually understood it and could debug.  The researchers didn't leave in much debugging code...
Hours five through seven I spent slamming my head against the keyboard wondering why everything was suddenly so difficult.







But in hour seven I had a breakthrough, and occasionally got Chrome crashes.  Good enough for the win, I thought!







After a struggle getting my code to run on the CTF targets, and three attempts at running the code, I had success against the cyber sim target and got the full two categories worth of points.







I was instantly rocketed to the top of the scoreboards!  Apparently nobody else had made my risk-reward choice.







Of course, it was only a matter of time before someone would de-throne me, but it seemed like a solid day in the cyber sim.







Finishing the quarter within the top ten would mean I would be invited TDY to San Antonio next quarter to be part of the CTF creation team.  A blissful two weeks sequestered from email and the needs of the office, spending ten hours a day inventing challenges, trying them out against the rest of the team, and building scoreboard glue-code to make sure we can select the next creation team...  Honestly sounds like a two week paradise to someone like me.







As an O-4, I'm not sure I'd be able to carve time out for that TDY.  I'd probably pass the honor on to someone next on the scoreboard...







I'm thrilled that I have leadership that recognizes the value of this quarterly technical training time.  They have no problem with me scheduling a full day for this, and being unavailable then to the normal office demands.  The simplicity of this sim system, executing it on cloud infrastructure, and keeping it to open-source techniques only has meant that costs are comparatively tiny and access is simple.







Training value is huge though, because this exercise continually reinforces the flexibility our cyber force demands.







Can't wait to see what they come up with next quarter.







-Rosie



---
### Comments:
####
finity - Aug 1, 2019

Consider: playing up more the benefit of building this system as training, open range concept, how to propose "think bigger" ideas.
