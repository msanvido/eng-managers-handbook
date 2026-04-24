---
title: V. Infrastructure
layout: default
nav_order: 6
has_children: true
hide_reading_time: true
---

<p class="part-index__eyebrow">Part V</p>

# Infrastructure

<p class="part-index__lede">What an engineering manager needs to know about CI/CD and security to make informed decisions — not to be the expert, but to recognize when one is needed.</p>

This part is deliberately scoped. Entire books exist on DevOps and on security — you don't need another one here. What you need is enough to know what good looks like, to allocate resources wisely, and to avoid the specific traps that catch engineering leaders who treat these areas as "someone else's job."

Two chapters:

1. **[CI/CD and DevOps]({{ '/infrastructure/devops.html' | relative_url }})** — pipeline fundamentals, metrics that matter, a realistic implementation roadmap, and the tradeoffs between the common tools.

2. **[Security and Compliance]({{ '/infrastructure/security.html' | relative_url }})** — security principles, compliance frameworks (SOC2, HIPAA, GDPR, PCI DSS), and when each starts to matter for a startup.

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
