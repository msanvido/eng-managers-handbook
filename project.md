---
title: Project Management
layout: home
nav_order: 5
---

{: .no_toc }
## Project Management

This section is about managing projects and teams deliverables.

## Table of Contents


1. TOC
{:toc}
### Goals

Deliver the product as agreed with the PM (PM decided the **what,** eng responsible for the **who, how and when)**

* Setup the team for success:  
  * does the team have enough resources for the tasks assigned to the team  
    * help hire for the needed resources  
    * manage/budget resources (laptops, aws spent, gcp) needed to achieve success (example C2s)

### Tools

  * **Linear**: This is your tool to monitor both people and projects progress. Track backlogs, tech debt… etc. This is YOUR tool for success and company success. Spend at least 15-30min a week to keep it up to date and clean.  
  * **PRDs/Roadmap Review**: PM requirements for what you need to build. Getting clarity on this and push back on is your and team lead job. Once accepted, you are accountable for delivering it\!  
  * **Organize Postmortems**: Fix what was broken  
  * **Meeting management:**  
    * Make sure all the relevant people are part of it  
    * Async/async: some can be done in slack BUT hard to read body-language so choose based on what you want to get out of the meeting.  
    * recurring meetings: for status updates or “keeping the drum”/pace  
    * ad-hoc meetings: scheduled as needed, especially if you feel things are not fully aligned.  
    * **Brainstorming sessions**: use it wisely\! (lot’s of study on how to run a brainstorming session…. ).  
    * For all meetings: track AI and close the loop\! (make sure the meeting was worth it)  
    * Framework/mental model: a 1h meeting is 200$/person\! Is it worth it?  
  * **Follow established processes and always try to improve**: See the laffer curve of process  
    * Make sure every team member understands the process and executes on them. The only worst thing about having no processes is having processes and only a few follow them.

### Technical Debt Management

Develop a strategy for managing technical debt:

- Regularly allocate time for addressing technical debt in sprint planning.
- Create a technical debt backlog and prioritize items based on impact.
- Educate stakeholders about the importance of managing technical debt.

### Releases

  * Changes in the right branch, in the right window  
  * Commit hygiene and PR reviews  
  * Feature flags management  
    * Goal 1: manage customer features/product features (see launch darkly)  
    * Goal 2: ship alpha/beta code and keep no-ready feature hidden but still in master  
  * Documentation \- make sure tech writer is aware of all the doc needed  
  * Testing and Release Criteria (Devprod is your assistant, not your fixer\!)

### Communication

  * Communicate status upwards: To avoid surprises and be sure of alignment\!  
    * **Close the loop**\! **Always Always** report back when things are completed/executed. i.e. Yaron asks you to do something, once you have done it, close the loop\! Upper management doesn’t want to keep asking you (has it been done yet\!\!\!)  
  * Communicate sidewise (other teams): make sure there is no double efforts, no unknown dependencies, managing resources (i.e., avoid the tragedy of the commons) during eng-staff sync up)  
  * Communicate to your customers: **the PMs**

### Delegation and Decision Making

  * Delegate but not abdicated\! i.e., keep track of progress, especially of junior eng. Make sure they have the tools to succeed.  
  * Delegate ownership, not tasks  
  * Do not delegate everything…. that’s not leadership that authoritarian\! Be in the trances\!  
  * Companies are benevolent dictatorships: Ask for opinions, but ultimately, the decision is yours and the tech lead. You are responsible for the team… not the ICs\!

### Quality

  * **Testing Testing**: **NOBODY WILL EVER TELL YOU YOU TESTING TO MUCH\!**  
    * regression, unit, system tests, etc….  
    * QA is there to help, not to find bugs\!  
  * Lifetime and Maintainance:  
    * Once shipped is not forgotten\!\!\! You own it forever\!

### On-call Management

  * People on call rotation: trained and qualified.  
  * Account for on-call in the cycles planning  
  * Managing Interrupts. Plan for interrupts and random requests. This is mostly aspirational
  * Track interrupts and identify patterns. Is there tech debt that is causing the interrupts, is the PM roadmap not in sink with customers?  
  * Make sure you do not have a single point of failure / go-to-guy:  
    * distribute interrupt load and know-how across the team (for continuity, and less team pressure).  
    * The temptation is always (need to be done fast, only X can do it fast… and X ends up always being the guy fixing things)  
    * Tech lead and you should make sure there is enough doc/tutorial/how-tos
