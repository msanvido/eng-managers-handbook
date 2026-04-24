---
title: Performance & Development
layout: chapter
nav_order: 3
parent: II. People
---

{: .no_toc }
# Performance & Development

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

## Overview

Managing performance and fostering development are core responsibilities of engineering management. This chapter covers the tools and processes for evaluating performance, setting goals, handling underperformance, and creating growth opportunities for your team.

## Performance reviews

Performance reviews should be done regularly to provide structured feedback, align on expectations, and support career growth. The format matters less than the discipline of doing them.

### Cadence

A healthy review rhythm combines a few formal touchpoints with constant informal feedback. **Quarterly check-ins** are informal performance discussions; the **mid-year review** is a formal one at the six-month mark; the **annual review** is the comprehensive evaluation. Most importantly, **continuous feedback** should run underneath all of it — don't wait for review season to tell someone something they needed to hear weeks ago.

### Components of a performance review

**Self-assessment.** Ask engineers to reflect on their own accomplishments and identify the areas where they exceeded expectations. They should also highlight the challenges they ran into and the areas where they want to improve, and set goals for the next period.

**Manager assessment.** Evaluate the engineer against the defined expectations for their level, covering technical skills, collaboration, and impact. Ground the assessment in specific examples — both positive and constructive — rather than generalities. Be honest but compassionate; when the two conflict, honest wins.

**Peer feedback.** Collect input from area leads and frequent collaborators. For senior engineers, run full 360-degree feedback, and use anonymous surveys when you want a read on broader team sentiment.

**Engineering org ranking.** If you use stack ranking, do it thoughtfully. Weigh impact rather than raw output, account for differences in roles and responsibilities, and be transparent about how the process actually works.

### Best practices

Prepare thoroughly — don't wing a review — and ground everything in specific examples and data. Keep the focus on growth and development rather than pure evaluation, and make sure the review is aligned with company values and engineering principles. **No surprises**: anything substantive should have been discussed in real time, not saved up for review season. Document everything, both for future reference and for compensation decisions downstream.

## OKRs (Objectives and Key Results)

OKRs are a goal-setting framework to align company, team, and individual objectives.

{: .note }
> *"Success is not checking a box. Success is having an impact."*
> 
> — Christina Wodtke, OKR author
> 
> The project-management triangle — on-time, on-scope, on-budget — is not enough. The project must be delivered *successfully*: the objectives that motivated it in the first place have to be reached. OKRs exist to keep that the real scorecard.

### Structure

**Objectives** are qualitative goals that are ambitious and inspirational — for example, *"Build a world-class observability platform."*

**Key Results** are the quantitative measures that define what success actually looks like against that objective. For the observability example, they might be: reduce mean time to detection (MTTD) to under five minutes; achieve 99.99% uptime for critical services; onboard ten teams to the new monitoring stack.

### Cadence

**Quarterly OKRs** are the most common cycle and align naturally with business planning, while **annual OKRs** set the high-level company and org objectives they roll up into. Between those, **weekly check-ins** are where you track progress and adjust, and an **end-of-quarter review** closes the loop — grading the OKRs and reflecting on what you learned.

### Writing good OKRs

**Good objectives** are ambitious but achievable, aligned with company strategy, clear and inspiring in their framing, and time-bound — typically to a quarter.

**Good key results** are measurable and specific, outcome-focused rather than activity-focused, and challenging but realistic (70% achievement is typical for well-written OKRs). Keep them limited in number — three to five per objective is plenty.

### Anti-patterns

The most common failure modes are predictable: using OKRs as a task list; setting so many of them that teams drown; making them too easy, such that 100% achievement really means the bar wasn't high enough; treating OKRs as performance evaluations when they are a planning tool, not a review input; and setting them at the start of the quarter and never reviewing or updating them again.

## Professional development and growth

Invest in your team's continuous learning and career progression.

### Growth opportunities

