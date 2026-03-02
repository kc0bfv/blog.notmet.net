---
date: 2026-03-02 13:37:00-05:00
title: Spec-Driven Development Might Be the Process Reset AI Needs
categories:
- Blog
tags:
- Programming
- Agile
- AI
---

[A recent Red Hat post about “specification-driven development”](https://developers.redhat.com/articles/2026/02/17/uncomfortable-truth-about-vibe-coding) caught my interest.  I've tried bolting AI onto my personal development practices.  It doesn't look like whispering an idea into an LLM then compiling the response...  I can't give the LLM my brain and have it replace all my work beyond the idea.

I have had success when providing a description of the end result, then working alongside an agent to refine and move towards that result iteratively.  For me, personally, that's a significantly different pattern for development than usual.

When I hear about teams incorporating AI in their workflows, and look around my office, I see people incorporating it as individuals instead of as teams.  I see an uncomfortable truth coming:

> We need to revamp our processes, and not just sprinkle LLMs throughout our work and expect breakthrough.

This pattern isn't new. Every major technology wave starts with incremental adoption (“let's graft it onto what we already do”), then crests when someone rewrites the playbook around the new capability. Cloud-native ops didn't take off until teams embraced automation-first pipelines. DevOps only mattered when we tore down handoffs. AI is at that same inflection point.

Like Red Hat, [Thoughtworks has been poking at this](https://www.thoughtworks.com/en-us/insights/blog/agile-engineering-practices/spec-driven-development-unpacking-2025-new-engineering-practices). Their take: treat well-crafted specifications as the contract and prompt between humans and AI agents.

Too often a spec is something we document after building a prototype, but here it's the thing the whole team co-creates before touching the keyboard (well, at least before touching it to write code). [Scarlet Ink breaks down Amazon's Working Backwards process](https://www.scarletink.com/p/the-amazon-working-backward-process-for-engineering), which is essentially a human-focused version of the same idea: write the press release/FAQ (the spec) up front, force clarity of purpose, then execute. This is not so different from a "user story".

# What is spec-driven development?

[Birgitta Böckeler describes it as](https://martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html):

> Write the spec before you write code (or generate code with AI).

That leaves a lot of ambiguity, and the concept is still developing.  In practice teams:

- Capture goals, constraints, interface shapes, examples, and acceptance tests in a living doc.

- Use that doc to guide implementation, whether the implementer is a human, a code-gen agent, or both.
’
- Iterate the doc quickly as you learn, instead of letting it rot in Confluence (or worse, OneDrive).

Of course you can work with an agent to refine the specification.

She also points out that there is broad divergence on what spec-driven dev looks like in practice, and these reflect discussion I've seen in the community. Differences exist around:

* How much hand can a human have in the code itself?

* Is development work permitted to diverge from the spec?

* Nuts and bolts of spec management.

# Why is this helpful for human/agent teams?

* Clear prompts: AI agents need precise instructions. A spec doubles as the prompt, reducing hallucinations and rework.

* Shared intent: Humans are forced to externalize tacit knowledge (“why this matters, what good looks like”) before execution, so everyone on the team stays in the loop on decisions and reviews.

* Faster team orchestration: Specs become the model shared by product, engineering, and autonomous tools. Everyone plugs into the same model.

* Context management: Humans and agents both need to manage our context sizes. Spec-driven development forces humans to pre-compress the work into a coherent, bounded context. It isn't just bureaucracy—it's a deliberate way of shrinking the cognitive universe so both humans and agents can reason about the same slice of reality without drowning in context-switching.

In a way, spec-driven dev centralizes definitions and decentralizes execution. You use regular language to design for secure and interoperable functionality in advance. As opposed to vibe-ing it entirely, [then debugging misaligned outputs afterwards](https://developers.redhat.com/articles/2026/02/17/uncomfortable-truth-about-vibe-coding).

# Human domain expertise still matters

Specs don't write themselves. Someone has to encode intent, constraints, customer context, and risk appetite. Someone needs to validate AI-generated output, be that output specification or code.

Agents are accelerators, not oracles. Spec-first workflows just ensure our expertise is injected where it counts, setting intent and validating results rather than chasing AI mistakes downstream.

# How this differs from old-school waterfall

Defining a specification in advance sounds like waterfall. It's important to remember [one of the main problems with waterfall, though](https://www.thoughtworks.com/en-us/insights/blog/agile-engineering-practices/spec-driven-development-unpacking-2025-new-engineering-practices): extremely long feedback cycles.  Also, classic waterfall treated specs as massive, frozen documents that gated entire multi-year projects (hello, MIL-STD-2167).

[Royce's conception of the waterfall model](https://blog.jbrains.ca/assets/articles/royce1970.pdf) has come to be interpreted as meaning you shouldn't touch implementation until after (exhaustive) documentation.  That's not going to cut it (as he himself suggests).

The success of agile development practices proves the need for short feedback cycles, and the greater need to deliver working software than to deliver extensive documentation.

AI development operates on significantly shorter timelines than in the past.  Dev teams can put releases together much more quickly and get even quicker feedback.

Spec-driven development must be lighter and more iterative than waterfall:

* Scope: specs might be scoped to microservices, features, or “press release / FAQ” units, not 800-page tomes.

* Cadence: they evolve continuously; you can cycle through a spec → implementation → feedback loop in days.

* Feedback: they're paired with automated tests, telemetry, and reviews, so change doesn't require restarting the entire project.

* Ownership: teams own the spec end-to-end instead of throwing it over a wall to a separate engineering group.

It's closer to [Amazon's Working Backwards or Specification by Example](https://www.scarletink.com/p/the-amazon-working-backward-process-for-engineering) than to waterfall. The spec is living glue, not bureaucratic armor.


# Open questions I'm still wrestling with

1. **How much spec is enough?**

Where's the sweet spot between a prompt stub (“build me X”) and paralysis by documentation? How do we right-size spec depth for different risk levels?

[Brigitta describes how spec-driven development echoes model-driven development](https://martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html), which is a lot like Model-Based Systems Engineering that provides significant return for managing large-scale engineering projects.  She points out that we may be able to avoid the complications and overhead of that methodology now that we're leveraging LLMs.

2. **Decomposition strategy**

Microservices and modular boundaries already help humans manage context. Do we need to double down on small, well-encapsulated components so specs (and AI prompts) stay digestible? Is the existing microservice granularity right-sized? Do we need smaller/more composable units?

3. **Spec management best-practices**

Who owns spec updates? How often are they updated? How are they stored? What processes do we use to build them? Do we need version control, review workflows, linting for specs the way we do for code? How do we keep specs trustworthy when half the edits might come from AI agents themselves?

4. **Agile ritual resets**

Some amount of specification is no different than a user story, and perhaps the backlog can suffice as specification.  If so, I suspect there is an art to writing user stories for this purpose, and probably an art to building a backlog ideal for steering an AI through a project phase.

Perhaps within a release, organizing an "agent-run backlog", consisting of user story specifications, could be a useful change.  This is not so different from a sprint backlog...  But it exists less to schedule humans, and more to bound LLM context windows.

# Conclusion

I don't have clean answers yet, but incremental tweaks won't maximize our productivity from these new tools. Spec-driven development feels like one of the first credible attempts to rethink the process around AI instead of jamming AI into the old process.

If you're experimenting with spec-driven workflows - or pushing back on them - I'd love to hear what's working over a pint.
