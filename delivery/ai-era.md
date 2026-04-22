---
title: Managing in the AI Era
layout: chapter
nav_order: 5
parent: IV. Delivery
---

{: .no_toc }
# Managing Engineering Teams in the AI Era

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

## Why this chapter exists

Two years ago, "AI in engineering" meant autocomplete. Today — April 2026 — it means a coding agent opening twelve PRs overnight, a junior engineer who ships faster than a senior did in 2023, and a performance review cycle where nobody is sure how to separate the engineer's contribution from the tools'.

This chapter is about what has actually changed for the engineering manager, and what hasn't. Most of the existing advice in this book still holds. A few specific things have been upended, and pretending they haven't is how you end up managing a 2026 team with a 2022 operating system.

{: .warning }
> If you read a management book published before 2024 and it doesn't mention coding agents, treat its delivery and productivity advice with caution. The underlying dynamics of engineering work have shifted. Not all of it, but enough that a handful of standard practices now mislead more than they help.

## What actually changed

Three things are materially different from where we were three years ago:

1. **The unit of engineering output is smaller and more frequent.** An engineer who used to ship 3-5 PRs a week now ships 15-25, and a significant fraction of those are agent-generated, human-reviewed. The firehose is real.

2. **The expertise that matters has shifted from "writing code" to "specifying, reviewing, and integrating code."** Engineers are spending less time authoring and more time directing — or they should be, if they're doing it right.

3. **The junior-to-senior apprenticeship has broken down.** Junior engineers used to build judgment by writing a lot of bad code and having seniors tell them why it was bad. Agents have compressed the writing-bad-code phase almost to zero, which sounds like a productivity win and is also a crisis for how engineers learn the craft.

Everything in this chapter is a consequence of one of those three.

## Staffing implications

### You probably need fewer engineers per feature — and different ones

Teams that have integrated agents well are shipping more with the same headcount, or the same with less. The specific claim that "one engineer can now do the work of three" is mostly marketing, but a careful modal number is closer to 1.3-1.8x for well-scoped feature work, and essentially unchanged for the messy judgment-heavy work (architecture, migrations, incident response, product strategy).

Practical implications:

- **Headcount planning assumptions from 2022 are wrong.** Most of them over-estimate the engineers needed for feature work and under-estimate the engineers needed for the integration, review, and judgment work around it.
- **The distribution of seniority matters more than the total headcount.** A team of three seniors and two agents-as-tooling outperforms a team of six mid-level engineers without them. Leverage is in the senior tier.
- **Hiring junior engineers is no longer an obvious productivity bet.** They have less to write, which means less of their previous ramp-up mechanism. They're still worth hiring — for the pipeline, for diversity of thought, for the engineers they become — but the short-term ROI math has shifted. Be deliberate about why you're hiring a junior.

### The manager's span of control is probably higher than it used to be

With agents absorbing the mechanical work, the manager-to-engineer ratio that felt crowded at 1:6 in 2022 now feels reasonable at 1:8-1:10. But only if the manager has reorganized their own work: less "sync with each engineer on what they're coding" and more "help each engineer decide what to work on and how to validate it."

If you've added engineers without changing your routine, you're now doing 2022 management on a 2026 team, and you will notice it in the form of engineers feeling over-monitored and under-supported at the same time.

## Performance evaluation

### The PR firehose is no longer signal

Scanning PRs to get a read on an engineer's activity used to be a reasonable — if imperfect — signal. It no longer is. An engineer with an agent can generate a high volume of PRs without doing any of the harder work: the design, the tradeoffs, the cleanup of the thing the agent got 80% right and failed on the last 20%.

What you should be looking at instead:

- **Quality of code review comments.** This is the single highest-signal activity in a 2026 engineering team. Good reviewers catch the subtle problems agents miss — architectural drift, security implications, contract violations. Bad reviewers rubber-stamp. The difference shows up immediately if you look.
- **Design docs and decision-making.** If the engineer is producing written reasoning — design docs, architectural decision records, postmortem analyses — that's the work that can't be delegated to an agent. It's also the work that compounds.
- **Incident response.** The place agents are still worst. An engineer's performance during an incident tells you more about them than a month of commits.
- **What junior engineers ask them.** A senior engineer's impact shows up in the questions more junior engineers bring to them. If nobody asks, either the engineer is isolated or they're not senior.
- **Actual outcomes that moved.** Did the metric improve? Did the customer adopt? Did the system get more reliable? This was always the right measure; it's now almost the only one.

### Writing performance reviews for AI-assisted work

A specific question that comes up in every performance cycle now: how do you credit work that was significantly agent-generated?

A useful frame: **agents are a tool, like any other. You credit the engineer for the outcome they produced, not the keystrokes they personally typed.** The same way you don't discount a 2015 engineer for using StackOverflow, you don't discount a 2026 engineer for using an agent. The question is whether they produced good, validated, integrated work — and whether they can explain why the work is correct.

What's appropriate to probe in a review:

