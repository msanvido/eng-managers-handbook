---
title: Budgets and Headcount
layout: chapter
nav_order: 1
parent: IV. Resources
---

{: .no_toc }
# Budgets and Headcount

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

## Overview

Managing resources — budget, headcount, tools, and infrastructure — is a core responsibility for engineering leaders, and usually the one most new managers avoid until it's forced on them. This chapter covers how to plan, allocate, and monitor resources effectively, with the specific goal of enabling your team's success while being a genuinely good steward of company money.

## Budget planning

### Annual budget planning

Engineering budgets follow the company's fiscal year and have four major categories. The proportions are rough — adjust for your company.

**1. Personnel (70-80% of budget)**
- Base salaries.
- Bonuses and commissions.
- Equity compensation.
- Benefits — health insurance, 401k matching, etc.
- Payroll taxes.
- Recruiting costs — recruiters, job boards, interview expenses.

**2. Infrastructure and tools (10-20%)**
- Cloud infrastructure (AWS, GCP, Azure).
- SaaS tools and licenses.
- Development tools and IDEs.
- CI/CD platforms.
- Monitoring and observability.

**3. Professional development (2-5%)**
- Conference attendance.
- Training and courses.
- Certifications.
- Books and learning resources.

**4. Other operating expenses**
- Office equipment — laptops, monitors, etc.
- Travel and accommodation.
- Team events and offsites.
- Vendor services and consultants.

### Budget planning process

**Step 1: Review historical spending.**
- Analyze the previous year's actual spending vs. budget.
- Identify trends and anomalies.
- Understand what drove overages or underspending. "We underspent because hiring slipped three months" and "we underspent because the plan was wrong" are very different stories.

**Step 2: Forecast headcount.**
- Work with leadership to understand growth plans.
- Account for attrition — typically 10-15% annually in tech.
- Plan for backfills and new roles.
- Consider hiring timeline — allow 2-3 months from req opening to start date, often more for senior roles.

**Step 3: Calculate personnel costs.**
- Current team salaries and benefits.
- Planned raises and promotions — typically 3-5% merit increases.
- New hires at market rates for your location and level.
- Bonus pool — if applicable, typically 10-20% of base.
- Recruiting costs — estimate $15-30k per hire.

**Step 4: Estimate infrastructure and tools.**
- Review current infrastructure spending trends.
- Account for growth in usage (scales with team size).
- Plan for new tools or platform migrations.
- Factor in price increases — cloud costs typically grow 10-20% year over year.

**Step 5: Allocate professional development.**
- Set per-person budget — typically $1,500-3,000 per person per year at startups.
- Reserve budget for high-value conferences.
- Plan for team-wide training initiatives.

**Step 6: Build in contingency.**
- Add 5-10% buffer for unexpected costs.
- Plan for emergency hiring needs.
- Account for market adjustments.

### Budget allocation approach

**Top-down.** Finance/leadership sets the overall engineering budget, VP Eng/CTO allocates across teams, team leads manage the allocation.

**Bottom-up.** Teams propose budgets based on their needs, leadership reviews and adjusts. More accurate, more time-consuming.

**Hybrid (recommended).** Leadership provides guidance and constraints, teams submit proposals within those parameters, collaborative review and final allocation.

### Quarterly budget reviews

Monitor and adjust quarterly.

**What to review:**
- Actual vs. planned spending (overall and by category).
- Headcount vs. plan (hires, departures, open reqs).
- Cloud and infrastructure costs vs. forecast.
- Tool utilization and ROI.

**Common issues:**
- **Underspending on headcount.** Hiring is taking longer than planned (extremely common).
- **Infrastructure overspending.** Underestimated growth or inefficiencies.
- **Tool sprawl.** Redundant or underutilized tools.

**Adjustments:**
- Reallocate from underspent categories.
- Request additional budget if justified.
- Cut or reduce underutilized resources.

## OpEx vs. CapEx

Engineering-led decisions show up on the P&L and the balance sheet differently depending on whether they're operating expenses or capital expenses. At a cloud-native startup this mostly abstracts away, but it's worth understanding the mechanics — especially if your company is growth-stage and finance starts asking about it.

### Operating expenses (OpEx)

Day-to-day expenses required to run the business, deducted from revenue in the same fiscal period.

**Engineering OpEx examples:**
- Employee salaries and benefits.
- Cloud infrastructure costs.
- SaaS subscriptions.
- Consulting and contractor fees.
- Office supplies and minor equipment.
- Training and professional development.