Growth comes from a mix of things, and different engineers need different combinations. **Mentorship programs** pair junior and senior engineers in a structured way. **Stretch assignments** — projects slightly beyond the engineer's current level — are how people grow most visibly. **Technical leadership** opportunities (design reviews, RFC processes, owning a subsystem) build scope and judgment. **Cross-functional projects** expose engineers to product, sales, and customer success, which changes how they think about their work. **Conference attendance** is a meaningful form of recognition for top performers, **learning budgets** for courses, books, and certifications signal that development is a real investment, and **internal tech talks** and lunch & learns build a knowledge-sharing culture that compounds across the org.

### Career development conversations

Discuss career goals and aspirations regularly — and *separately* from performance reviews, so the two conversations don't collapse into each other. Create individual development plans (IDPs), and identify skill gaps with specific plans to close them rather than vague intentions. Provide visibility and exposure to senior leadership where you can, and champion your team members for promotions and opportunities — that advocacy is a big part of the job.

## Leveling and promotions

{: .warning }
> This is a can of worms and a very hot topic. Here is my personal view and experience.

Leveling is related to performance review but puts visible — internal or external — structure around it.

### When to introduce leveling

Until the company has passed existential threats — i.e. runway is not measured in months — leveling is a distraction and a cause of unhappiness. **Wait as long as you can** and focus the team on delivering the product and milestones.

**Introduce leveling when** you need a formal way for junior engineers to grow inside the company, when you need to unify performance expectations across the org, or when you need a benchmark for external hiring so candidates know what level they're joining at.

**Leveling is not** a way to compensate people — levels are a floor for comp, but they should be loosely coupled to it — and it is not a guarantee of promotion. Promotions are earned, not automatic with tenure.

### Building a leveling framework

Don't build from scratch. Lean on existing frameworks from industry leaders: [progression.fyi](https://progression.fyi), [levels.fyi](https://levels.fyi), and the public engineering ladders from companies like Dropbox, Rent the Runway, and CircleCI. Adapt rather than copy — customize the framework for your company's values and needs. Define clear criteria across technical skills, scope, impact, leadership, and collaboration, and make it transparent so engineers know exactly what's expected at each level. Keep it simple, too: too many levels creates politics and confusion, and for a 20-person team, four or five levels is usually enough.

### A minimal worked example

Here's a stripped-down four-level ladder that works for a 10-30 person engineering team. It's a starting point, not a copy-paste answer — expect to customize significantly.

**L1 — Engineer I (Joining the craft).** Scope is an assigned task with regular guidance. Technically, they write correct code for well-specified problems and rely on reviewers to catch design issues. Their impact is completing their work, learning the codebase, and asking good questions. They collaborate by participating in standups and reviews and by communicating blockers clearly. Typical tenure is 1-2 years.

**L2 — Engineer II (Owning the feature).** Scope is a feature or well-defined component, end-to-end. Technically, they design modest-sized systems, make tradeoffs explicit, and write tests that actually matter. Their impact is shipped work that reliably moves a team metric, with few rollbacks. They collaborate by reviewing others' work constructively and by mentoring L1s informally. Typical tenure is 2-3 years.

**L3 — Senior Engineer (Owning the system).** Scope is a major system, or a significant product area across multiple quarters. Technically, they make architectural decisions others rely on and write the design docs that anchor those decisions. Their impact is influencing the roadmap and identifying work no one told them to do — and then shipping it. They are the senior voice juniors imitate, and they clearly mentor multiple people. Typical tenure is 3-5 years or longer.

**L4 — Staff Engineer (Scope beyond the team).** Scope extends beyond their own team — multi-team initiatives, platform work, cross-cutting concerns. Technically, they set engineering-wide standards and are the person others escalate to. Their impact demonstrably moves org-wide metrics, and they define what "good" looks like. They are a force multiplier for other seniors and resolve technical disputes across teams.

A few notes on using this: resist adding more levels until you've felt real pain for their absence; the L3 → L4 jump is the hardest one, and most engineers plateau there — that's fine; and write specific behavioral examples per level ("wrote the design doc for X and drove the decision against competing alternatives") rather than leaning on adjectives.

### Promotion process

