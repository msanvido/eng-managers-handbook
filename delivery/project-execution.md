---
title: Project Execution
layout: chapter
nav_order: 2
parent: IV. Delivery
---

{: .no_toc }
# Project Execution

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

## Overview

Delivering the product your roadmap committed to requires coordinating many moving pieces. This chapter covers the tools and practices that let you do that without everything living in your head: repositories, issue tracking, postmortems, technical debt management, and decision logs.

Tools simplify collaboration, planning, and tracking. They are a means, not the goal. Don't change your workflow to fit a tool — choose tools that fit your workflow.

## Code repository

### Recommendation: monolithic repository

*Why monorepo:*
- Single source of truth.
- Atomic changes across services.
- Easier refactoring.
- Simplified versioning.
- One CI/CD pipeline.

*Example structure:*
```
repo/
├── services/
│   ├── api/
│   ├── worker/
│   └── frontend/
├── packages/
│   ├── shared-utils/
│   └── types/
├── docs/
└── tools/
```

*What to avoid:*
- ❌ One repo per microservice — versioning nightmare, coordination overhead.
- ❌ Separate frontend/backend repos — artificial boundary, lots of cross-repo PRs.

The main argument against monorepos is build scale, and for most startups that argument doesn't kick in until you're well past 50 engineers. Until then, monorepo by default.

## Design doc repository

**Options:**

1. **In the code repo** — recommended for small teams.
   - `docs/design/` folder.
   - Markdown files, version controlled.
   - PRs for design docs.

2. **Separate wiki** — for larger orgs.
   - Notion, Confluence, etc.
   - Easier for non-engineers to access.
   - May have comment/approval workflows.

**Example design doc process:**
```bash
# 1. Create branch
git checkout -b design/analytics-dashboard

# 2. Write design doc
docs/design/2026-analytics-dashboard.md

# 3. Open PR for review
# 4. Iterate on feedback
# 5. Merge when approved
# 6. Design doc is now source of truth
```

## Issue and project tracking

Choose based on team size and needs.

**Small teams (< 10 engineers): GitHub Issues / Projects.**
- Simple, integrated with code.
- Free.
- Good for startups.

**Medium teams (10-50): Linear or Jira.**
- Linear: fast, beautiful, developer-focused.
- Jira: more customizable, more enterprise features.

**Large teams (50+): Jira.**
- Extensive reporting.
- Complex workflows.
- Integration ecosystem.

Most startups stay on Linear for longer than they expected and migrate to Jira reluctantly. That's usually fine.

### Using issue tracking well

**Label system example:**
```
Priority: P0 (Critical), P1 (High), P2 (Medium), P3 (Low)
Type: bug, feature, tech-debt, documentation
Status: backlog, in-progress, in-review, done
Team: backend, frontend, platform, data
```

**Sprint planning template:**
```markdown
# Sprint 42 (Jan 15 - Jan 28)

## Goals
1. Ship analytics dashboard MVP
2. Reduce API p95 latency to <200ms
3. Clear 5 high-priority bugs

## Planned Work
- [ ] Analytics: Backend API (10 pts) - Sarah
- [ ] Analytics: Frontend UI (5 pts) - Alex
- [ ] Performance: Optimize query (8 pts) - Jordan
- [ ] Bug: Fix login issue (3 pts) - Sarah

Total: 26 points (Team capacity: 28 points)

## Stretch Goals
- [ ] Analytics: Export to CSV (3 pts)
```

## Postmortems

Document major incidents and misses to prevent recurrence. Postmortems are not punishment — they are the mechanism that turns individual mistakes into organizational learning. Run them as such or don't run them at all.

### When to write a postmortem

- Production outages longer than 30 minutes.
- Data loss or corruption.
- Security incidents.
- Major roadmap delays.
- Customer-impacting bugs.

