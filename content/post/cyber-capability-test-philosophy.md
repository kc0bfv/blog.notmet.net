---
date: 2023-11-19 13:45:00-05:00
draft: false
title: Cyber Capability Test Philosophy
categories:
- Blog
tags:
- Leadership
- Cyber
- Air Force
---

I am fortunate enough to lead the [90th Cyberspace Operations Squadron](https://www.shadowsedge.mil/), a unit that delivers software to enable cyberspace operations for combatant commands and the military services.  Testing is a vital part of delivering software successfully, but there are many philosophies around how to do so.  Our needs around testing are somewhat unique.  This post describes how we need to shape our thinking for the future.

# Today

Today we are in a fortunate position regarding test.  We've got a history of delivering excellent capabilities that meet warfighter needs.  We deliver them more quickly than anybody else, and our connections to operators mean they're on target.

Our reputation is one of discipline.

That discipline has led to accommodation: unlike how many DoD software activities work, we are not currently required to use external test organizations for the capabilities we deliver to USCYBERCOM.  We're not required to use external test orgs for developmental test or evaluation, or operational test.  Our capability champions evaluate our capabilities before they go forward, but we're not required to get some independent operational test organization involved.

Practically, our work requires us to test rapidly and repeatedly.  We must write and run unit tests that validate components work today and continue to work as we build functionality around them and fix bugs.  Employing unit tests regularly helps us validate functionality, ensure interfaces are working correctly, avoid introducing bug regressions, and many other things.  We must write and run functional tests that validate system integration and ensure system functionality.  Running those regularly gives us feedback about the impact of our work, or mistakes, as we're doing the work, so we can fix it immediately.

For many of us - software test is already a must!  Standard DoD test is mainly bureaucracy getting in the way of delivery.  We inherently know the benefit of rapidly building systems within test frameworks that give us immediate feedback, and allow rapid iteration, rapid integration, and rapid delivery into an environment where our customer can give us feedback.

I have seen the organization mainly discuss test from the lens of:

* What frameworks and tools will we use to automate our test?
* How can I get those as part of my pipeline?
* Who is assigned to automate test and validate test comprehensivity?
* Who is going to check the boxes for J9 so I can get the bureaucracy off my back?

This is a narrow philosophy, concerned only with execution.  Most bureaucracy boils us down to an execution mindset and allows us to forget the original goals of the programs.  Because we have slipped outside the typical bureaucratic test framework we must become concerned with more than simply execution.  We must keep the original goals in mind.

# The DoD Test and Evaluation System

> Why does the DoD make such a big deal around test and evaluation?

DODI 5000.89 says:

> The fundamental purpose of T&E is to enable the DoD to acquire systems that support the warfighter in accomplishing their mission. To that end, T&E provides engineers and decision makers with knowledge to assist in managing risks; to measure technical progress; and to characterize operational effectiveness, operational suitability, interoperability, survivability (including cybersecurity), and lethality. 

Sentence two has the critical bit there.  "T&E provides engineers and decision makers with knowledge to assist in managing risks".  Characterizing "operational suitability" and "lethality" are also critical pieces.

Managing operational risks, suitability, and lethality - those bits missing from a traditional developer's view of test.  Understanding these pieces requires deep operational experience.  Even then, they're mission dependent, and they're difficult to pin down.

Understanding operational risk, suitability, and lethality is not part of a Cyber Capability Developer or Product Owner's experience set.  Even understanding our gaps in knowledge around operational risk, suitability, and lethality is not a part of our experience set.

At the 90th we don't have an institutional way to know what to test around these issues, and we don't have an institutional way to even realize we don't know what to test.

# Bringing the "Why" Back

I do see members, some Master and Senior developers, that inherently understand these issues.  They understand what mission and capability-specific questions to ask of the operators.  They understand the risk bounds, how to measure them economically, and how to document them and communicate them to operators so our customers can make decisions on employment.

That means - our system for managing operational risk, suitability, and lethality is personality dependent.  It's working for us today.  There is a point in the future, however, where a personality dependent system will not work.  It's that point where the personalities leave our team.

On that day our capabilities will no longer meet our customers' needs.  Their trust in us, and USCYBERCOM's trust in us, will erode.  That's unacceptable to me.  We can take actions now that avoid that situation.  We can institutionalize test.

This is one thing the bureaucratic DoD test system is designed to solve.

Today we have the freedom to pick a path to sustainable test that will maintain our community trust and operational effectiveness, provide information to support managing operational risk, suitability, and lethality, and avoid the bureaucracy that we want to avoid.

# Building a Sustainable Test Culture

Continual improvement is a part of what it means to be a Shadow Warrior.

The continuous improvement cycle is to identify, plan, execute, and review.

1. Identify opportunities for improvement.
2. Plan a way to improve.
3. Execute that plan to implement change.
4. Review how the changes are affecting the team.

To continuously improve our capability test, we need personnel capable of completing these steps.  Our existing teams will execute any plans that get made, but we need experienced test and operational personnel to help us identify opportunities for improvement, plan the improvement, and review our results.

We must begin today to leverage our internal and external test resources in a continuous improvement model.

Most of us already value maximizing test automation.  Most of us understand that test, in the form of a tested capability, is a deliverable that 90 COS dev teams own.

# Vision

The end state is a few years down the road.  Today Functional Examiners will ensure we incorporate test into our processes, and will equip and shepherd development teams in tying function and unit testing into their products.  But in the end state, Master, and to a lesser extent Senior, developers have a solid understanding of operational risk, what risk questions to ask operators, and what bounds exist around operator needs.  Master and Senior developers mentor more junior personnel so that those personnel learn the needs, questions, and bounds.  Test experts on our team and partnered remain in our organization in a coaching and continuous improvement role.  Our team is more skilled, more effective, and more efficient than any other team.  We deepen trust with operational partners and USCYBERCOM staff because we live a deep understanding of their needs.