- Can they defend the design choices in the code they shipped?
- Would they have caught the subtle bugs if the agent had made them? (You can test this with pair-debugging sessions.)
- Do they know what's in the code well enough to maintain it?
- Have they *reduced* complexity over the year, or just *added* code?

The engineer who ships 50 PRs but cannot explain any of them is not a strong engineer. They're a rubber-stamping pipeline.

## Onboarding in the AI era

Onboarding used to rely heavily on "write small PRs, get reviewed, absorb the codebase through exposure." That loop is weaker now because many of the small PRs an engineer would have written are written by agents instead.

A few adaptations that have worked:

- **Make the first week about reading, not writing.** Assign a tour of the codebase and the last quarter of design docs. Have the new engineer present what they learned to the team. You want to build the mental model that agents cannot build for them.
- **Pair-program with humans, not agents, for the first month.** The agent is a reasonable writing partner. It is a poor *teacher*. New hires need a human walking them through "why we built it this way" — that context is not in the code.
- **Give them intentionally agent-unfriendly work at first.** Debugging a subtle production issue. Writing documentation for a legacy system. Running a postmortem. These are the activities where they'll build real judgment.
- **Review code, not just outcomes.** A new hire shipping ten agent-assisted PRs in week three is not ramping faster than a 2022 new hire — they might be ramping slower, because the agent is doing the thinking. Look at the PR comments and the design docs to see what's actually happening.

## The junior engineer pipeline problem

This is the big unsolved strategic question of our era, and I don't have a clean answer.

The old pipeline — hire juniors, have them write a lot of code, have seniors review it, produce a mid-level engineer in two years — worked because writing a lot of code built the specific muscle of "recognizing when something is wrong because I've done it wrong before." Agents have compressed or removed that muscle-building. Junior engineers in 2026 can ship working code far faster than juniors could in 2020, and they develop architectural intuition *significantly slower*, because they haven't struggled with it firsthand.

What you can do as a manager:

- **Deliberately slow juniors down in specific places.** On architecture decisions, on debugging, on performance investigations — have them work *without* the agent, even if it's slower. The discomfort is the point. The discomfort is where judgment comes from.
- **Raise the bar on what counts as a complete task for a junior.** "The tests pass and the PR merged" is no longer the standard. "You can explain the tradeoffs in the design and predict how this will behave under load" is closer to what you need.
- **Invest in the apprenticeship relationships explicitly.** Pair juniors with seniors in structured ways — not "they sit near each other" but "they have a standing 30-minute session twice a week to walk through recent decisions." The senior's time here is some of the highest-leverage in the org.
- **Be patient with the ramp.** A junior who would have hit mid-level in 18 months in 2020 might need 24-30 months in 2026 — not because they're working less, but because judgment-building takes longer when the compiler does the easy parts for you. Calibrate promotion expectations accordingly, and be honest with junior engineers about why.

None of this is a solution. It's a holding pattern while the industry figures out how the apprenticeship actually works in this era. Whoever solves it first will produce the next generation of strong senior engineers.

## Engineer anxiety, and what you owe your team

Your engineers are watching the industry. They read the layoff headlines. They see the CEO interviews promising "10x productivity with fewer engineers." They have real, rational concerns about their jobs, their careers, and whether the thing they've spent a decade getting good at is still valued.

You owe them some version of the truth. A few things I've found worth saying, because they happen to be both true and helpful:

- **The skill that is at risk is "writing production code from specs."** The skill that is becoming more valuable is "defining what should be built, reviewing what was built, and taking responsibility for whether it works." Good engineers have always done both; the mix has shifted.
- **The number of problems that need engineering judgment has not shrunk.** If anything, the velocity of new products and systems has increased the demand for experienced engineers who can think clearly about what to build. The jobs are evolving faster than they're disappearing.
- **Junior and mid-level engineers need to adapt faster than senior engineers do.** The senior engineer whose value is judgment is mostly fine. The mid-level engineer whose value was "I can ship features consistently" is the one who has to evolve — toward more design, more review, more ownership of outcomes.
- **Not all of this is going to go well for everyone.** Some engineers will not make the transition. That's a harder conversation than the rest, and you owe it to your team to have it honestly when it applies, not to pretend it doesn't.

What you should not do: pretend nothing has changed, or pretend everything has changed. Both are gaslighting, and your team will notice.

{: .note }
> The managers doing this best right now are the ones treating the transition as a shared problem — "we're figuring this out together, and I'll be honest with you about what I'm seeing" — rather than either cheerleading or catastrophizing. Your team's trust in you is built in exactly these moments.

## Managing for and with AI: the scaffolding

All of the above is a set of problems. This section is the set of answers — or at least the three organizational practices that separate teams using AI well from teams that are either drifting or blocked.

Three things need to exist, explicitly and by name, in your org. If any of them is missing, you are flying blind on the most volatile technology shift in engineering's recent history.

### You need an AI czar

One person, accountable and named. Not a committee, not a working group, not "it's on everyone's roadmap." A single human whose job includes this, with 20-50% of their time allocated to it. Usually a senior engineer — occasionally a staff-plus IC — rarely a manager in the traditional sense, because the work requires hands-on technical depth.