**Postmortem template:**
```markdown
# Postmortem: API Outage - Jan 15, 2026

## Impact
- Duration: 2 hours 15 minutes (10:00 AM - 12:15 PM PT)
- Affected: 100% of API users
- Customer impact: ~500 users unable to access service

## Root Cause
Database connection pool exhausted due to connection leak
in new analytics feature deployed at 9:45 AM.

## Timeline
10:00 AM - Alerts fire for API errors
10:05 AM - On-call engineer investigates
10:15 AM - Identified database connection issue
10:30 AM - Rolled back deployment
11:00 AM - Service partially restored
12:15 PM - Full service restored

## What Went Well
- Alerts fired immediately
- Rollback was quick
- Communication was clear

## What Went Wrong
- New code wasn't load tested
- Connection leak not caught in review
- Monitoring didn't catch connection pool saturation

## Action Items
- [ ] Add connection pool monitoring (Owner: Sarah, Due: Jan 20)
- [ ] Require load testing for database-heavy features (Owner: Alex, Due: Jan 22)
- [ ] Update code review checklist (Owner: Jordan, Due: Jan 20)
- [ ] Postmortem review in next team meeting (Owner: Manager, Due: Jan 18)
```

The most important line of a postmortem is the section that doesn't exist in most templates: *"what are we going to do differently, by whom, and by when?"* Without it, the postmortem is a story. With it, it's a control system.

## Technical debt management

**Definition:** technical debt is the implied cost of future rework caused by choosing an easy or quick solution now instead of a better approach.

Debt is not always bad. A startup that refuses to take on any tech debt is almost certainly optimizing for something that doesn't matter. The job is to take it consciously and pay it down before it becomes crippling.

### Tracking tech debt

**1. Create a tech-debt backlog.** Label issues as `tech-debt` in your issue tracker.

**2. Score tech debt items.** A simple system:

| Factor | Score (1-5) |
|--------|-------------|
| Impact on velocity | How much does this slow us down? |
| Risk | Probability of causing bugs or outages? |
| Effort to fix | 1 = hours, 5 = weeks |

**Total Score = Impact + Risk − Effort**. Higher = higher priority.

**Example:**
```markdown
## Tech Debt: Upgrade from Python 3.8 to 3.12

Impact on velocity: 4 (blocking new features)
Risk: 3 (moderate incompatibilities)
Effort: 4 (2-3 weeks work)

Score: 4 + 3 − 4 = 3 (Medium priority)
```

### Allocating time for tech debt

**The 20% rule.** Reserve 20% of engineering time for tech debt and platform work.

*In practice, for a two-week sprint:*
- Team capacity: 100 story points.
- Feature work: 80 points.
- Tech debt: 20 points.

*Example sprint plan:*
```
Features:
- Analytics dashboard (30 pts)
- User permissions (25 pts)
- Bug fixes (25 pts)
Subtotal: 80 pts

Tech Debt:
- Upgrade dependencies (10 pts)
- Remove deprecated API endpoints (10 pts)
Subtotal: 20 pts

Total: 100 pts
```

The 20% is a steady-state budget. It's what keeps a team from compounding into unmaintainable code. It is not a substitute for dedicated debt sprints when the debt has outgrown the budget.

### When to stop and pay down debt

**Warning signs:**
- Velocity dropping sprint over sprint.
- Increasing bug count.
- Developers actively avoiding certain parts of the code.
- Onboarding taking longer.
- Simple changes taking days.

**Response:** declare a "tech debt sprint" — dedicate a full sprint to cleanup. Communicate upward about why, and what you expect to get back from it.

## Decision making

Track important decisions so you can improve future decisions, not just the current one.

**Decision log template:**
```markdown
## Decision: Use PostgreSQL for analytics storage

**Date**: Jan 15, 2026
**Deciders**: Sarah (Tech Lead), Alex (PM), Manager
**Context**: Need to store analytics data for new dashboard

**Options Considered**:
1. PostgreSQL - relational, strong consistency
2. MongoDB - flexible schema, good for analytics
3. ClickHouse - optimized for analytics queries

**Decision**: PostgreSQL

**Rationale**:
- Already using Postgres for main DB (operational simplicity)
- Strong consistency requirements for billing analytics
- Team has Postgres expertise
- ClickHouse overkill for current scale (< 1M events/day)

**Information Available at Decision Time**:
- Estimated 500k events/day initially
- Need sub-second query performance
- Budget: prefer open-source
- Timeline: 4 weeks to MVP

**Review Date**: July 2026 (6 months)
```

### Quarterly decision review

- Review past decisions.
- What would we decide differently now?
- What information was missing?
- How can we improve future decisions?

This is one of the highest-ROI rituals in engineering leadership and one of the least practiced. Do it.

{: .note }
> The point of a decision log is not to assign blame for bad decisions — it's to disentangle "bad decision with the information available" from "bad decision because we ignored what we knew." Those are very different errors and they demand different fixes.