A healthy promotion process starts with **self-nomination** — engineers should advocate for themselves — followed by **manager sponsorship**, where the manager makes the written case for promotion. From there, **calibration** is a cross-team review that ensures consistency across the org, and a **promotion committee** of senior leaders reviews and approves the final set. The **timeline** should be predictable: run regular promotion cycles, typically twice a year. Finally, **communication** matters — announce promotions to celebrate the achievement and reinforce what the bar looks like.

### Promotion criteria

Promotions should be based on **impact** (has the engineer already been performing at the next level?), **consistency** (sustained performance over time, not one big project), **scope** (increased responsibility and influence), and **leadership** (technical leadership, mentorship, and contribution to culture).

{: .important }
> Engineers should already be performing at the next level before being promoted. Promotions recognize past performance, not future potential.

{: .warning }
> This is also your defense against the **Peter Principle**: *"In a hierarchy, every employee tends to rise to their level of incompetence."* If you promote people for doing well at their current level — instead of for already operating at the next one — you will systematically promote engineers into roles they cannot do. Then you'll wonder why your senior tier underperforms. Promote for evidence of next-level behavior, not for length of time at this level.

### Delivering the news

A promotion conversation, done well, is one of the best moments of the job. A denial, done poorly, can lose you an engineer. The difference is specificity.

**On approval**, make it concrete — "You're being promoted to Senior because of X, Y, and Z. Here's what's different about your role going forward." Don't let it become generic. **On denial**, be direct about what's missing — "You are not being promoted this cycle. Here are the two things I need to see sustained for the next 6 months." Never leave the engineer unsure whether the answer was really no.

The worst outcome is ambiguity. An engineer who thinks they were "close" when they weren't will feel betrayed at the next cycle.

## Performance bonuses and recognition

There are a few common tools for recognizing performance beyond base comp. **Performance bonuses** are annual or quarterly payouts tied to performance. **Spot bonuses** are smaller, immediate recognition for exceptional work, delivered close to the moment they're earned. **Gifts** are small tokens of appreciation for someone going above and beyond — modest, but meaningful when they're specific.

**Budget planning.** Set up a quarterly or yearly org-wide budget for bonuses and recognition. Prepare it ahead of time so you have it ready. Be fair and consistent across teams. See [Budgets & Headcount]({{ '/resources/budgets-headcount.html' | relative_url }}).

## Burnout — theirs and yours

The section most HR handbooks have as a four-bullet list is the one that deserves the most attention.

### Warning signs in your team

Watch for these *before* they show up in the formal engagement survey. A high performer who has gone quiet — fewer comments in reviews, shorter 1:1s, no more proactive ideas — is often the first signal. So is an engineer who used to push back and has stopped, or someone pulling consecutive late nights or weekends without it being acknowledged. Irritability in written communication is another tell: curt PR comments, short Slack replies, absences from team rituals. Declining quality of work from someone who was historically reliable is rarely a skill problem; it's usually a capacity problem. And watch for statements that sound casual but aren't — "I'm just tired" repeated across weeks is a flag, not a throwaway line.

### What to actually do

Not "encourage the use of vacation time." Concretely: **name it privately** ("I've noticed X. Are you okay?") and don't accept "I'm fine" at face value the first time. **Reduce load in the next sprint** — not by talking about it, but by actually moving work; have their tech lead re-assign something and remove a meeting from their calendar. **Require the time off** ("You are taking next Thursday and Friday. I'll cover the design review."); suggesting vacation to someone who is burnt out is worse than useless, because they interpret it as permission to skip a day rather than a mandate to recover. **Look at the structural cause**: if one engineer is burning out, usually the team is — or soon will be. Check the load distribution, the on-call rotation, and the number of interrupts they're absorbing, and fix the system rather than patching the individual. And **escalate if you need to** — sometimes the root cause is above your pay grade (a roadmap that was never achievable, staffing that was never adequate), and saying so in writing to your manager is part of the job.

### Protecting yourself

