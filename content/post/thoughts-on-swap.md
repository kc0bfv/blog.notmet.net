---
author: finity
date: 2020-01-08 13:00:00+00:00
draft: false
title: Thoughts on SWAP
type: post
url: /2020/01/thoughts-on-swap/
categories:
- Blog
tags:
- air force
---




I just finished reading the SWAP study.  The thrilling congressionally-mandated ["Software Acquisition and Practices" study conducted by the Defense Innovation Board](https://innovation.defense.gov/software/).  292 pages of discussion about the US government's software acquisition practices.







It's actually quite a bit funnier than you'd expect.  Admittedly, it helps to be in on the jokes.







These are the same folks that brought us: [Detecting Agile BS](https://media.defense.gov/2018/Oct/09/2002049591/-1/-1/0/DIB_DETECTING_AGILE_BS_2018.10.05.PDF).  A document which is unexpectedly funny, for a government report, and accurate.







If you're interested in the topic, the SWAP study deserves a read.  The Extended Abstract and Executive Summaries will probably get you most of the way, and don't take long.







There's a bunch of other great stuff in there, and the report kicks off by explaining why anyone should care about software development in the military, and why we know we're screwed up on it.







Some oft the recommendations that piqued my interest, though, as someone interested in how the DoD manages software development talent:





  * Fundamental theme two of three: Digital talent matters because software is made by and for people.  We need organic military and civilian software capabilities.
  * Line of effort two of four: We must create digital infrastructure to enable "rapid deployment, scaling, testing, and optimization of software".
  * Services need to build this, and we need to incentivize it's use - **even by contractors...**
  * We need fully-automatable approaches for test and eval.
  * We need approval to use these things across services once one service has approved them.
  * Line of effort three of four: Software development must be a high-visibility, high-priority career track.  All services need units with mil and civ personnel that develop and deploy software using DevSecOps practices.





I think those recommendations are right on, and have been advocating for each of them for years.  I'm glad to see a report to Congress I can cite now.







Another bit of the report I loved was the comparison between DoD's management of medical/legal professionals and software developers.  Individuals practicing those skills are managed very differently from the rest of the force because their skills are vital to the military, difficult to attain and maintain, and highly sought in the private sector.  Software development skills tick all those same boxes, yet, "software developers, designers, and managers in the Services must practice their skills intermittently and often without support as they endure frequent rotations into other roles."







A great quote I've not heard so succinctly before:







> Speed increases security. Conventional wisdom in DoD says that programs must move slowly because moving quickly would threaten security. Often, the opposite is true.







As soon as anyone knows about a bug they can start to accomplish the other activities required to exploit it and close the kill-chain.  Thus, the longer that bug is exploitable on a system, the more likely it is to be exploited.  Speedily fixing it shuts down the adversary's kill chain.







The paper goes on to explain that if we can, "deploy software faster without sacrificing [ability] to test and validate software", we'll have more secure systems.  And this sounds like a no-brainer, of course.  And folks who haven't heard of DevSecOps will think this is an impossible pipe dream involving Unicorns.  But those folks should read The Phoenix Project, or any of the success stories surrounding DevOps/DevSecOps.







Our software development must be a continuous flow in many ways.  Software is never "finished", although we may choose to stop developing it.  Many of the "steps" (dev, test, integrate, test, deploy...) should all happen at the same time, with developed code flowing through those later stages automatically.  Money must flow continuously for these activities, and should not be discretized between activities.  The report explains all these things.







Two more recommendations from the report that I've long-advocated...







> "Require program managers to stay with a project to its end."







I learned this in my introduction to acquisitions course.  This has long been one of the ways the private sector avoids project disaster.  We teach this bit of knowledge to our acquisition workforce, then require/incentivize them to move frequently.







> "Shift from certification of executables, to certification of code, to certification of the development, integration, and deployment toolchain, with the goal of enabling rapid fielding of mission-critical code at high levels of information assurance."







Certification generally involves a staffing exercise, often up to very high levels of leadership.  Those folks are not individuals who understand why or if something should be certified, but through the staffing process those individuals/teams (hopefully) buy-in on the certification.  Then the leadership reviews that buy-in and signs, sealing the whole deal.  It makes a lot of sense, honestly, and has the added benefit of pinning responsibility on a person who must take responsibility.







But it's extremely laborious.  And the most obvious thing to certify, the executable, gets replaced (and therefore re-certified) every time there's an update...  So updates are stove-piped and slowed due to human-process reasons.







A way to avoid that issue while still providing the same buy-in guarantees is to certify a process instead of a product.  We do this all the time in other parts of the military, notably when a regulation mandates that individuals holding specific roles accomplish specific tasks/reviews/etc.  We can do it with software by certifying automated systems and processes too.  Then those things can operate as quickly as they can execute (much more quickly than human processes), and produce outputs that are certified by extension.







This gets to the heart of that digital infrastructure line of effort.  But - instead of keeping it in-house we'd open it up for organic and private-sector developers to employ, and we'd share it across services.







Totally awesome ideas.



