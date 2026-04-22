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

* **Quarterly check-ins**: Informal performance discussions.
* **Mid-year reviews**: Formal review at the 6-month mark.
* **Annual reviews**: Comprehensive performance evaluation.
* **Continuous feedback**: Don't wait for reviews — give feedback in real time.

### Components of a performance review

**Self-assessment.**
* Ask engineers to reflect on their accomplishments.
* Identify areas where they exceeded expectations.
* Highlight challenges and areas for improvement.
* Set goals for the next period.

**Manager assessment.**
* Evaluate against defined expectations for the level.
* Assess technical skills, collaboration, and impact.
* Provide specific examples — both positive and constructive.
* Be honest but compassionate. Honest beats compassionate when they conflict.

**Peer feedback.**
* Collect input from area leads and collaborators.
* 360-degree feedback for senior engineers.
* Anonymous surveys for broader team sentiment.

**Engineering org ranking.**
* Stack ranking, if used, should be done thoughtfully.
* Consider impact, not just output.
* Account for different roles and responsibilities.
* Be transparent about the process.

### Best practices

* Prepare thoroughly — don't wing it.
* Use specific examples and data.
* Focus on growth and development, not just evaluation.
* Align reviews with company values and engineering principles.
* **No surprises.** Issues should be discussed in real time, not saved up for review season.
* Document everything for future reference and compensation decisions.

## OKRs (Objectives and Key Results)

OKRs are a goal-setting framework to align company, team, and individual objectives.

### Structure

**Objectives** are qualitative goals that are ambitious and inspirational.
* Example: "Build a world-class observability platform."

**Key Results** are quantitative measures that define success.
* Example: "Reduce mean time to detection (MTTD) to under 5 minutes."
* Example: "Achieve 99.99% uptime for critical services."
* Example: "Onboard 10 teams to the new monitoring stack."

### Cadence

* **Quarterly OKRs**: Most common cycle (aligns with business planning).
* **Annual OKRs**: Set high-level company and org objectives.
* **Weekly check-ins**: Track progress and adjust.
* **End-of-quarter review**: Grade OKRs and reflect on learnings.

### Writing good OKRs

**Good objectives:**
* Ambitious but achievable.
* Aligned with company strategy.
* Clear and inspiring.
* Time-bound — typically quarterly.

**Good key results:**
* Measurable and specific.
* Outcome-focused, not activity-focused.
* Challenging but realistic — 70% achievement is typical for well-written OKRs.
* Limited in number — 3-5 per objective.

### Anti-patterns

* Using OKRs as a task list.
* Setting too many OKRs, which overwhelms teams.
* Making them too easy — 100% achievement means not ambitious enough.
* Treating OKRs as performance evaluations. They are a planning tool, not a review input.
* Not reviewing or updating them regularly.

## Professional development and growth

Invest in your team's continuous learning and career progression.

### Growth opportunities

* **Mentorship programs** pairing junior and senior engineers.
* **Stretch assignments** — projects slightly beyond the engineer's current level.
* **Technical leadership** — design reviews, RFC processes, owning a subsystem.
* **Cross-functional projects** that expose engineers to product, sales, customer success.
* **Conference attendance** as recognition for top performers.
* **Learning budgets** for courses, books, certifications.
* **Internal tech talks** and lunch & learns to build a knowledge-sharing culture.

### Career development conversations

* Discuss career goals and aspirations regularly — *separately* from performance reviews.
* Create individual development plans (IDPs).
* Identify skill gaps and make specific plans to close them.
* Provide visibility and exposure to senior leadership.
* Champion your team members for promotions and opportunities.

## Leveling and promotions

{: .warning }
> This is a can of worms and a very hot topic. Here is my personal view and experience.

Leveling is related to performance review but puts visible — internal or external — structure around it.

### When to introduce leveling

Until the company has passed existential threats — i.e. runway is not measured in months — leveling is a distraction and a cause of unhappiness. **Wait as long as you can** and focus the team on delivering the product and milestones.

**Introduce leveling when:**
* You need a formal way for junior engineers to grow inside the company.
* You need to unify performance expectations across the org.
* You have a benchmark for external hiring, so candidates know what level they're joining at.

**Leveling is not:**
* A way to compensate people. Levels are a floor for comp, but they should be loosely coupled to it.
* A guarantee of promotion. Promotions are earned, not automatic with tenure.

### Building a leveling framework