**Characteristics:**
- Fully tax-deductible in the year incurred.
- Predictable and recurring.
- Easier to scale up or down.
- Shows up on the P&L.

### Capital expenses (CapEx)

Investments in assets that provide value over multiple years, depreciated over time.

**Engineering CapEx examples:**
- On-premise data center equipment.
- Large multi-year software license purchases.
- Major infrastructure investments.
- Proprietary technology development (in some cases).

**Characteristics:**
- Depreciated over useful life — typically 3-5 years.
- Shows up on the balance sheet.
- Requires larger upfront investment.
- Less flexible — harder to cancel or reduce.

### Why most startups prefer OpEx

Five reasons:
1. **Cash preservation** — no large upfront investments.
2. **Flexibility** — scale resources with business needs.
3. **Tax benefits** — immediate deduction vs. depreciation.
4. **Reduced risk** — avoid obsolescence of owned equipment.
5. **Predictability** — easier to forecast and budget.

For 90% of engineering decisions at a 0-50 person startup, the right framing is "OpEx, via the cloud." The CapEx conversation re-enters when you're doing something genuinely large — on-prem buildouts, long-term committed use agreements with cloud vendors, major platform acquisitions.

### Managing OpEx efficiently

**Cloud spending:**
- Set up cost alerts and budgets.
- Review monthly spending by service and team.
- Identify waste — unused resources, over-provisioned instances.
- Implement auto-scaling and rightsizing.
- Use reserved instances or savings plans for predictable workloads.

**SaaS tools:**
- Audit licenses quarterly — remove unused seats.
- Consolidate overlapping tools.
- Negotiate enterprise agreements for volume discounts.
- Annual vs. monthly billing typically saves 15-20%.

**Track and report:**
- Monthly OpEx vs. budget.
- Cost per engineer.
- Cost per customer/transaction (unit economics).
- Trending and forecasts.

## Professional development budget

Investing in your team's growth is essential for retention and capability building.

### Benchmarks

- **Startups:** $1,500-2,500 per person per year.
- **Mid-size:** $2,500-4,000 per person per year.
- **Large tech:** $4,000-6,000+ per person per year.

### What's included

- Conference attendance — ticket, travel, accommodation.
- Online courses and certifications.
- Books and learning materials.
- Workshops and training programs.
- Professional membership fees.

### Allocation strategies

**Per-person budget.** Each engineer gets allocated budget (e.g., $2,000/year). Self-directed within guidelines. Use-it-or-lose-it. Encourages ownership.

**Team pool.** Budget allocated to the team, not individuals. Manager approves requests. Flexibility for high-value opportunities. Can create perceived inequity if not managed carefully.

**Hybrid (recommended).** Base allocation per person (~$1,500), plus a team pool for high-value opportunities and manager discretion.

### Guidelines

**Approval process:**
- Small expenses (<$500): manager approval.
- Large expenses (>$500): written proposal.
- Conferences: consider business value and fairness across the team.

**Reimbursement:**
- Clear policy on what's covered.
- Expense report requirements.
- Timelines for reimbursement.

**ROI expectations:**
- Share learnings with the team — brown bag, doc, etc.
- Apply new skills to work.
- For expensive programs, consider a tenure commitment.

## Compensation management

Compensation is usually your largest budget category and almost always the single most important factor in attracting and retaining talent.

### Compensation philosophy

1. **Competitive.** Pay at or above market rates for your location and stage.
2. **Equitable.** Similar roles and performance produce similar pay.
3. **Transparent.** Clear bands and criteria, even if specific numbers aren't shared.
4. **Performance-based.** Top performers earn meaningfully more.
5. **Market-informed.** Regularly benchmark against industry data.

### Components

**Base salary.**
- Fixed annual salary.
- Primary component — 60-80% of total comp for ICs.
- Based on role, level, location, and market rates.

**Variable.**
- Performance bonuses (0-20% of base).
- Commissions (for sales-adjacent roles).
- Spot bonuses for exceptional work.

**Equity.**
- Stock options (common at startups).
- RSUs (more common at later-stage and public companies).
- Typically 4-year vesting with a 1-year cliff.
- Significant component — 20-40% of total comp at early-stage companies.

**Benefits.**
- Health insurance.
- 401k matching.
- PTO and holidays.
- Parental leave.
- Other perks (meals, transit, etc.).

### Setting compensation bands

