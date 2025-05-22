---
title: Product
layout: default
nav_order: 2
parent: Management
---

{: .no_toc }
# The Product Management

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

# The Product

## What Make a Great Product: The Onion

The product, i.e. what gets in the hands of the customer, is the combination of multiple components, each of them playing an important part to the end product.
I like to think of the product as an onion, with the core being the core tech, obviously the most important piece of the product. The core is often what the team is mostly focused on since is the "piece of the resistance" and likely the competitive edge. A solid core is the necessary but not sufficient ingredient for a great product. 

While the core technology is  undeniably crucial, the other "layers of the onion" become increasingly important as your company grows. You might get away with neglecting them initially, especially if your tech is groundbreaking or the market demand is high. But as competitors emerge, those overlooked layers can become a significant liability.

### The Other Layers of the Onion

The specific "layers" will vary depending on your market, but for SaaS solutions, they often include:

Layers Supporting the product sales motion:
- Compliance and Security: SOC2, HIPAA, GDPR, and other regulations are table stakes and hard requirements for many businesses. 
- User Management: Authorization, authentication, RBAC, and multi-tenancy need to be built in from the start to avoid future headaches.
- Scalability and Flexibility: Backward compatibility and feature flags enable you to iterate on your product without disrupting existing users.
- Licensing: Understanding and managing your software licenses is essential for compliance and cost control.
- Documentation/How-to's/Guides: To help the user get the most out of the product
- Legal aspects: IP protections and any customer contracts limitations.
- Support and SLAs: How to support customers and maintain service level agreements.

Layers Supporting the product development velocity:
- Monitoring and Observability: Having a system to monitor your product's performance and diagnose issues is crucial for maintaining uptime and user satisfaction.
- Release/Patching: How you plan to release new versions and patch issues, how you test them and deliver them.
- Deployment types: On-prem, which hyperscalers to support, k8s support, containerization, etc.
- Maintainability (specially for hardware products and systems) - build maintainability into the design.

Many companies offer services that can assist with these aspects, and leveraging them can be advantageous. However, keep in mind that relying on external services for core components of your product may create dependencies and risks, which could significantly impact your bottom line in the future.

# Project Management

In order to deliver a product there are a lot of moving pieces that needs to be coordinated.
This section is about managing projects and teams deliverables.

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

Most important management skill to master: Delegation done right!
- Done Right: is motivational, simplifies scalability and overall execution.
- Done Wrong: Like putting sand in the gears of a motor.

Wrong:
- Delegate and don't care about the outcome = Abdicate. It's like a motivation killer: Why bother if management doesn't care?
- Delegate but then undo all or some of the outcomes (I refer this as pigeon management - imagine you are in a room working hard a pigeon comes in and poops all over the place and then just leaves a mess. [^]I have seen this called seagull management, I prefer pigeon since they are everywhere ). Why delegate in the first place if you do not trust the outcome?

Correct:
Delegate and coach. Outcome is a shared success (spotlight on delegate, failure is on the coach). Setup the delegation for success, give space, resources, and trust to deliver the outcome. This is your opportunity to grow somebody and for you later on to focus in bigger higher problems.

Remember thought that you cannot delegate everything, some projects and responsibilities will be yours and yours only: seek suggestions and assistance but ultimately you are the one in charge of it. Things you should _never_ delegate: **Non revokable decisions** but most important letting people go (especially if you hired that individual)

### Improving your Team Decision Making Process
Improving your decision-making process requires recording both the decision process and all relevant information available (or unavailable) at the time.

This goes against the "coaching from the sidelines" instinct, where we judge past decisions based on currently available information. For instance, looking back, most people would say they should have invested in Google or Facebook 10 years ago. However, considering only the information available back then, would they have made the same decision?

Why mention this? Because it applies to all engineering decisions as well: e.g. product strategy, technical debt, hiring, etc. To improve future decisions, you should review how you made the decision with the information you had at that time, as future decisions will be based solely on present information. 

A sound decision-making process, a good record keeping of past decisions, and a periodic review of past decisions will help refine your engineering organization's decision-making skills, help align the team on critical decisions, and build trust in your team's decision-making process.

Note that this differs from traditional postmortems, which analyze past outcomes backward to prevent or replicate similar outcomes. While postmortems increase the likelihood of success for past decisions, they do not directly contribute to making better future decisions.

In summary:
 - REcord all the improtant decision in a system of record
 - Record all the informations that were available at that time
 - Periodically review all the decisions to improve you decision making processes

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


## Agile Methodologies

Consider implementing or refining Agile practices:

- Scrum: Sprint planning, daily stand-ups, sprint reviews, and retrospectives.
- Kanban: Visualizing workflow, limiting work in progress, and continuous delivery.
- Choose the methodology that best fits your team's needs and company culture.

## PM and Sales Relationship

The engineering org is ultimately delivering to the PM org, that is the PM is technically your customer. A good way to think about the relationships is:

- PM decides what needs to be build (gathering inputs from sales and engineering): i.e. the roadmap  
- Eng decide who and when: i.e. when the roadmap is delivered based on complexity and resources available  
- Sales is the PM’s customer: Ultimately if the roadmap must cater to the sales team needs.

Ultimately **if it is not on the roadmap it is not going to be built.** So have a good centralized way to view and track the roadmap is vital.

## Building Strong Relationships

- Schedule regular sync-ups between engineering, product management, and sales teams.
- Encourage engineers to join sales calls occasionally to better understand customer needs.
- Implement a system for engineering to provide time estimates and feasibility assessments for feature requests.

## Organization and Product Strategy

How you structure your teams has a big impact on the product both in term of architecture as well as product development velocity.
The Conway's Law , which states that "organizations design systems that mirror their own communication structure" [^1], sadly has been proven to be true in my experience. Hence deliberately creating team to better support the product and development is key to the team successes, and indirectly as a team is more successful it will also make the team more happy and productive.
