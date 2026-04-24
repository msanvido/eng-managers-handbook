---
title: People Management Fundamentals
layout: chapter
nav_order: 1
parent: II. People & Teams
---

{: .no_toc }
# People Management Fundamentals

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

## The job, stated plainly

Your most important goal is to set up each engineer for success and maximize the impact they have on the team and the company. That requires being explicit — with the engineer and with yourself — about what "success" looks like for this person, on this team, in this quarter.

Once the goal is clear, the job becomes monitoring and supporting, not directing. You hired smart people. Let them do what they're best at. Your role is to watch the system the way you'd watch a production service: notice drift, notice bottlenecks, scale up and down, and fix the things that break before they become incidents.

{: .warning }
> **Engineers are not machines.** A surprising number of companies still try to optimize engineering output as though engineers were constant-throughput workers pinned to the most important item in the queue. That model ignores: the human cost of context-switching, the difference between work that energizes and work that de-energizes, the interpersonal dynamics between teammates, what's happening in their personal lives, and the fact that motivation is not a fixed quantity. You can ignore these factors for a quarter; you cannot ignore them for a year.

A non-exhaustive list of the levers you actually have:

* **Distribute workload** across the team evenly, matched to know-how, capability, and interest.
* **Create growth opportunities** — a stretch project, pairing with a senior engineer, a lunch-and-learn slot, an external training budget.
* **Monitor engineering signal** (see below), and reshape workload before someone stalls.
* **Approve vacation and time off** — not to be a spy, but because you're accountable for knowing where your team is, in case of emergencies or urgent customer needs.
* **Support different needs differently.** A rough typology that holds up in practice: insecure engineers need reassurance and reps; knowledgeable engineers need scope; bored engineers need challenge; disengaged engineers need a candid conversation.

## Building a strength map

Before you can do any of the above, you need a map.

When you're responsible for a team and a product, you need to know where you're going and how to get there. Understanding your team's capabilities is the foundation of every plan you'll make — both project plans and people plans. Without it, everything you do is a guess.

A strength map, at minimum, captures for every engineer and close collaborator:

- Their specific strengths (not "good engineer" — "deep expertise in X, best systems thinker on the team").
- Their current level and where they sit on the leveling ladder.
- Their weaknesses and growth areas (the specific ones, not the polite ones).
- How much you can lean on them, and for what.

This map helps you assign work, form project teams, run performance reviews, and have honest growth conversations. **It is your opinion** — start there, but validate it. Test your read in 1:1s, skip-levels, and conversations with peers outside the company. What you think you know about someone in month three will often look embarrassingly wrong by month nine.

## Building relationships and reading dynamics

People are not machines. You cannot debug a person from pull-request metadata. Personal relationships — the kind that let you tell when someone is off before they say anything — are built slowly, one 1:1 at a time.

In practice this means two things:

- Know enough about what's happening outside work that you can notice when something shifts. This only comes from a genuine relationship, not a scripted check-in.
- Watch the interpersonal dynamics between your engineers, between your team and other teams, and between individuals and customers. Much harder to do in a remote setting — which is why remote-first managers have to be more deliberate about observation.

## Balancing the workload

The default failure mode: the most senior, most reliable engineer ends up with all the hard work because they're a safe bet. Six months later, they're burnt out and everyone else is stagnant.

The rules that keep this from happening:

- Assign based on strengths *and* interests, not just proven capability.
- Monitor and rebalance continually — the team's capacity is a moving target, not a static plan.
- Encourage people to stretch into new responsibilities.
- Create continuity: context-switching has a non-trivial cost. Don't move an engineer off a project they own just because someone else has bandwidth.

**Energizing vs. de-energizing work.** Some work needs doing that some people find draining — on-call, tech debt, documentation, interrupt handling. Distribute the de-energizing work fairly. The squeaky wheel gets the grease by default, and your job is to make sure the non-squeaky wheels also get it. Pay attention to who is quietly carrying the worst of it.

## Fostering growth

Growth is part of the job, not a perk you extend to top performers.

- Set up mentorship pairings between junior and senior engineers.
- Allocate team time and budget for learning — training, books, courses.
- Celebrate knowledge sharing through lunch & learns or internal tech talks.
- Run a learning budget per engineer (see [Resources]({{ '/resources/budgets-headcount.html' | relative_url }}) for typical numbers).
- Treat conference attendance as recognition. Give it to the people who earned it.

## Remote and distributed teams

Remote is the default operating context for most startup engineering teams now, not a special case. Three things matter more than the rest:

- **Communication norms, written down.** When do we use Slack vs. email vs. meetings? What counts as async-safe? What are the response-time expectations per channel? Without these written down, every team member invents their own answer and you pay for the mismatch.
- **Time zones as a first-class planning variable.** Don't schedule meetings that consistently fall outside working hours for the same people. If you can't avoid it, rotate the burden.
- **Deliberate social contact.** Remote teams don't build relationships in hallways. They build them in small structured moments: virtual coffees, occasional in-person offsites, explicit onboarding buddies. Absent deliberate effort, a remote team becomes a collection of individuals with a shared Git repo.

Tools matter less than norms. A team with weak norms and great tools is worse off than a team with great norms and mediocre tools.

## Team dynamics, cohesion, and inclusion

A few things that matter more than any process:

- Create an environment where everyone is part of the team — shares the wins, shares the losses. Think sports-team spirit, not internal competition. Competition across teammates is fun for a month and corrosive by month three. **Foster collaboration instead, deliberately.**
- Watch for "alpha" engineers who dominate discussions and "silent" engineers who don't. Let senior engineers speak last. Ask for input from everyone, both in public and in private.
- **Praise in public. Criticize in private.** The exception is when you want to make a point to the whole team — and even then, use it sparingly. Failures are learning opportunities make sure the whole team lerns from them. 
- **Zero tolerance for unacceptable behavior.** Reference your company's code of conduct, if you do not have one, write one now. If you let one incident slide, you have just set the bar for the entire team. React quickly, stop it, make sure people know you intervened, loop in your manager and HR.
- Lead by example. Your team will model your habits before they model your stated values.

## Difficult conversations

The formal HR process — PIPs, separations — is covered in [Performance & Development]({{ '/people/performance-development.html' | relative_url }}). What's covered here is the earlier, messier territory: the conversations most new managers avoid for too long.

The most common ones, and what tends to work:

- **"Your code isn't good enough yet."** Deliver it with specifics, not vibes. "On the last three PRs, I saw X, Y, Z — here's what I expect at your level." Keep the evidence factual, keep the emotion out of it, and make the gap between current and expected concrete. Vague feedback is worse than no feedback.

- **"You're undermining a teammate."** Describe the behavior, not the character. "In Wednesday's review, you cut off Alex twice and dismissed their approach before they'd explained it — I need that to stop." Don't diagnose motive. State the impact and the required change.

- **"You were expecting a promotion. You're not getting it."** Prepare. Be specific about what's missing. Be specific about what the path looks like. Do not soften the news to the point of ambiguity — half the damage from a denied promotion comes from the engineer thinking they were close when they weren't. If they weren't close, say so.

- **"A senior engineer is blocking junior voices."** The senior isn't wrong on the technical merits — they rarely are — but the effect on the team is corrosive. Frame it as: "Your technical judgment is one of our biggest assets. The way it's landing with the junior engineers is a leadership issue.Make it about their growth as a leader, not their correctness as an engineer.

- **The aftermath of a conflict.** When two engineers have had a real fight, don't just move on. Meet with each separately. Get both sides. If there's a legitimate gap, close it in a follow-up 1:1. If the gap is irreducible, you may be looking at a team change. Unresolved conflicts become the stories people tell about why they left.

Two patterns that help across all of these:

- **Prepare the opening sentence.** Write it down. Say it out loud before the meeting. The first twenty seconds of a hard conversation are where the most damage usually happens.
- **Leave time for silence.** Don't fill it. The engineer may need ten seconds to absorb what you said before they can respond.
- **After the meeting.** Send an email after the meeting to summarize what was discussed. People often get defensive at first and stop listening, sending an email helps making sure the person has time to process the feedback at his pace.

{: .warning }
> The mistake is almost never having the hard conversation. The mistake is waiting three months longer than you should have.

## Monitoring and feedback

Your job is to notice what's happening before it becomes a problem. That starts with regular signal and ends with the tools you have to act on it.

### How you know how people are doing

* A weekly sync with each engineer (see below for 1:1 structure).
* Scanning PRs and reviews — not auditing, scanning.
* Commit activity — occasionally, as a trailing indicator.
* Linear / Jira ticket flow — completion rate, creation rate, staleness.

{: .warning }
> These are **not metrics to track**. They are *logs* that help you debug. The moment you start rewarding people for tickets-per-sprint or commits-per-week, you've taught them to game you instead of doing good work. You care about impact, and impact is not measured in commits.

This is the application of **Goodhart's Law**: *"When a measure becomes a target, it ceases to be a good measure."* The moment you convert an engineering signal into a performance target, your team will find the shortest path to hitting the number — usually at the expense of the thing you actually wanted. Use the signals for debugging, not scoring.

### The levers you have when something needs to change

* **1:1 feedback.** Radical Candor. The "sandwich" approach if you need it. But the better foundation is trust and transparency, because then you can be direct without the softening.
* **Workload changes.** Add, remove, or reshape the assignment. Balance energizing vs. de-energizing work. Be fair across the team — avoid the "go-to-person" syndrome that quietly punishes reliability.
* **Non-technical assignments.** Customer support rotations, documentation, internal interrupts. Distribute deliberately.
* **Suggest a day off.** If you notice the beginning of burnout, offer recovery before the engineer has to ask for it.
* **Leave of absence.** For longer-running issues, work with HR.
* **Vacation and off days.** Respect them. Make sure the coverage plan exists for critical components.
* **Spot bonuses and recognition.** For people going above and beyond. Budget for this ahead of time, quarterly or annually — see [Resources]({{ '/resources/budgets-headcount.html' | relative_url }}).
* **Team events.** A small per-person team budget, managed by the team itself (dinners, offsites, swag — let them decide).
* **Reassignments.** Sometimes the best fix is a different team. Handle it deliberately — see [Performance & Development]({{ '/people/performance-development.html' | relative_url }}).

## The tech lead partnership

Do not prioritize technical work over people management. Rely on your tech lead to own technical soundness — they are accountable for the technical execution, not you.

A clean division of labor that works:

* **Tech lead owns** how things are built.
* **You own** who builds them and how that person grows.
* **You share** accountability for when things ship.

Make this explicit. The relationship breaks in predictable ways when it isn't: either the manager drifts into second-guessing technical decisions, or the tech lead drifts into handling people issues that should be on your desk. A daily sync and a shared ticket review prevents most of this.

{: .note }
> The tech lead-manager partnership is one of the highest-leverage relationships on the team. Clear boundaries, shared accountability, and weekly (or daily) communication make it work. Without those, it's a slow-motion failure mode that eventually costs you the tech lead.