**Step 1: Define levels.** Use an industry-standard leveling framework with clear criteria for each level. See [Performance & Development]({{ '/people/performance-development.html' | relative_url }}#leveling-and-promotions).

**Step 2: Benchmark market rates.** Use compensation data sources:
- [levels.fyi](https://levels.fyi)
- [Pave](https://www.pave.com)
- [Radford Survey](https://radford.aon.com)
- [Carta Compensation Data](https://carta.com/compensation/)

Account for location (SF/NYC vs. remote vs. international) and company stage (early-stage pays more equity, less cash).

**Step 3: Create bands.** Set min, midpoint, and max for each level. Typical spread: 20-30% from min to max. Example for Senior Engineer:
- Min: $140k
- Midpoint: $160k
- Max: $180k

**Step 4: Position current employees.** Map current salaries to bands. Identify outliers (above max, below min). Plan adjustments over time.

### Compensation review process

**Cadence:**
- Annual comprehensive reviews.
- Mid-year adjustments for promotions or market corrections.
- Ad-hoc for retention situations.

**The annual process:**

**1. Prepare (2-3 months before review date).**
- Review budget allocation for raises.
- Gather performance data.
- Benchmark current comp vs. market.
- Identify high performers and retention risks.

**2. Manager proposals.**
- Managers propose raises for their team.
- Justify with performance data.
- Highlight retention risks explicitly.
- Stay within allocated budget.

**3. Calibration.**
- Cross-team review of proposals.
- Ensure consistency and equity.
- Senior leadership approval.
- Final budget allocation.

**4. Communication.**
- Managers deliver news in 1:1s.
- Provide context and rationale.
- Document in writing.
- Address questions and concerns.

### Types of compensation adjustments

**Merit increases (annual).**
- Based on performance.
- Typical ranges:
  - Meets expectations: 3-5%.
  - Exceeds expectations: 5-8%.
  - Far exceeds: 8-12%.
- Applied across the board annually.

**Promotions.**
- Role level change.
- Typically 10-20% increase.
- Should bring the person to the new level's band midpoint.
- Include an equity refresh.

**Market adjustments.**
- Correct for market movement.
- Not performance-based.
- Bring comp in line with current market.
- May be done off-cycle.

**Retention adjustments.**
- Reactive to counter-offers or flight risk.
- Higher risk — signals you need an offer to earn a raise.
- Better: proactive market adjustments for key people before they start looking.

**Equity refreshes.**
- Annual grants to top performers.
- Keep equity meaningful over time.
- Typically smaller than initial grant.
- Vest over 4 years (same schedule as initial).

### Compression and inversion

Two problems that sneak up on you.

**Compression.** Senior people's salaries don't reflect seniority.
- *Caused by:* Market rate increases; not adjusting existing salaries.
- *Fix:* Regular market adjustments for the entire team, not just new hires.

**Inversion.** New hires paid more than existing employees in the same role.
- *Caused by:* Hot market; not adjusting existing salaries when hiring at higher rates.
- *Fix:* When you hire above an existing employee's comp, adjust theirs in the same cycle. If you don't, they'll find out eventually, and the trust damage is disproportionate.

### Compensation conversations

**Tips:**
- Come prepared with data and rationale.
- Listen to concerns.
- Don't make promises you can't keep.
- If the news is bad, acknowledge the disappointment without defending the decision twelve times.
- Focus on total comp — base + equity + benefits — not just base.
- Discuss development areas for future increases.

**Handling compensation requests:**
- Take time to review.
- Gather market data and budget.
- Consider total compensation, not just base.
- If yes: process through the normal review cycle.
- If no: explain the rationale and the path forward.
- If maybe: outline what would change the decision.

## Budget tools and resources

**Budget planning:**
- Google Sheets / Excel for smaller teams.
- [Mosaic](https://www.mosaic.tech/) — financial planning platform.
- [Vena](https://venasolutions.com/) — budget and planning software.

**Cloud cost management:**
- [AWS Cost Explorer](https://aws.amazon.com/aws-cost-management/aws-cost-explorer/).
- [GCP Cost Management](https://cloud.google.com/cost-management).
- [CloudHealth](https://www.cloudhealthtech.com/).
- [Cloudability](https://www.apptio.com/products/cloudability/).

**Compensation benchmarking:**
- [levels.fyi](https://levels.fyi).
- [Pave](https://www.pave.com).
- [Carta Total Compensation](https://carta.com/total-compensation/).
- [Radford](https://radford.aon.com) — comprehensive surveys, expensive.