* **Don't build from scratch.** Leverage existing frameworks from industry leaders:
  * [progression.fyi](https://progression.fyi)
  * [levels.fyi](https://levels.fyi)
  * Public engineering ladders from Dropbox, Rent the Runway, CircleCI, etc.
* **Adapt, don't copy.** Customize for your company's values and needs.
* **Define clear criteria**: technical skills, scope, impact, leadership, collaboration.
* **Make it transparent.** Engineers should know exactly what's expected at each level.
* **Keep it simple.** Too many levels creates politics and confusion. For a 20-person team, 4-5 levels is usually enough.

### A minimal worked example

Here's a stripped-down four-level ladder that works for a 10-30 person engineering team. It's a starting point, not a copy-paste answer — expect to customize significantly.

**L1 — Engineer I (Joining the craft)**
* Scope: an assigned task, with regular guidance.
* Technical: writes correct code for well-specified problems; relies on reviewers to catch design issues.
* Impact: completes their work; learns the codebase; asks good questions.
* Collaboration: participates in standups and reviews; communicates blockers clearly.
* Typical tenure: 1-2 years.

**L2 — Engineer II (Owning the feature)**
* Scope: a feature or well-defined component, end-to-end.
* Technical: designs modest-sized systems; tradeoffs are explicit; tests are meaningful.
* Impact: their shipped work reliably moves a team metric; few rollbacks.
* Collaboration: reviews others' work constructively; mentors L1s informally.
* Typical tenure: 2-3 years.

**L3 — Senior Engineer (Owning the system)**
* Scope: a major system, or a significant product area across quarters.
* Technical: makes architectural decisions others rely on; writes the design docs.
* Impact: influences the roadmap; identifies work no one told them to do; ships it.
* Collaboration: the senior voice juniors imitate; clearly mentors multiple people.
* Typical tenure: 3-5 years or longer.

**L4 — Staff Engineer (Scope beyond the team)**
* Scope: influences work beyond their team — multi-team initiatives, platform work, cross-cutting concerns.
* Technical: sets engineering-wide standards; the person others escalate to.
* Impact: demonstrably moves org-wide metrics; defines what "good" looks like.
* Collaboration: a force multiplier for other seniors; resolves technical disputes across teams.

Notes on using this:
- Resist adding more levels until you've felt real pain for their absence.
- The L3 → L4 jump is the hardest one; most engineers plateau there, and that's fine.
- Write specific behavioral examples per level — "wrote the design doc for X and drove the decision against competing alternatives" — not just adjectives.

### Promotion process

* **Self-nomination.** Engineers should advocate for themselves.
* **Manager sponsorship.** The manager makes the case for promotion.
* **Calibration.** Cross-team review to ensure consistency.
* **Promotion committee.** Senior leaders review and approve.
* **Timeline.** Regular promotion cycles — twice per year is typical.
* **Communication.** Announce promotions to celebrate achievements.

### Promotion criteria

Promotions should be based on:
* **Impact**: Has the engineer already been performing at the next level?
* **Consistency**: Sustained performance over time, not one big project.
* **Scope**: Increased responsibility and influence.
* **Leadership**: Technical leadership, mentorship, and culture contribution.

{: .important }
> Engineers should already be performing at the next level before being promoted. Promotions recognize past performance, not future potential.

### Delivering the news

A promotion conversation, done well, is one of the best moments of the job. A denial, done poorly, can lose you an engineer. The difference is specificity.

- **On approval**: Make it concrete — "You're being promoted to Senior because of X, Y, and Z. Here's what's different about your role going forward." Don't let it become generic.
- **On denial**: Be direct about what's missing. "You are not being promoted this cycle. Here are the two things I need to see sustained for the next 6 months." Never leave the engineer unsure whether the answer was really no.

The worst outcome is ambiguity. An engineer who thinks they were "close" when they weren't will feel betrayed at the next cycle.

## Performance bonuses and recognition

* **Performance bonuses.** Annual or quarterly, based on performance.
* **Spot bonuses.** Immediate recognition for exceptional work.
* **Gifts.** Small tokens of appreciation for going above and beyond.

**Budget planning.** Set up a quarterly or yearly org-wide budget for bonuses and recognition. Prepare it ahead of time so you have it ready. Be fair and consistent across teams. See [Budgets & Headcount]({{ '/resources/budgets-headcount.html' | relative_url }}).

## Burnout — theirs and yours

The section most HR handbooks have as a four-bullet list is the one that deserves the most attention.

### Warning signs in your team

Watch for these *before* they show up in the formal engagement survey:

- A high performer who has gone quiet — fewer comments in reviews, shorter 1:1s, no more proactive ideas.
- An engineer who used to push back and has stopped.
- Someone pulling consecutive late nights or weekends without it being acknowledged.
- Irritability in written communication — curt PR comments, short Slack replies, absences from team rituals.
- Declining quality of work from someone who was historically reliable.
- Statements that sound casual but aren't: "I'm just tired" repeated across weeks.

### What to actually do

Not "encourage the use of vacation time." Concretely:

1. **Name it privately.** "I've noticed X. Are you okay?" Don't accept "I'm fine" at face value the first time.
2. **Reduce load in the next sprint.** Not by talking about it — by actually moving work. Have their tech lead re-assign something. Remove a meeting from their calendar.
3. **Require the time off.** "You are taking next Thursday and Friday. I'll cover the design review." Suggesting vacation to someone who is burnt out is worse than useless — they interpret it as permission to skip a day, not a mandate to recover.
4. **Look at the structural cause.** If an engineer is burning out, usually the team is — or soon will be. Check the load distribution, the on-call rotation, the number of interrupts they're absorbing. Fix the system, not just the individual.
5. **Escalate if you need to.** Sometimes the root cause is above your pay grade — a roadmap that was never achievable, or staffing that was never adequate. Say so, in writing, to your manager.

### Protecting yourself

New managers underestimate this. You are the last line of defense between your team and whatever is pushing on them from above — unrealistic roadmaps, customer escalations, executive panic. That pressure doesn't disappear when you shield your team from it. It lands on you.

- **Have a manager you can vent to.** If you don't, find a peer EM at another company and trade venting sessions. The friction of explaining context makes it less cathartic, which is fine.
- **Protect at least one deep-work block a week.** Calendar it. Guard it.
- **Notice when you've stopped being curious.** That's the earliest warning sign of burnout for a manager. When you stop wanting to know why someone's upset, you're already too deep in.
- **Take the vacation.** You set the example. A team whose manager never disconnects will not disconnect either.

## Reassignments

Sometimes an engineer's skills or personal circumstances are better addressed by moving them to a different team.

* Use reassignments to address skill mismatches or team dynamics issues.
* Be thoughtful — reassignments can be perceived as punitive.
* Communicate clearly and involve all parties: the engineer, the current manager, the new manager.
* Give the engineer a real chance to succeed in the new environment. A reassignment into hostile conditions is a worse outcome than a clean separation.

## Performance Improvement Plans (PIPs)

A PIP is a last resort to get somebody back on track. It is a formal process to address performance issues.

### When to use a PIP

* Performance issues have been discussed in 1:1s and aren't improving.
* You have clear documentation of performance problems.
* You've provided support, resources, and feedback — and named the issue explicitly.
* The employee understands they are not meeting expectations.

### PIP principles

* **You must be okay with any outcome.** PIPs can result in improvement or separation. If you're not actually willing to separate, don't start one.
* **It will change the relationship.** The employee-manager relationship will not go back to what it was.
* **Set clear expectations and outcomes.** Specific, measurable goals.
* **Work with HR and leadership.** Ensure the process is followed correctly.
* **Define timeline.** Typically 30, 60, or 90 days.
* **Provide support.** Resources, coaching, clear feedback.

### PIP success rates

* In my experience: **~20% success rate** — employee improves and stays.
* ~80% result in separation, either termination or resignation.
* The 20% who succeed often become very loyal and significantly improved employees.

### Philosophy on PIPs

Some companies don't believe in PIPs and prefer to move directly to separation. I think PIPs are important — not only for the employee, but as a signal that the company cares about making people successful and did everything possible before separation. It also forces the manager to document, specifically, what the gap is, which clarifies thinking.

## Separation

This is the last resort. There is no way back, and the morale blast radius has to be considered.

### When separation is necessary

* Performance issues not resolved through a PIP.
* Violation of code of conduct or company policies.
* Role elimination (layoffs).
* Mutual agreement that it's not a fit.

### Managing separations

**Before the conversation:**
* Work with HR and legal to ensure compliance.
* Prepare the severance package (if applicable).
* Plan communication to the team.
* Have a transition plan for the employee's work.

**During the conversation:**
* **Do not delegate to HR.** As the manager, you deliver the news.
* Be direct and compassionate. In that order.
* Explain the decision clearly.
* Listen to their response. Don't argue.
* Discuss logistics — last day, benefits, references.

**After the separation:**
* Communicate to the team promptly.
* Hold 1:1s with team members to address concerns.
* Redistribute work or start the hiring process.
* Conduct a retrospective: what could we have done differently?

### Key principles

* **No surprises.** Employees should already know they are not performing.
* **Treat people with dignity.** Even in separation, show respect.
* **Control the narrative.** Communicate proactively to the team.
* **Learn from it.** What could you have done differently in hiring, onboarding, or management?

{: .warning }
> Separation decisions are hard but sometimes necessary. Handle them with care, compassion, and professionalism. How you handle departures defines your culture — the people you keep are watching.

## Recommended resources

* Performance review templates — see [References]({% link references.md %}).
* OKR frameworks — see [References]({% link references.md %}).
* Leveling frameworks: [progression.fyi](https://progression.fyi), [levels.fyi](https://levels.fyi).
* Feedback frameworks: *Radical Candor* by Kim Scott.
