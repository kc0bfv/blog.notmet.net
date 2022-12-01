---
date: 2022-12-01 17:25:00-05:00
draft: false
title: An Elegant Puzzle
categories:
- Blog
tags:
- Leadership
- Books
- Things I Hope I Remember
---

I'm reading *An Elegant Puzzle: Systems of Engineering Management*, by Will Larson, at the recommendation of a good friend, and wanted to take some notes on it.

First, the book is gorgeous.  I've got a hardcover copy via interlibrary loan (thank you Meridian Library District, near Boise, ID, and thank you San Antonio Public Library), and the cover is bright white rough linen with black text and printing, and a black line drawing of a bush on the front cover reminiscent of an organizational structure, data structure, or actual organic bush.  The back has only the printer's logo and name in black print.  The chapters are nicely printed on full pages, which makes them easy to locate in the book.  Also easy to locate are the figures, which are on bright yellow/orange pages, while the other pages are bright white and slightly thicker than book pages I'm used to.  The references section in the back is broken out by chapter, and instead of the usual bibliographic BS there are URLs with QR codes.  I've long felt it's time to move away from standard bibliographic formats, especially ones where URLs are optional, and to something that emphasizes easily accessing the relevant data digitally.  (Although, URLs break, so I would include some information with the URL, and for a book I might have a separate website with the full information...)  So I'm enjoying just holding this book.  It also seems informative.

# Chapter Two

Chapter two discusses "organizations", in the following sections.

## Sizing Teams
"Managers should support six to eight engineers."

"Managers of managers should support four to six managers."

"On-call rotations want eight engineers."  And combining teams to support that kind of on-call load can be very stressful when someone is called to support something they aren't intimately familiar with.

"Small teams (fewer than four members) are not teams."  They act more like individuals, as in, when one person takes leave a significant capacity and function of the team is unavailable and therefore the team is broken.

"Keep innovation and maintenance together."  "You'll get higher morale and a culture of learning," "you'll avoid creating a two tiered class system of innovators and maintainers."

This team sizing guidance seems a little like a silicon valley dogma to me...  In that, I'm skeptical of the data behind the guidance.  But Will presents it as coming from his experience and I think it's certainly useful to consider team sizing carefully.

I do often think of how to accomplish software projects with extremely minimal teams, and for projects that are small I think throwing the smallest team possible at them brings ownership and goodness.  I think Will's experience comes from larger projects.

Regardless of specific prescriptions for team sizes, team sizing is an important heuristic that encompasses manager overload, team member interaction ability, and team member/manager interaction quality.

## Staying on the Path to High-Performing Teams

He presents four states of a team then discusses strategies for progressing each into the following one.

* Falling behind - each week backlog gets longer - add people
* Treading water - backlog is stable but tech debt is not improving and new projects are not possible - reduce work in progress (WIP)
* Repaying debt - tech debt is coming down and teams are starting to benefit from it - add time
* Innovating - tech debt is sustainably low, morale is high, new work is satisfying user needs - add slack

I'm not sure I agree with the prescription to "add people" when a team is falling behind.  That's certainly one solution, but simply adding more people does not always make the work faster.  If the work done by the team can split into multiple decoupled projects that teams can work on autonomously, then you may be able to move out of "falling behind" by adding people, then splitting the team along the decoupled project lines to maintain reasonable team size...

I think de-scoping can also help significantly with "falling behind".

Limiting WIP is amazing - the goal is to help folks start paying down technical debt, which improves team productivity as a whole.  This is one of those things something like the 90th's "R&R" can help accomplish.

I agree with all these prescriptions then completely, after "add people".

> Tactically, ensure that the work your team is doing is valued: the quickest path out of innovation is to be viewed as a team that builds science projects, which inevitably leads to the team being defunded.

Oh man I love that little note.  Right on.

## Consolidate your Efforts

This one is accompanied by a figure, strangely not on a yellow page, but it shows how if you spread investment across multiple projects simultaneously, at any point in time until the end you'll only have a little bit of ROI on any one project.  At the end you get big ROI all at once.  That's because, in part, you necessarily get little ROI for a long time at the beginning of a project, then at some point you cross the boundary of MVP (or maybe Significantly Valuable Product) and your ROI compounds just by letting folks use it and making small improvements.

If, instead, you concentrate your investment on one project at a time, you can start reaping significant ROI from the first project that reaches Value, then tackle the second while the first's value is still :rocket:.

## Durable Excellence

These improvements, he points out, are not quick fixes, but they are durable and provide real improvement in happiness and throughput, then compound.

I'd say - they tend to make your system more stable as a whole, and push you away from instability.  Like, in an engineering negative reinforcement sense.

## Ways to Manage Entropy

Funnel my interruptions (and higher-level interruptions) down to an increasingly small area.  Demand my managers do the same for their teams, and tell them to let me know when I'm not doing it sufficiently.  Automate this as much as possible.

This reduces interruptions on people, and empowers them to manage them in sensible ways.  Think - telling someone to only focus on additional duties for a specific period per week, and to have a specific email box for those additional duties, and to politely require people to file emails to that inbox instead of in other ways.  Thus making it unlikely those duties will interfere with them.

To empower that, also have a tool that answers, "who owns X?"  This is what I've been trying to do with additional duty rosters, but you can pair that with, "here's the email address/request form for this specific duty".  That way when folks need to use X they can look up who does it (without disturbing other people by asking around), then employ it the right way (through the funnel) thus not interrupting the specific duty person until the right time of the week.

Internal documentation of processes, and a culture of creating and reading and searching that documentation, further reduces interruptions of people.

## Dealing with Organizational Debt

"These problems bubble up from your peers, skip-level one-on-ones, and organizational health surveys.  If you care and are listening, these are hard to miss."  Yes, *I feel* this.

"What I've found most successful is to identify a few areas to improve, ensure you're making progress on those, and give yourself permission to do the rest poorly."  Write up the plan with your manager explicitly and agree on expectations and reasonable progress...  This seems like a fantastic strategy, and I would include making those expectations and goals transparent to your organization.

This makes them like OKRs - create personal OKRs for your work that address the organizational debt.  This is probably the most important thing for a manager of managers to have OKRs about, I'd say.

I'm in the military so focusing on improving efficiency and productivity is something I'm always doing, but rarely are people holding me accountable for it (but seriously it's way more fun).  Buying down organizational debt typically involves making your team a better place to work in often intangible ways, and that's going to have significant knock-on effects and buy you a ton of wiggle room in productivity.

## Succession Planning

This section was also fun and is basically exactly the process I went through when I was leaving RANS and there was no backfill.

# End of Line

Ok, well, that was chapter two.  This may be a book I buy.