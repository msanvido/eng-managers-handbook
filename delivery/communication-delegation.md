---
title: Communication and Delegation
layout: chapter
nav_order: 4
parent: III. Building the Product
---

# Communication and Delegation

## Overview

Once you're accountable for more work than you can touch personally, your leverage comes entirely from communication and delegation. This chapter covers the mechanics: how to run meetings that are worth the time, how to communicate up/sideways/down without creating noise, how to delegate in a way that actually transfers ownership, and how to manage the relationships above and beside you that determine whether you succeed.

## Meeting management

**Principle:** a one-hour meeting with 10 people costs $2,000+ in direct time, plus the context-switching tax on everyone's deep work. Make it count, or don't hold it.

### Meeting types and best practices

**1. Standups (daily, 15 min)**

*Purpose:* synchronize the team, surface blockers.

*Example async standup for remote teams:*
```markdown
**Yesterday**: Finished analytics API endpoint
**Today**: Working on frontend integration
**Blockers**: Need design mockups from UX team
```

*Tips:*
- Keep to 15 minutes maximum.
- Focus on blockers, not detailed updates.
- Async works fine for distributed teams.

**2. Sprint planning (every 2 weeks, 1-2 hours)**

*Agenda template:*
```
1. Review last sprint (15 min)
   - What shipped?
   - What didn't? Why?

2. Capacity planning (10 min)
   - Who's available? Any PTO?
   - Estimate: X story points

3. Goal setting (15 min)
   - What's the sprint goal?

4. Ticket review and estimation (45 min)
   - Walk through tickets
   - Estimate and assign

5. Finalize commitments (10 min)
   - Confirm plan
   - Identify risks
```

**3. Design reviews (ad-hoc, 1-2 hours)**

*Attendees:* keep it small — 5-7 people maximum.
- Tech lead (required).
- Engineers implementing it (required).
- Product manager (if a product decision is needed).
- Architect (for complex systems).

*Bad:* 15-person design review where most people zone out.
*Good:* 5-person focused discussion + async doc review for the broader team.

**4. Retrospectives (every 2 weeks, 1 hour)**

*Format example (start / stop / continue):*
```markdown
## Start
- Daily team lunch
- Writing more tests for critical paths

## Stop
- Last-minute scope changes mid-sprint
- Skipping code review for "urgent" bugs

## Continue
- Weekly demos to stakeholders
- Pairing junior/senior engineers
```

*Action items:* pick 1-2 to implement next sprint. If you leave with 10, you'll do zero.

**5. 1-on-1s (weekly or bi-weekly, 30 min)**