New managers underestimate this. You are the last line of defense between your team and whatever is pushing on them from above — unrealistic roadmaps, customer escalations, executive panic. That pressure doesn't disappear when you shield your team from it. It lands on you.

Have a manager you can vent to; if you don't, find a peer EM at another company and trade venting sessions. Protect at least one deep-work block a week, calendar it, and guard it. Notice when you've stopped being curious — that's the earliest warning sign of burnout for a manager, because when you stop wanting to know why someone's upset, you're already too deep in. And take the vacation: you set the example, and a team whose manager never disconnects will not disconnect either.

## Reassignments

Sometimes an engineer's skills or personal circumstances are better addressed by moving them to a different team.

Use reassignments to address skill mismatches or team-dynamics issues, but be thoughtful — reassignments can easily be perceived as punitive. Communicate clearly and involve all parties: the engineer, the current manager, and the new manager. And give the engineer a real chance to succeed in the new environment; a reassignment into hostile conditions is a worse outcome than a clean separation.

## Performance Improvement Plans (PIPs)

A PIP is a last resort to get somebody back on track. It is a formal process to address performance issues.

### When to use a PIP

A PIP is appropriate when performance issues have been discussed in 1:1s and aren't improving, when you have clear documentation of the performance problems, and when you've already provided support, resources, and feedback — and named the issue explicitly. The employee should already understand that they are not meeting expectations by the time a PIP starts.

### PIP principles

**You must be okay with any outcome.** PIPs can result in improvement or separation, and if you're not actually willing to separate, don't start one. **It will change the relationship**: the employee-manager relationship will not go back to what it was. **Set clear expectations and outcomes** — specific, measurable goals, not vague hopes. **Work with HR and leadership** to make sure the process is followed correctly. **Define a timeline**, typically 30, 60, or 90 days. And **provide support** throughout: resources, coaching, and clear feedback.

### PIP success rates

In my experience, PIPs have roughly a **20% success rate** — meaning the employee improves and stays. About 80% result in separation, either termination or resignation. The 20% who succeed often become very loyal and significantly improved employees.

### Philosophy on PIPs

Some companies don't believe in PIPs and prefer to move directly to separation. I think PIPs are important — not only for the employee, but as a signal that the company cares about making people successful and did everything possible before separation. It also forces the manager to document, specifically, what the gap is, which clarifies thinking.

## Separation

This is the last resort. There is no way back, and the morale blast radius has to be considered.

Separation becomes necessary when performance issues haven't been resolved through a PIP, when there has been a violation of the code of conduct or company policies, when a role is being eliminated as part of a layoff, or by mutual agreement that it simply isn't a fit.

### Managing separations

**Before the conversation.** Work with HR and legal to ensure the process is compliant, and prepare the severance package if one applies. Plan how you'll communicate the change to the team, and have a concrete transition plan for the departing employee's work.

**During the conversation.** Do not delegate this to HR — as the manager, you deliver the news. Be direct and compassionate, in that order. Explain the decision clearly, listen to their response without arguing, and walk through the logistics: last day, benefits, references.

**After the separation.** Communicate to the team promptly rather than letting the news spread informally, and hold 1:1s with team members to address their concerns. Redistribute the work or start the hiring process, and run a retrospective on what you could have done differently — in hiring, onboarding, management, or all three.

### Key principles

**No surprises** — employees should already know they are not performing before a separation conversation happens. **Treat people with dignity**, because even in separation, respect is the baseline. **Control the narrative** by communicating proactively to the team rather than reacting to rumors. And **learn from it**: ask what you could have done differently in hiring, onboarding, or management so the next case is caught earlier or avoided entirely.

{: .warning }
> Separation decisions are hard but sometimes necessary. Handle them with care, compassion, and professionalism. How you handle departures defines your culture — the people you keep are watching.

## Recommended resources

For performance review templates and OKR frameworks, see [References]({% link references.md %}). For leveling frameworks, [progression.fyi](https://progression.fyi) and [levels.fyi](https://levels.fyi) are the best starting points. For feedback frameworks, *Radical Candor* by Kim Scott is the canonical reference.