The czar's mandate has three parts:

**a) Stay current on what actually matters — not on the latest fad.** The AI space produces a new "breakthrough" every week, and most of them don't survive contact with production. The czar's job is the filter: which new models, tools, and techniques are genuinely worth the team's attention, and which are noise. Without this filter, the team either chases everything and ships nothing, or tunes out completely and falls behind. Both failure modes are real, and both are expensive.

**b) Own the spend.** Token costs, API subscriptions, agent runtimes, the coding assistants you pay per seat, the model licensing. At most startups this is now a material budget line — often 5-figure monthly and climbing — and nobody explicitly owns it until someone notices it doubled last quarter. The czar tracks it, forecasts it, and optimizes it. They know, per engineer, what the AI spend is, and whether it's producing proportional value.

**c) Cheerlead AI initiatives.** Someone has to be visibly enthusiastic about experimentation without tipping into tool-evangelism. The czar lowers the activation energy for engineers trying new things — writing up what worked, running a short "have you tried this?" demo, removing the procurement friction around a $500/month tool that would save two engineers ten hours a week. They are not the person who dictates what the team should use. They are the person who makes it easy to try.

Why a single person: AI adoption in a team is a coordination problem as much as a technical one. Distributed responsibility produces distributed inattention. One name on the door means one throat to choke and one brain keeping the context current.

### A safe place to learn from each other

Engineers are experimenting with AI tools in isolation right now. Some are shipping 3x more than they used to and hiding it because they feel like they're "cheating." Others are struggling to integrate agents at all and hiding *that* because everyone else seems to have it figured out. Both groups are losing time, and the team is losing the collective learning.

You need a structured forum. Not an #ai-tools Slack channel that devolves into link-dropping — an actual working session.

Concrete shape that works at a 10-30 person engineering org:

- Biweekly, 30 minutes, standing meeting.
- Two or three engineers present, five minutes each: *here's what I tried, here's the outcome, here's what I'd do differently.*
- **Negative examples count as much as positive ones.** "The agent rewrote my authentication logic in a way that almost shipped a security bug — here's how I caught it" is more valuable than another "look how fast I went" demo. Losses you hide are losses your teammates repeat.
- No performative praise. No demo-day theater. This is an engineering review, not a marketing event.

The point of this forum is not to spread "best practices." It is to *normalize sharing*. Once engineers see their peers openly describing failures and half-working workflows, the shadow-adoption problem solves itself within a couple of months.

### A harness that makes it safe to fail

An engineer with an agent can open a dozen PRs in a night. Your CI/CD pipeline and review process have to be robust enough that no single bad contribution — from an agent or from a distracted human — can reach production. This was already true in principle. In 2026 it is true in practice, because the volume of low-attention PRs has materially increased.

Minimum requirements:

- **Test coverage that meaningfully exercises the code paths agents touch.** Coverage percentage alone is misleading; what matters is whether the tests would actually catch the classes of mistake agents make (subtle semantics changes, missing edge cases, security-relevant regressions).
- **Hard CI gates**: type checking, linting, security scanning, dependency analysis, secret detection. None of these are optional. All of them block merge.
- **Mandatory human review on every agent-generated PR.** Not rubber-stamp review — actual review, by someone who could defend the change in a design discussion. The reviewer is now the load-bearing member of the pipeline, and you should staff and train accordingly.
- **Production observability that surfaces the unusual within minutes.** When something does slip through, you want to see it in the dashboards and alerts, not in a customer email three days later.

The test of whether you're ready: state this sentence, out loud, and mean it. *"An agent cannot ship bad code to production in our org without at least one human looking at it and CI catching the obvious problems."* If you can't honestly make that statement, you are not ready to scale up agent use — fix the harness first. Scaling AI adoption on top of a weak pipeline is how you end up with an incident postmortem titled "we don't actually know how this got merged."

{: .warning }
> The most common mistake I see in 2026 is treating AI adoption as a tooling decision — "we bought Cursor for the team, we're good." AI adoption is an organizational-infrastructure decision. The tool is 10% of it. The czar, the shared-learning forum, and the harness are the other 90%, and they are the difference between compounding wins and compounding risk.

## What still holds

Most of this book's advice hasn't changed. Specifically:

- **People management is the same job it was in 2015.** 1:1s, strength maps, difficult conversations, growth planning. None of this has been automated and none of it should be.
- **Performance and development is unchanged.** OKRs, feedback, PIPs, promotions — the mechanics are the same.
- **Org design is unchanged.** Conway's Law didn't get repealed.
- **Communication, delegation, managing up — unchanged.**
- **Testing, on-call, incident response — unchanged in principle, somewhat changed in tooling.**

If the core of the job (setting engineers up to have impact, grow, and feel safe doing it) has gotten *less* important in the AI era, I haven't seen it. If anything, it's gotten more important — because when the mechanical work is automated, the only thing left that matters is the judgment and the relationships. And those are what managers produce.
