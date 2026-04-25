---
title: IV. Resources & Infrastructure
layout: default
nav_order: 5
has_children: true
hide_reading_time: true
---

<p class="part-index__eyebrow">Part IV</p>

# Resources & Infrastructure

<p class="part-index__lede">Budget, compensation, headcount, tools, CI/CD, security. Unglamorous, mission-critical, and the area most new managers underinvest in — right up until the moment it bites them.</p>

Most new engineering managers treat resource and infrastructure decisions as someone else's job. Finance owns the numbers; SRE owns the pipelines; the security team owns the audits. None of those framings is wrong on its own — and all three together leave the engineering manager out of the room when the decisions that shape day-to-day engineering work get made. You own the choices that determine what the numbers and the systems actually mean for your team.

## What this part covers

Three chapters:

1. **[Budgets and Headcount]({{ '/resources/budgets-headcount.html' | relative_url }})** — annual budget planning, quarterly reviews, OpEx vs. CapEx, professional development budgets, and the compensation system: bands, reviews, merit increases, promotions, and how to handle compression and inversion.

2. **[CI/CD and DevOps]({{ '/resources/devops.html' | relative_url }})** — pipeline fundamentals, the metrics that matter, a realistic implementation roadmap, and the tradeoffs between the common tools.

3. **[Security and Compliance]({{ '/resources/security.html' | relative_url }})** — security principles, compliance frameworks (SOC2, HIPAA, GDPR, PCI DSS), and when each starts to matter for a startup.

The DevOps and Security chapters are deliberately scoped. Entire books exist on each — you don't need another one here. What you need is enough to know what good looks like, to allocate resources wisely, and to avoid the specific traps that catch engineering leaders who treat these areas as "someone else's job."

Read the budgets chapter before your first budget cycle, not during it.

## On tool selection

A lot of engineering leadership is about choosing tools — for project tracking, for CI/CD, for monitoring, for documentation. The specific recommendations in the chapters that follow will age. The principles below age less quickly.

Ten rules that keep showing up:

1. **Start with the problem, not the tool.** Define what you're trying to solve before evaluating solutions.
2. **Minimize tool sprawl.** Too many tools create context-switching overhead and integration problems.
3. **Prioritize integration.** Tools should work together rather than creating data silos.
4. **Consider total cost of ownership.** Include licensing, training, maintenance, and migration costs.
5. **Evaluate vendor stability.** Assess long-term viability and support of commercial tools.
6. **Plan for migration.** Have strategies for data export and tool switching — you'll need them eventually.
7. **Pilot before committing.** Test tools with a small team before an org-wide rollout.
8. **Gather team feedback.** The people using the tools daily should have input on selection.
9. **Document tool decisions.** Record why tools were chosen; see [Project Execution]({{ '/delivery/project-execution.html' | relative_url }}#decision-making).
10. **Review regularly.** Periodically reassess whether tools still serve your needs. What was right at 10 engineers is often wrong at 50.

{: .note }
> The best tool is the one your team will actually use. Prioritize adoption and usability over feature checklists. A simpler tool used consistently is better than a powerful tool used poorly.