Covered in [People Fundamentals]({{ '/people/fundamentals.html' | relative_url }}#monitoring-and-feedback).

**6. All-hands (monthly, 30-60 min)**

*Agenda:*
- Company updates (10 min).
- Engineering org highlights (10 min).
- Demos from teams (20 min).
- Q&A (15 min).

### Meeting best practices

**Before the meeting:**
- [ ] Clear agenda shared 24 hours in advance.
- [ ] Required prep work identified.
- [ ] Right attendees invited — not too many.

**During the meeting:**
- [ ] Start on time.
- [ ] Assign a note-taker.
- [ ] Track action items.
- [ ] End on time.

**After the meeting:**
- [ ] Share notes within 2 hours.
- [ ] Assign owners to action items.
- [ ] Set due dates.
- [ ] Close the loop — follow up on completion.

## Communication

### Downward: to your team

**Transparency is the baseline, not the aspiration.**
- Share company updates.
- Explain the *why* behind decisions.
- Celebrate wins.
- Acknowledge challenges honestly.

**Example team update:**
```markdown
Team,

Quick update on company direction:

📈 Good news: We hit $5M ARR. This unlocks our
Series A fundraising.

📉 Challenge: Churn is higher than expected. Leadership
is prioritizing stability and polish over new features
next quarter.

Impact on us: Shift 30% of roadmap from new features
to bug fixes and performance. I know this isn't as
exciting, but it's critical for the business.

Your input: What stability/performance issues should
we prioritize? Add ideas to this doc.

Questions? Let's discuss in Friday's team meeting.
```

The test of a good downward update: six months later, your team should be able to point at it and say *"that's when we knew what was happening."* Vague corporate language fails this test.

### Upward: to leadership

**Principle:** close the loop. Always report back when things are done.

**Weekly update template:**
```markdown
## Week of Jan 15

### Completed
- ✅ Analytics dashboard MVP shipped
- ✅ Fixed critical login bug
- ✅ Performance: API p95 now 180ms (was 300ms)

### In Progress
- 🔄 SSO integration (60% complete, on track)
- 🔄 Database migration (delayed 3 days, new ETA: Jan 25)

### Coming Next Week
- Complete SSO integration
- Start RBAC implementation
- Team offsite planning

### Blockers/Needs
- Need decision on pricing tier structure (blocking SSO UI)
- Request +1 headcount for Q2 (hiring plan attached)
```

Three rules for upward communication:

1. **Never surprise your manager.** Bad news is bad; bad news they hear first from someone else is worse.
2. **Report in their language, not yours.** Your VP doesn't need the Git branching strategy. They need "on track, one risk, here's the mitigation."
3. **Offer decisions, not just status.** "We're blocked on pricing — I recommend we proceed with Option B unless you object" beats "We're blocked on pricing."

### Sideways: to other teams

**Purpose:** avoid duplicated work, manage dependencies, coordinate resources.

**Example dependency communication:**
```markdown
To: #platform-team
From: #product-team

Hey team — we're building a new analytics dashboard
that will need:
- Real-time event streaming from your data pipeline
- Access to 90-day historical data
- Estimated 10k events/second at peak

Timeline: We need this by Feb 15 for the customer demo.

Can we sync this week to align on approach?
```

Cross-team communication is the place where stale assumptions cause the most damage. *"I thought platform had capacity for that"* is the sound of a deadline slipping by six weeks.

## Managing up

Most new engineering managers are so focused on managing their team that they neglect the relationship with their own manager — and then are surprised when things go sideways.

### Build the relationship deliberately

- **Understand what your manager cares about.** Not in the abstract — specifically. What metric are they measured on? What does their boss ask them about? What would make their quarter harder? Your credibility with them comes from being useful against *their* goals, not from demonstrating your own cleverness.
- **Establish the communication cadence they want.** Some managers want a structured weekly update. Some want ad-hoc Slack pings. Some want nothing until something is on fire. Ask. Don't guess.
- **Be predictable.** Ship what you said you'd ship. Flag risks before they become problems. Arrive on time to the 1:1. Predictability is the foundation of autonomy — managers give latitude to the reports they don't have to worry about.

### Pushing back on your manager

Your job is not to execute every directive. Your job is to be honest about what you think will work.

- **Pick your battles.** Pushing back on everything makes your pushback meaningless. Pushing back on the right things — well-reasoned, with an alternative — makes you valuable.
- **Frame it as a shared problem, not a disagreement.** "I want us to hit the Q2 goal, and I'm worried this approach won't get us there — here's why, and here's what I'd propose instead." You're on the same side.
- **Commit once the decision is made.** If you argued your case, you were heard, and the decision went the other way — your job is to make that decision work, not to keep relitigating it. Private dissent, public commitment.

### Communicating bad news upward

Bad news is best delivered:
- **Early.** The moment you know, not when you're sure.
- **Factually.** What happened, what's the impact, what's the current state.
- **With a plan.** What you're doing about it, what you need from them.
- **In writing, ideally.** A short note they can absorb before the meeting beats dropping it cold at the meeting.

Never let bad news reach your manager through another channel first. The damage from that is significantly more than the damage from the news itself.

## Managing sideways: peers and cross-functional

At a 0-50 person startup, the PM, the head of Design, the head of Sales, and the other engineering managers are probably not your friends. They are also not your enemies. They are your *peers* — the people whose cooperation determines whether your work actually ships.

A few things that matter:

- **Invest in the relationship when there's no conflict.** Regular casual syncs. Thanks for the help last week. Sincere interest in what they're working on. The deposit is the reason you can make a withdrawal later.
- **Never escalate to your shared manager before trying to resolve it directly.** The first time you escalate a cross-functional issue without having tried to work it out, you've taught your peer that you'll do that — and you've taught your manager that you can't work across functions.
- **Make the tradeoffs explicit.** "If we take on this customer request, the analytics dashboard slips by three weeks" is a useful sentence. "We can't do that" is not.
- **Credit generously.** When a cross-functional effort goes well, make sure the peer's contribution is visible. This is pure ROI: your team ships, their team looks good, nobody resents the next ask.

## Cross-functional influence without authority

You will frequently need to get something done through someone who does not report to you and has no obligation to help. This is the skill that separates senior managers from everyone else.

The underlying pattern, every time:

1. **Understand their goals first.** You cannot persuade someone by explaining why *your* goal matters. You persuade them by connecting *your* goal to *theirs*.
2. **Make the ask specific.** "We need help from your team" is a non-ask. "We need two weeks of Maya's time in March to integrate X" is an ask that can be answered.
3. **Make it easy to say yes.** Do the legwork. Write the doc. Propose a sequencing. Remove every friction point between "yes" and the work starting.
4. **Accept no gracefully.** If they can't help, thank them and move on. The next ask, six months from now, should not be poisoned by this one.

## Delegation

{: .note }
> *"It is not my job to make the decision. It is my job to make sure the best decision gets made."*
> 
> Hold on to that framing. The instinct of a strong-IC-turned-manager is to *be* the decision-maker, because that's how you added value before. It isn't anymore. Your leverage now is in making sure the decision happens, by the right people, with the right context, on the right timescale — not in making it yourself.

### Delegate ownership, not tasks

**Bad delegation:**
> "Jordan, can you update the database schema for analytics?"

**Good delegation:**
> "Jordan, we need to store analytics data for the new dashboard. Requirements: support 1M records, query performance under 100ms. You own the solution — database design, migration plan, deployment. I'm here if you need help. Let's sync Monday for your proposal."

**Why good delegation works:**
- Ownership creates motivation.
- Space to learn and grow.
- You review the approach, not the micromanage.
- You build future leaders.

{: .note }
> **A physics metaphor, for the engineers in the room.** A useful mental model for the manager's role in delegation: your job is to identify each engineer's *potential energy* — the direction they naturally want to fall given who they are and what they care about — and then shape the valley so that the path of least resistance leads to where the team needs to go. You're not pushing them down the slope. You're arranging the landscape so the slope goes the right way. The engineer does the work; the gravity does the work on them; your work is on the landscape.

### Delegation levels

Different situations call for different amounts of latitude. A useful vocabulary:

**Level 1 — Tell.**
*Use when:* high stakes, inexperienced person, urgent timeline.
*Example:* "Production is down. Run these exact commands to restore service."

**Level 2 — Sell.**
*Use when:* you have a strong opinion but want buy-in.
*Example:* "I think we should use Postgres instead of MongoDB because of strong consistency requirements. Here's my reasoning. Thoughts?"

**Level 3 — Consult.**
*Use when:* you want input before deciding.
*Example:* "We need to pick our deployment strategy. I've outlined three options. What are your thoughts?"

**Level 4 — Agree.**
*Use when:* the team decides together.
*Example:* "Let's discuss as a team and agree on our API versioning strategy."

**Level 5 — Delegate.**
*Use when:* the person is capable and the stakes are manageable.
*Example:* "You own the decision on which charting library to use. Keep me posted."

The common failure mode is drifting toward Level 1 on things that should be Level 5 — micromanaging capable engineers on decisions that don't matter very much. The second most common failure mode is drifting toward Level 5 on things that should be Level 1 — abdicating on decisions the engineer isn't ready for yet.

### What to never delegate

- Letting people go, especially if you hired them.
- Non-reversible decisions with major blast radius.
- Politically sensitive communications.
- Final accountability. You can delegate work; you cannot delegate your name being on the outcome.

{: .note }
> Delegation is the single highest-leverage skill in engineering management. It is also the hardest to develop — mostly because it requires letting other people do things you think you could do better and faster, which is true and irrelevant. Your job at scale is to build people who can do the work without you, not to keep doing the work yourself.
