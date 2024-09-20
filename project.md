---
title: Project Management
layout: home
nav_order: 5
---

{: .no_toc }
# Project Management

This section is about managing projects and teams deliverables.

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

## Goals

Deliver the product as agreed with the PM (PM is responsible for the **what,** engineering is responsible for the **who, how and when**)

What you will need to accomplish:
- Define the Who: A clear assignments of the tasks: who is accountable for it, who is advising or support role for it, and who is coordinating the efforts, etc.
- Agree on the How: A sound design and architecture that meets the expectations of the stakeholders
- Communicate the When: Some time estimates on when the team plans to deliver the deliverable.

### Let's start with the Who

We already talked about the strength map, and you should have a good idea of the team capabilities. Once you have a clear idea of the team capabilities you can start to assign tasks to the team. Try to distribute the load across the team in a fair way and based on the engineers interests (did they express any specific interests for a particular task, do they want to learn something new), visibility (as a manager you goal is to be the "promoter" of your people, i.e. make sure everybody gets visibility to the rest of the team and company), and know-how (if the task is above somebodies capability make sure they are setup for success by pairing them with somebody that can guide them).

### Now the How

Here his where working very closely with you team leads, and architects is very important. They are ultimately responsible for the design and architecture but as a manager you need to makes that the ultimate design are: a) sounds and achievable, b) not over-engineered, and c) not under-engineered. 
You need to guide the leads and architects on the correct expectations set by the PM and customers too, is this a prototype and MVP, needs to be scalable, etc. 
Brainstorming sessions are really helpful to discuss and come up with the *how*, but makes sure that the meetings have the right attendees. The tendency is to have many people in the room and the meeting is not productive. Start with the small team of the people accountable for, then bring in support as needed (example invite the PM to makes sure he they can answer questions). 
Once you have sketch of the design and architecture share it with the broader team to a) get feedback b) see if there are dependencies and conflicts with other team plans and c) make sure everybody understand what the team is working on. 


### And last the When
Only once you got the initial feedback from the stakeholders as well as the rest of the team, you can start to work on the detailed design and architecture and a attempt of estimating a proposed deliverable date (that includes testing, and documentation). Review the date with the team and stakeholder so everybody is accountable as well as have the right expectations on the deliverable dates.


{: .note } 
> 💡 **Setup the team for success**
> * Does the team have enough resources for the tasks assigned to the team  
> * Do you external help and hire additional needed resources  
> * Do you have the resource to deliver the plan (laptops, aws clusters, gcp, data, etc) needed to achieve success
> * Are there any interdependencies with other teams

## Tools

Tools are a mean for you to simplify the collaboration, the planing, and the tracking of the projects. They are not the goal. Some people change their workflows to adopt to the tools they use, but I strongly advise it. Setup a system/workflow that works for you and your team and leverage the tools to simplify them, not the other way around.

This is a list of tools you should leverage to simplify yours and the team tracking/communications/etc

* Code repository

  I highly recommend a monolithic setup. Avoid the temptation to have separated repository. The illusion of being able to move faster will come at the expense of tons of headaches downstream (release, versioning and QA). One monolithic repo has been proven effective even for larger organization and for a reason.

* Design doc repository

  I need a well knows and accessible repository of the designs and design discussions. Ideally this is part of the code repo but could be in any other repository that allows for revision versioning, comments tracking.

* Issue/Project Tracking

  There are many issue tracking systems around, and are extremely useful to help the organization know where they are in respect to their deliverables, but the main advantage of an issue tracker is that it can help identify areas that needs improvements, track tech debt. The agile/story point tracking are just methods you cna use but again do not abuse them and adapt them for your needs.

* PRD/Roadmap plans repository

  This should be the source of truth for the whole company. I always said if is not on the roadmap is not going to happen, since is the guiding map for all the eng activities besides smaller internal efforts otherwise all important projects but customer and non-customer facing should be put on a roadmap. Yes even the internal refactoring, or re-architectures should be tracked a roadmap items. The PMs in collaboration with the Eng org are in charge of what is on the roadmap, and will drive both the engineering resources allocations as well as the sales activities.

* Postmortems repository

  At least any large misses like roadmap delivery delays, or customer issues should be discussed in postmortems (See postmortem guideline). This will have avoid them in the future, improve team's accountability but also show that the impacted teams (either sales, costumer success, or even pm) that the eng team will do their best to improve with an in depth root cause analysis and action items.

## Meetings management  
    * Make sure all the relevant people are part of it  
    * Async/async: some can be done in slack BUT hard to read body-language so choose based on what you want to get out of the meeting.  
    * recurring meetings: for status updates or “keeping the drum”/pace  
    * ad-hoc meetings: scheduled as needed, especially if you feel things are not fully aligned.  
    * **Brainstorming sessions**: use it wisely\! (lot’s of study on how to run a brainstorming session…. ).  
    * For all meetings: track AI and close the loop\! (make sure the meeting was worth it)  
    * Framework/mental model: a 1h meeting is 200$/person\! Is it worth it?  
  * **Follow established processes and always try to improve**: See the "Laffer" curve of process  
    * Make sure every team member understands the process and executes on them. The only worst thing about having no processes is having processes and only a few follow them.

## Technical Debt Management

Develop a strategy for managing technical debt:

- Regularly allocate time for addressing technical debt in sprint planning.
- Create a technical debt backlog and prioritize items based on impact.
- Educate stakeholders about the importance of managing technical debt.

## Releases

  * Changes in the right branch, in the right window  
  * Commit hygiene and PR reviews  
  * Feature flags management  
    * Goal 1: manage customer features/product features (see launch darkly)  
    * Goal 2: ship alpha/beta code and keep no-ready feature hidden but still in master  
  * Documentation -- make sure tech writer is aware of all the doc needed  
  * Testing and Release Criteria (Devprod is your assistant, not your fixer\!)

## Communication

  * Communicate status upwards: To avoid surprises and be sure of alignment\!  
    * **Close the loop** **Always Always** report back when things are completed/executed. Upper management doesn’t want to keep asking you (has it been done yet)  
  * Communicate sidewise (other teams): make sure there is no double efforts, no unknown dependencies, managing resources (i.e., avoid the tragedy of the commons) during eng-staff sync up)  
  * Communicate to your customers: **the PMs**

## Delegation and Decision Making

  * Delegate but not abdicated! i.e., keep track of progress, especially of junior eng. Make sure they have the tools to succeed.  
  * Delegate ownership, not tasks  
  * Do not delegate everything…. that’s not leadership that authoritarian! Be in the trances!  
  * Companies are benevolent dictatorships: Ask for opinions, but ultimately, the decision is yours and the tech lead. You are responsible for the team… not the ICs\!

## Quality

  * **Testing Testing**: **NOBODY WILL EVER TELL YOU YOU TESTING TO MUCH\!**  
    * regression, unit, system tests, etc….  
    * QA is there to help, not to find bugs!  
  * Lifetime and Maintenance:  
    * Once shipped is not forgotten! You own it forever!

## On-call Management

  * People on call rotation: trained and qualified.  
  * Account for on-call in the cycles planning  
  * Managing Interrupts. Plan for interrupts and random requests. This is mostly aspirational
  * Track interrupts and identify patterns. Is there tech debt that is causing the interrupts, is the PM roadmap not in sink with customers?  
  * Make sure you do not have a single point of failure / go-to-guy:  
    * distribute interrupt load and know-how across the team (for continuity, and less team pressure).  
    * The temptation is always (need to be done fast, only X can do it fast… and X ends up always being the guy fixing things)  
    * Tech lead and you should make sure there is enough doc/tutorial/how-tos
