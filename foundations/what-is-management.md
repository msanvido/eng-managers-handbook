---
title: What Engineering Management Is
layout: chapter
nav_order: 1
parent: I. Foundations
---

# What Engineering Management Is

## The job, in one sentence

Your job as an engineering manager is to help your direct reports do three things:

* Have impact and ship real outcomes.
* Learn and grow.
* Feel engaged, safe, and reasonably happy while doing it.

That's it. Everything else in this book is in service of one of those three.

A useful anchor phrase, borrowed and repeated often enough that it becomes reflex:

{: .note }
> You **lead people**, and you **manage things**. Not the other way around.

Managing and leading is not about handing tasks to people and collecting the outputs. It is about achieving a goal *with the help of* people. Engineers are not tickets in a sprint — they're the reason anything ever ships.

## What managers actually do

Strip away the role titles and the Slack noise, and the job reduces to four postures you rotate through all day:

* **Coach.** You ask questions that help your reports think more strategically. You resist solving their problems for them. You let them own the answer.
* **Role model.** You set the climate. Your reports will model your habits, your moods, and your values. Use that influence deliberately.
* **Multiplier.** An individual contributor is successful when *he/she* gets result. A manager is successful when *each of their reports* — and the team as a whole — gets results. This is the hardest shift for new managers coming from senior IC roles.
* **Cheerleader.** For the team, for the work, for the wins that would otherwise go unnoticed. Most engineering work is invisible; someone has to make it visible and celebrate it.

Management does not require being liked. The right decisions are sometimes unpopular, and sometimes you will make someone unhappy. What it does require, beyond authenticity, are four things that are easy to list and hard to actually hold:

1. **Consistency.** Your actions and decisions should match your stated values. Inconsistency is what erodes trust — far more than any single bad call.
2. **Fairness.** Treat everyone equitably. Base decisions on merit and evidence. People forgive tough calls; they don't forgive favoritism.
3. **Empathy, and real openness to feedback.** Actively listen. Say "you're right, I was wrong" when you are. Humility builds teams that will tell you the truth.
4. **Integrity.** Boring to write about, non-negotiable in practice. Once people decide you can't be trusted, you're done — it's just a question of how long before they leave or you do.

Without these, no leadership style will do the work for you.

{: .warning }
> **The culture of your team is dictated by the worst behavior you are willing to tolerate.** Say it again. Every shortcut you ignore, every interruption you allow, every low-effort PR you merge without pushback — that's your bar. Your team reads it more clearly than any values doc.

### What the research says

Two pieces of management research worth knowing — the book doesn't lean on them, but they provide some ground evidence to the opinions in this book.

- **Google's Project Oxygen** studied what actually differentiated the company's best managers (the ones that led the best perfoming teams) from the worst. The top behaviors were not technical: being a good coach, empowering the team without micromanaging, showing interest in team members' success and well-being, being results-oriented, being a good communicator. Technical skill was on the list, but near the bottom.
- **Gallup's *First, Break All the Rules*** — based on decades of interviews with great managers — identified four things great managers do differently: (1) they select for *talent*, not experience or knowledge; (2) they define the right *outcomes*, not the steps to get there; (3) they focus on building people's *strengths* rather than fixing their weaknesses; (4) they help each person find the *right fit* — the role where they'll thrive.

Both converge on the same point: great management is not about being the smartest technical person in the room. It is about selecting, directing, and enabling the people who are.

### The dysfunctional version

You can also recognize bad management by its negative space. The three symptoms I see most often in dysfunctional teams — call it "Leadership Dysfunctional Disorder" if you want a name for it:

- **"I don't know who is accountable."**
- **"My teammates don't trust each other."**
- **"Our purpose and priorities are unclear."**

The classic instance is the "pigeon boss" — the kind of manager you never see, until they fly in, shit all over everything, and fly right back out. If you hear any of the three sentences above from your team about you, fix the corresponding failure mode first. Everything else in management is easier once accountability, trust, and clarity are in place.

## Leadership style

There's a large literature on leadership styles: servant, autocratic, benevolent dictator, democratic, laissez-faire, transactional, charismatic. Read it if you're curious. In practice, in my opinion only two things matter:

1. **Pick a style that matches who you actually are.** Adopting a persona that doesn't fit you will show up in small inconsistencies, and your team will notice long before you do. Your version of management is the only version that will compound over time.
2. **For small teams, the servant leadership is the way.** When you're growing a team and a product at the same time, the fastest way to move is to remove obstacles, enable autonomous execution, and let smart people do what you hired them for. You lead by serving, not by directing.

See [servant leadership](https://en.wikipedia.org/wiki/Servant_leadership) if you want the academic framing. See most of the rest of this book for what it looks like in practice.

{: .warning }
> **The servant-leadership trap.** Resist the urge to take over when problems arise. "Don't worry, I'll handle it" is satisfying to say and destructive to do. Peole learn most from failing the succeeding. Your job is to help your team solve the problem themselves, not to solve it for them. The short-term win costs you a long-term contributor.

## The management trap: drifting from the work

As you get more senior, you'll move further and further from hands-on technical work. This is inevitable and mostly correct — you shouldn't be writing production code on the critical path. But drift too far and you'll lose the intuitions that make you effective: for what's easy vs. hard, for what's a real estimate vs. a polite one, for what "this is going to take another week" actually means. And with current AI tooling it's easier than ever to stay close to the trenches — there are no excuses anymore.

### How to stay in the trenches

Things that have helped me keep enough skin in the technical game without getting in the way:

* **Take small, non-critical projects.** A library upgrade. A flaky test you've been meaning to fix. A script the team keeps meaning to write. Nothing on the critical path, nothing that blocks someone else.
* **Participate in code review.** You don't need to be the deepest reviewer on the team. You need to read enough to track where the architecture is going and how the team thinks.
* **Be an "eagle eye" in technical discussions.** Sit in on design reviews. Listen more than you talk. Spot where someone is struggling and create space for them — or ask the dumb question that unlocks the room.

The goal isn't to stay as technical as a senior engineer. The goal is to stay technical enough that you can tell when an engineer is sandbagging, struggeling, when an estimate is fantasy, and when the team is stuck on something that isn't actually the hard problem.

{: .note }
> Related reading: Paul Graham's [Maker's Schedule, Manager's Schedule](http://www.paulgraham.com/makersschedule.html), and Cal Newport's *Deep Work*. The manager's day is structurally hostile to deep technical work — which is exactly why you have to defend it deliberately.

## The three things this book is organized around

Everything that follows clusters into the things a manager actually has leverage over, in priority order:

1. **People.** A productive, healthy team is the foundation of everything else. A great team doesn't guarantee a great product, but a broken team guarantees a bad one.
2. **Building te product.** You are accountable for what the team ships and when. Not what gets built (that's Product's call) but who builds it, how, and when it lands.
3. **Resources.** Budget, headcount, tooling, infrastructure. Unglamorous, mission-critical, and the thing most new managers underinvest in — right up until the moment it bites them.

Supporting those three are two more operational areas every EM has to be conversant in: **org design** (how you shape the team to match the work) and **infrastructure** (what you need to know about suppoorting the product).

{: .note }
> the infrastructure secton is will be a moving target especially with inference becoming more and more important in your stack.

That's the whole book.

{: .important }
> Happy, engaged engineers build great products. Great products create loyal customers. Every other management trick is downstream of this. Don't lose sight of the order.

{: .note }
> Constantly prune bullshit. — *Paul Graham*
