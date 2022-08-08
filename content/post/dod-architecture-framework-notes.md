---
title: "DoD Architecture Framework Notes"
date: 2022-08-08T17:00:00-05:00
draft: false
categories:
- Blog
tags:
- Digital Engineering
- Model Based Systems Engineering
---

Doing a little more reading about what Digital Engineering & MBSE are supposed to encompass, I looked into DoD Architecture documentation.  I've seen some "OV-1" documents before, and found them to be intuitive (when they weren't too dense).  I did not know where the nomenclature came from...  Now I do.

https://dodcio.defense.gov/Library/DoD-Architecture-Framework/

The DoD office of the Chief Information Officer released the current version of the framework back in 2010.  Now - while I think it is still completely applicable, and I acknowledge that perhaps it hasn't needed any updates in that time...  I think the age of this framework since last update probably says nothing good about how well it has been used and loved.

Add to that the fact that the documentation on the website above is not nearly explanatory enough, and that I'm not aware of an acquisition course or other that really covers this...  You'll understand why I'm not certain this process has really taken off the way it might have.

Anyway - the components certainly make sense.

Part of the document seeks to define the process for creating an architecture:

> * Determine the intended use of the architecture
> * Determine scope of architecture
> * Determine data required to develop the architecture
> * Collect, organize, correlate and store the data
> * Conduct analyses to support development towards the objectives
> * Present results in accordance with decision maker needs

This is such a simple, straightforward problem solving meth--- wait a second...

> 1. Define the problem
> 2. Generate alternative solutions
> 3. Evaluate and select an alternative
> 4. Implement and follow-up on the solution
>
> -- https://asq.org/quality-resources/problem-solving

The process is the same as a generic problem solving process applied to conducting systems engineering and where the end-goal is only presenting the results to decision makers.

Their presentation methodology is similarly general but powerful, and follows directly from a problem solving methodology where the goal is to present work...

> * Define stakeholders
> * Document the decisions made by stakeholders
> * Define information requirements for decisions
> * Define presentation mechanisms for stakeholder decisions
> * Align information requirements for the data sets for decisions
> * Develop presentation products
>
> -- https://dodcio.defense.gov/Library/DoD-Architecture-Framework/dodaf20_presentation/

Still - this is the exact process many people seem to miss when determining how and what to present to an audience.

Now, No Magic, maker of the Cameo modeling tool, [has some great documentation](https://docs.nomagic.com/display/UAF12P2022x/DoDAF+2.1).  They have diagrams demonstrating each component of the DoDAF.

That documentation is from a plugin for their tool.  This brings me back to the connection to MBSE and thus Digital Engineering - the DoDAF is a tool and common language for sharing information among the services, among our mil/civ/ctr teams, with leadership, and with capabilities users.  It shares information via model.  This seems to be MBSE at its core, with DoDAF users putting information into a system about what a system has to do and how it works and thus building a model for that system.  The data has many views/viewports, some are models others are documents, that present the underlying information in different ways.  Cameo being a popular modeling tool it would want to be able to present using the documented DoD model language.