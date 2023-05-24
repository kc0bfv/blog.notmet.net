---
title: "The Unicorn Project"
date: 2023-05-21T19:29:26Z
draft: false
categories:
- Blog
tags:
- Leadership
- Books
- Things I Hope I Remember
---

I recently finished The Unicorn Project and found it compelling, as was The Phoenix Project.  I wanted to document some of the lessons it teaches, because they're something I hope to keep in mind while leading a software development unit.  These lessons are "the three ways" and "the five ideals".

# The Three Ways

My thoughts here are expansions of some of the excerpts at [IT Revolution](https://itrevolution.com/articles/the-three-ways-principles-underpinning-devops/).

1. Flow/Systems Thinking
2. Amplify Feedback Loops
3. Culture of Continual Experimentation and Learning

## Flow/Systems Thinking

Consider the performance of an entire system instead of just a part.  One way to look at "the system" is the entire flow of work from product owner, through dev, test, and release into availability for employment.  Another way to look at "the system" is as the literal system people are building.

The former set of processes is what I'll be more concerned about from a command perspective...  The latter will be the focus of several sets of technical leadership under my command.

The former also includes processes outside of my control (developmental and operational test authority).  Some in the unit seek to bring some of those processes under the control of the unit, despite the complications that brings in the broader organizational structures.

It is not required that those processes all be under the unit's control though.  What's important is that the processes be harmonized.  That can exist/fail within one unit's control or across multiple units.  We are all on the same team, ultimately.

Success looks like:

> never passing a known defect to downstream work centers, never allowing local optimization to create global degradation, always seeking to increase flow, and always seeking to achieve profound understanding of the system.

## Amplify Feedback Loops

> Shorten and amplify feedback loops so necessary corrections can be continually made.

Get customer feedback quickly - this is one of the common goals of Agile software practices.  Get quality, integration, production, etc. feedback quickly - this is value that a CI/CD pipeline can provide.

I've been thinking recently about the importance of my unit getting software to production quickly, as in "continuous deployment".  Much of their software executes with lower risk tolerance than something like Facebook, and therefore should be tested and deployed more cautiously.  Many people, considering that risk and their prudent caution, argue that continuous deployment with heavy automation is too risky.

The goals of CD are to shorten and amplify feedback loops though, enabling devs to find issues early and significantly cut the cost of fixing those issues.

I believe we can continuously deploy to environments representative of the final deployment scenarios.  Feedback from those deployments can occur extremely frequently, in a way impossible for the actual deployment environment.  Validation in those representative environments would provide rapid developer feedback, slicing cost, improving developer productivity, and reducing several types of risk.  This likely requires a broad array of representative target environments, but we should be testing like that anyway.

## Culture of Continual Experimentation and Learning

I am already planning to make "taking risk and learning from failure", and "continual experimentation", a hallmark of my leadership philosophy at my unit.  I will talk the talk, but must then walk the walk.  I've long felt this was part of my common beliefs though, so I think it will be natural.  It seems to fit the existing unit culture, too.

Additionally, the philosophy of, "allocating time for the improvement of daily work", and "creating rituals that reward the team for taking risks", are parts of the unit's current "R&R" program (a name which I must change).  The R&Rs manifest as periodic hackfests in the unit.

A final piece of this philosophy, "introducing faults into the system to increase resilience", is something that I currently have no idea how to accomplish in the unit.  It is something we must consider though.

# The Five Ideals

These are neatly summarized at the [IT Revolution website](https://itrevolution.com/articles/five-ideals-of-devops/).

1. Locality and Simplicity
2. Focus, Flow, and Joy
3. Improvement of Daily Work
4. Psychological Safety
5. Customer Focus

## Locality and Simplicity

To me, this ideal is related to the concepts of ownership (in an organization), and code decoupling.  A development team needs to be able to make code changes in one location without affecting other teams.  There are interfaces between teams, of course, as there are between portions of code.  However, these interfaces are better when they're minimized, well-defined, and simplified.

## Focus, Flow, and Joy

It is important to be able to work in small bites that can receive rapid feedback.  The opposite would be to work on a large chunk that can only receive feedback after weeks, months, or years.  In the former you are able to immediately see your impacts, and that is extremely motivating.

It is important to be able to work autonomously for significant periods of time.  If you must stop every hour to get approval or coordinate with some other entity then you lose productivity from context switching, not to mention that you lose joy from loss of momentum.  And that's if you're only switching every hour - if you have to stop every 5 minutes work is dreadful.

## Improvement of Daily Work

The book mentioned that some businesspeople consider projects that improve developer productivity to be more important than projects that deliver features to customers.  This is about buying down the technical debt that holds our teams back.  Too often this work is postponed in service of completing "more mission".  However, if we can slice 10 hours of developer work with 1 hour of work, then we must postpone mission to reap those benefits.

In practice I've almost never seen potential gains that large, and I haven't seen any as great as the ones cited in the book.  However, I do think that my unit prioritizes mission often without considering opportunity-costs for productivity, and I think that we should change that.

## Psychological Safety

People must feel safe in their positions, safe to talk about their problems with coworkers and up the chain of command, and safe to be honest and open in all things.  The unit currently enjoys this safety, I believe, and I must maintain and improve the current culture.

## Customer Focus

We must focus on the core of our mission, and not the context.  The unit currently focuses on accelerating developer productivity, often at the expense of typical Air Force activities.  They have largely removed additional duties from slowing the mission-doers down, and have removed some common concerns like typical leadership development activities.

The mission is currently the core of the unit's focus, and I must keep the focus there too.

I have already seen, however, that the culture results in steering some people away from a future in the Air Force.  The cause is, I believe, that people see the Air Force has no plan in which they can continue to affect the DoD cyber mission as they have in their current unit.  They are not wrong.  The primary solution is then - fix that issue.  The Air Force must provide ways for these elite personnel to employ their skills towards the DoD cyber mission after they leave the unit.  The Air Force must sell a more convincing career path, and engender trust from its personnel.

However, I'm the Air Force too.  I see it as my job to show these personnel the existing paths that are present in the Air Force, to highlight the positive changes the Air Force has made recently, and to show them how they can find a path that fits them as well as possible.  I see it as my job to provide at least one job after the unit that will excite my team.  And, as my job to continually advocate on my people's behalf - for better technical career paths, and technical leader career paths.

# Conclusion

Anyway - it's a great book and a great follow-on to The Phoenix Project.  Is the storytelling a bit amateurish, and are parts a bit contrived?  Yeah, I don't care.  The philosophy is compelling and easy to apply.
