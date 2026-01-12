---
title: Product
layout: default
nav_order: 2
parent: Management
---

{: .no_toc }
# The Product Management

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

# The Product

## What Makes a Great Product: The Onion Model

The product—what ultimately reaches your customers—is a combination of multiple components, each playing an important role. Think of the product as an onion, with the core technology at the center. While the core is often what teams focus on (it's the "pièce de résistance" and likely your competitive edge), a solid core is necessary but not sufficient for a great product.

Early on, you might get away with neglecting the outer layers, especially if your technology is groundbreaking or market demand is high. But as competitors emerge, those overlooked layers become a significant liability.

### The Core: Your Technology

**Examples:**
- A machine learning algorithm that's 10x more accurate
- A novel data structure that enables real-time processing
- A unique approach to solving a specific problem

### The Outer Layers

The specific layers vary by market, but for SaaS solutions, they typically include:

#### Layers Supporting Sales Motion

**1. Compliance and Security**

*Why it matters:* SOC2, HIPAA, GDPR are table stakes for enterprise sales.

*Concrete example:*
- **Without it**: "We love your product, but we can't use it without SOC2 compliance." → Deal lost
- **With it**: SOC2 badge on your website opens doors to enterprise customers

*How to approach:*
- Start SOC2 process 6-9 months before targeting enterprise customers
- Budget $50-100k for first-time certification
- Assign a compliance owner (doesn't have to be full-time initially)

**2. User Management**

*Why it matters:* Authorization, authentication, RBAC, multi-tenancy enable enterprise deployment.

*Concrete example:*
- **Basic**: Email/password authentication, everyone has same permissions
- **Enterprise-ready**: SSO (SAML/OAuth), role-based access control, audit logs, team hierarchies

*Implementation checklist:*
- [ ] SSO integration (SAML 2.0, OAuth 2.0)
- [ ] Role-based permissions (admin, editor, viewer minimum)
- [ ] Audit logs (who did what, when)
- [ ] Multi-tenant architecture (data isolation between customers)
- [ ] Session management and MFA support

**3. Scalability and Flexibility**

*Concrete example:*
- **Feature flags**: Deploy new dashboard to 10% of users, monitor performance, roll out to everyone
- **Backward compatibility**: API v2 released, but v1 continues working for 12 months with deprecation warnings

*How to implement:*
- Use feature flag service (LaunchDarkly, Split.io, or build simple toggle system)
- Establish API versioning strategy from day one
- Document deprecation policy (minimum 6 months notice)

**4. Documentation and Guides**

*Why it matters:* Reduces support burden, accelerates adoption.

*Concrete example of documentation hierarchy:*
1. **Quick Start** (5 minutes): Get first API call working
2. **Tutorials** (30 minutes each): Complete common workflows
3. **How-to Guides**: Solve specific problems
4. **Reference**: Complete API documentation
5. **Concepts**: Deep dives into architecture

*Recommended structure:*
```
docs/
├── getting-started/
│   └── quickstart.md (5-minute tutorial)
├── tutorials/
│   ├── your-first-workflow.md
│   └── advanced-integration.md
├── how-to-guides/
│   ├── authentication.md
│   └── error-handling.md
├── reference/
│   └── api-reference.md (auto-generated from OpenAPI spec)
└── concepts/
    └── architecture-overview.md
```

#### Layers Supporting Development Velocity

**1. Monitoring and Observability**

*Concrete example of monitoring stack:*
- **Metrics**: Response times, error rates, throughput (Datadog, Prometheus)
- **Logs**: Structured logs with correlation IDs (ELK, Splunk)
- **Traces**: Request flows across services (Jaeger, Honeycomb)
- **Alerts**: PagerDuty for critical issues, Slack for warnings

*How to set up (MVP):*
```yaml
# Essential metrics to track from day 1:
- API response time (p50, p95, p99)
- Error rate (by endpoint)
- Active users
- Database query performance
- Memory/CPU usage
```

**2. Release and Patching**

*Concrete release strategy example:*
- **Weekly releases**: Feature releases every Tuesday
- **Hotfix releases**: As needed, any day
- **Canary deployments**: 5% → 25% → 100% over 2 hours
- **Rollback plan**: One-click rollback within 15 minutes

# Project Management

Delivering a product requires coordinating many moving pieces. This section covers managing projects and team deliverables.

## Goals

Deliver the product as agreed with Product Management.
- **PM is responsible for**: What gets built
- **Engineering is responsible for**: Who builds it, how it's built, and when it ships

## The Who, How, When Framework

### Step 1: Define the WHO

Use your strength map (from [People Fundamentals](./people-fundamentals.html#building-a-strength-map)) to assign tasks effectively.

**Example: Building a New Analytics Dashboard**

**Task breakdown:**
1. Backend API for analytics data (Complex, 2 weeks)
2. Frontend dashboard UI (Medium, 1 week)
3. Database schema changes (Complex, 3 days)
4. Testing and QA (Medium, 3 days)
5. Documentation (Simple, 2 days)

**Assignment considerations:**

| Task | Assigned To | Rationale |
|------|------------|-----------|
| Backend API | Sarah (Senior) | Has built similar APIs, can move fast |
| Frontend UI | Alex (Mid) + Jordan (Junior) | Alex leads, Jordan learns React |
| Database | Sarah (Senior) | Critical path, needs experience |
| Testing | Jordan (Junior) | Good learning opportunity, low risk |
| Documentation | Alex (Mid) | User-facing, Alex has good communication skills |

**Distribution checklist:**
- ✅ Load balanced (Sarah: 2.5 weeks, Alex: 1.5 weeks, Jordan: 1 week)
- ✅ Learning opportunities (Jordan paired with Alex)
- ✅ Visibility (Jordan owns testing presentation in demo)
- ✅ Setup for success (Junior not on critical path alone)

### Step 2: Determine the HOW

Work closely with tech leads and architects. Your role: ensure the design is sound, achievable, not over-engineered, and not under-engineered.

**Example Design Review Process:**

**Week 1: Initial Design (Small Group)**
- *Attendees*: Tech lead, 2-3 engineers working on it, architect
- *Duration*: 1-2 hours
- *Output*: High-level design document

**Design doc template:**
```markdown
# [Feature Name] Design Doc

## Problem Statement
What are we solving? Why now?

## Goals and Non-Goals
Goals:
- Must support 1000 queries/second
- Must work on mobile

Non-Goals:
- Real-time updates (async is fine)
- Historical data >1 year

## Proposed Solution
### Architecture Diagram
[Insert diagram]

### API Design
[Example endpoints]

### Data Model
[Schema changes]

### Alternatives Considered
Why we didn't choose X, Y, Z

## Testing Plan
How we'll validate this works

## Rollout Plan
Feature flags? Phased rollout?

## Risks and Mitigations
What could go wrong?
```

**Week 1: Broader Team Review (Async)**
- Share design doc with full team
- Collect feedback in comments
- Identify dependencies and conflicts

**Week 2: Final Design** (Small Group)
- Address feedback
- Finalize approach

### Step 3: Communicate the WHEN

Only estimate after you have design feedback and understand dependencies.

**Estimation example (Analytics Dashboard):**

| Task | Estimate | Dependencies | Risk Level |
|------|----------|--------------|------------|
| Database schema | 3 days | None | Medium (migration risk) |
| Backend API | 10 days | Database complete | Low |
| Frontend UI | 5 days | API complete | Low |
| Testing | 3 days | UI complete | Medium (unknowns) |
| Documentation | 2 days | Feature complete | Low |

**Total: 23 working days = ~4.5 weeks**

Add buffer: **Ship target: 6 weeks** (30% buffer for unknowns)

**Communicate the timeline:**
- To PM: "We're targeting 6 weeks, assuming no major scope changes"
- To team: "We have 6 weeks. Let's aim for 5 and use week 6 for polish"
- To stakeholders: Update weekly on progress

## Tools and Repositories

Tools simplify collaboration, planning, and tracking. They're a means, not the goal. Don't change your workflow to fit a tool—choose tools that fit your workflow.

### Code Repository

**Recommendation: Monolithic Repository**

*Why monorepo:*
- Single source of truth
- Atomic changes across services
- Easier refactoring
- Simplified versioning
- One CI/CD pipeline

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
- ❌ One repo per microservice (versioning nightmare)
- ❌ Separate frontend/backend repos (coordination overhead)

### Design Doc Repository

**Options:**
1. **In code repo** (Recommended for small teams)
   - `docs/design/` folder
   - Markdown files, version controlled
   - PR reviews for design docs

2. **Separate wiki** (For larger orgs)
   - Notion, Confluence, etc.
   - Easier for non-engineers to access
   - May have comment/approval workflows

**Example design doc process:**
```bash
# 1. Create branch
git checkout -b design/analytics-dashboard

# 2. Write design doc
docs/design/2024-analytics-dashboard.md

# 3. Open PR for review
# 4. Iterate on feedback
# 5. Merge when approved
# 6. Design doc is now source of truth
```

### Issue/Project Tracking

**Recommendation**: Choose based on team size and needs.

**Small teams (< 10 engineers): GitHub Issues/Projects**
- Simple, integrated with code
- Free
- Good for startups

**Medium teams (10-50): Linear or Jira**
- Linear: Fast, beautiful, developer-focused
- Jira: More customizable, enterprise features

**Large teams (50+): Jira**
- Extensive reporting
- Complex workflows
- Integration ecosystem

**How to use issue tracking effectively:**

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

### Roadmap Repository

This should be the **source of truth** for the entire company.

**Principle**: If it's not on the roadmap, it's not happening.

**Roadmap levels:**
1. **Company roadmap** (6-12 months): Themes and major initiatives
2. **Product roadmap** (3-6 months): Specific features
3. **Engineering roadmap** (1-3 months): Technical work

**Example quarterly roadmap:**
```markdown
# Q1 2024 Engineering Roadmap

## Themes
1. Enterprise readiness (40% of eng time)
2. Performance and scale (30%)
3. Developer experience (20%)
4. Tech debt (10%)

## Major Deliverables

### Enterprise Readiness
- [ ] SSO integration (SAML + OAuth)
- [ ] RBAC and team hierarchies
- [ ] Audit logs
- [ ] SOC2 compliance infrastructure

### Performance
- [ ] API response time p95 < 200ms
- [ ] Support 10k concurrent users
- [ ] Database query optimization

### Developer Experience
- [ ] Improve local dev setup (< 5 min)
- [ ] Better error messages
- [ ] API documentation overhaul

### Tech Debt
- [ ] Upgrade to Node 20
- [ ] Remove deprecated endpoints
- [ ] Consolidate logging libraries
```

### Postmortems Repository

Document major incidents and misses to prevent recurrence.

**When to write a postmortem:**
- Production outages > 30 minutes
- Data loss or corruption
- Security incidents
- Major roadmap delays
- Customer-impacting bugs

**Postmortem template:**
```markdown
# Postmortem: API Outage - Jan 15, 2024

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

## Meeting Management

**Principle**: A 1-hour meeting with 10 people costs $2,000+ in time. Make it count.

### Meeting Types and Best Practices

**1. Stand-ups (Daily, 15 min)**

*Purpose*: Synchronize team, identify blockers

*Example async standup (for remote teams):*
```markdown
**Yesterday**: Finished analytics API endpoint
**Today**: Working on frontend integration
**Blockers**: Need design mockups from UX team
```

*Tips:*
- Keep to 15 minutes maximum
- Focus on blockers, not detailed updates
- Can be async for distributed teams

**2. Sprint Planning (Every 2 weeks, 1-2 hours)**

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

**3. Design Reviews (Ad-hoc, 1-2 hours)**

*Attendees*: Keep it small (5-7 people max)
- Tech lead (required)
- Engineers implementing (required)
- Product manager (if product decision needed)
- Architect (for complex systems)

*Bad*: 15-person design review where most people zone out

*Good*: 5-person focused discussion + async doc review for broader team

**4. Retrospectives (Every 2 weeks, 1 hour)**

*Format example (Start/Stop/Continue):*
```markdown
## Start
- Daily team lunch (suggested by Jordan)
- Writing more tests for critical paths

## Stop
- Last-minute scope changes mid-sprint
- Skipping code review for "urgent" bugs

## Continue
- Weekly demos to stakeholders
- Pairing junior/senior engineers
```

*Action items*: Pick 1-2 to implement next sprint

**5. 1-on-1s (Weekly or bi-weekly, 30 min)**

*See [People Fundamentals](./people-fundamentals.html#monitoring-and-feedback-tools) for details*

**6. All-hands (Monthly, 30-60 min)**

*Agenda:*
- Company updates (10 min)
- Eng org highlights (10 min)
- Demos from teams (20 min)
- Q&A (15 min)

### Meeting Best Practices

**Before the meeting:**
- [ ] Clear agenda shared 24 hours in advance
- [ ] Required prep work identified
- [ ] Right attendees invited (not too many!)

**During the meeting:**
- [ ] Start on time
- [ ] Assign note-taker
- [ ] Track action items
- [ ] End on time

**After the meeting:**
- [ ] Share notes within 2 hours
- [ ] Assign owners to action items
- [ ] Set due dates
- [ ] Close the loop (follow up on completion)

## Technical Debt Management

**Definition**: Technical debt is the implied cost of future rework caused by choosing an easy/quick solution now instead of a better approach.

### How to Track Technical Debt

**1. Create a Tech Debt Backlog**

Label issues as `tech-debt` in your issue tracker.

**2. Score Tech Debt Items**

Use a simple scoring system:

| Factor | Score (1-5) |
|--------|-------------|
| Impact on velocity | How much does this slow us down? |
| Risk | What's the probability of causing bugs? |
| Effort to fix | 1 = hours, 5 = weeks |

**Total Score = Impact + Risk - Effort**

Higher score = higher priority

**Example:**
```markdown
## Tech Debt: Upgrade from Python 3.8 to 3.12

Impact on velocity: 4 (blocking new features)
Risk: 3 (moderate incompatibilities)
Effort: 4 (2-3 weeks work)

Score: 4 + 3 - 4 = 3 (Medium priority)
```

### How to Allocate Time for Tech Debt

**20% Rule**: Reserve 20% of engineering time for tech debt and platform work.

**In practice (for 2-week sprint):**
- Team capacity: 100 story points
- Feature work: 80 points
- Tech debt: 20 points

**Example sprint plan:**
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

### When to Stop and Pay Down Debt

**Warning signs:**
- Velocity dropping sprint over sprint
- Increasing bug count
- Developers actively avoiding certain parts of code
- Onboarding taking longer
- Simple changes taking days

**Response**: Declare "tech debt sprint" - dedicate full sprint to cleanup.

## Releases and Deployment

### Release Strategy

**Example release cadence:**
- **Production releases**: Weekly (Tuesdays at 10 AM)
- **Hotfixes**: As needed, any time
- **Major releases**: Quarterly (coordinated with marketing)

### Feature Flags

**Use cases:**
1. **Product features**: Enable premium features for paid users
2. **Gradual rollouts**: Ship to 10% → 50% → 100%
3. **Kill switches**: Turn off broken features without deployment
4. **A/B testing**: Test variations with real users

**Example feature flag:**
```javascript
if (featureFlags.isEnabled('new-analytics-dashboard', user.id)) {
  return <NewDashboard />;
} else {
  return <OldDashboard />;
}
```

**Flag lifecycle:**
1. **Create** flag, default OFF
2. **Test** with internal users
3. **Rollout** 10% → 50% → 100%
4. **Monitor** performance and errors
5. **Remove** flag after 2-4 weeks (make default behavior)

{: .warning }
> **Flag debt**: Old flags are technical debt. Set a policy: Remove flags within 1 month of full rollout.

### Release Checklist

```markdown
## Pre-Release
- [ ] All tests passing in CI
- [ ] QA sign-off (for major features)
- [ ] Database migrations tested on staging
- [ ] Feature flags configured
- [ ] Monitoring and alerts in place
- [ ] Documentation updated
- [ ] Rollback plan documented

## During Release
- [ ] Deploy to staging first
- [ ] Smoke tests pass on staging
- [ ] Deploy to 10% production (canary)
- [ ] Monitor error rates for 30 min
- [ ] Deploy to 100% production
- [ ] Monitor for 1 hour

## Post-Release
- [ ] Verify key metrics unchanged
- [ ] Check error tracking (Sentry/Rollbar)
- [ ] Announce in #engineering-updates
- [ ] Update release notes
```

## Communication

### Upward Communication (To Leadership)

**Principle**: Close the loop. Always report back when things are done.

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

### Sideways Communication (To Other Teams)

**Purpose**: Avoid duplicated work, manage dependencies, coordinate resources.

**Example dependency communication:**
```markdown
To: #platform-team
From: #product-team

Hey team! We're building new analytics dashboard
that will need:
- Real-time event streaming from your data pipeline
- Access to 90-day historical data
- Estimated 10k events/second at peak

Timeline: We need this by Feb 15 for customer demo.

Can we sync this week to align on approach?
```

### Downward Communication (To Your Team)

**Transparency is key:**
- Share company updates
- Explain "why" behind decisions
- Celebrate wins
- Acknowledge challenges

**Example team update:**
```markdown
Team,

Quick update on company direction:

📈 Good news: We hit $5M ARR! This unlocks our
Series A fundraising.

📉 Challenge: Churn is higher than expected. Leadership
is prioritizing stability and polish over new features
next quarter.

Impact on us: Shift 30% of roadmap from new features
to bug fixes and performance. I know this isn't as
exciting, but it's critical for the business.

Your input: What stability/performance issues should
we prioritize? Add ideas to this doc.

Questions? Let's discuss in Friday team meeting.
```

## Delegation and Decision Making

### Delegation Done Right

**Framework**: Delegate ownership, not tasks.

**Bad delegation:**
> "Jordan, can you update the database schema for analytics?"

**Good delegation:**
> "Jordan, we need to store analytics data for the new dashboard. Requirements: support 1M records, query performance <100ms. You own the solution—database design, migration plan, and deployment. I'm here if you need help. Let's sync Monday for your proposal."

**Why good delegation works:**
- Ownership = motivation
- Space to learn and grow
- You review the approach, not micromanage
- Builds future leaders

### Delegation Levels

**Level 1: Tell**
*Use when*: High stakes, inexperienced person, urgent timeline

*Example*: "Production is down. Run these exact commands to restore service."

**Level 2: Sell**
*Use when*: You have a strong opinion but want buy-in

*Example*: "I think we should use Postgres instead of MongoDB because of strong consistency requirements. Here's my reasoning. Thoughts?"

**Level 3: Consult**
*Use when*: You want input before deciding

*Example*: "We need to pick our deployment strategy. I've outlined 3 options. What are your thoughts?"

**Level 4: Agree**
*Use when*: Team decides together

*Example*: "Let's discuss as a team and agree on our API versioning strategy."

**Level 5: Delegate**
*Use when*: Person is capable, stakes are manageable

*Example*: "You own the decision on which charting library to use. Keep me posted."

### What Never to Delegate

- Letting people go (especially if you hired them)
- Non-reversible decisions with major impact
- Politically sensitive communications
- Final accountability (you can delegate work, but you're still responsible)

### Decision Making Process

Track important decisions to improve future decision-making.

**Decision log template:**
```markdown
## Decision: Use PostgreSQL for analytics storage

**Date**: Jan 15, 2024
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

**Review Date**: June 2024 (6 months)
```

**Quarterly decision review:**
- Review past decisions
- What would we decide differently now?
- What information was missing?
- How can we improve future decisions?

## Quality and Testing

### Testing Strategy

**Test Pyramid:**
```
       /\
      /UI\      10% - UI/E2E Tests
     /____\
    /      \
   /        \   30% - Integration Tests
  /  INTEG  \
 /___________\
/             \
/ UNIT TESTS  \ 60% - Unit Tests
/_______________\
```

**Unit Tests (60% of test effort):**
- Test individual functions/classes
- Fast (milliseconds)
- Run on every commit
- Target: 80%+ code coverage on business logic

**Integration Tests (30% of test effort):**
- Test components working together
- Test database queries
- Test API endpoints
- Run before deployment

**UI/E2E Tests (10% of test effort):**
- Test critical user flows
- Slow (minutes)
- Run before production deployment
- Keep minimal (most brittle)

### Example Testing Guidelines

**Required before merging PR:**
```markdown
- [ ] Unit tests for new functions
- [ ] Integration test for API endpoint
- [ ] Manual testing of UI changes
- [ ] All tests passing in CI
```

**Critical paths requiring E2E tests:**
- User registration and login
- Payment processing
- Core product workflows

### QA Best Practices

**QA's role**: Help prevent bugs, not just find them.

**How to work with QA:**
1. **Include QA early**: In design reviews, not just at the end
2. **Clear acceptance criteria**: QA knows what "done" looks like
3. **Staging environment**: QA tests in production-like environment
4. **Bug triage**: Prioritize bugs together (P0/P1/P2)

**QA feedback loop:**
```
Developer → Code Review → QA Testing → Production
                ↑              ↓
                └── Bug Found ──┘
                  (fix and repeat)
```

## On-Call Management

### Setting Up On-Call Rotation

**Example rotation (team of 6):**
- **Schedule**: 1-week rotations
- **Rotation**: Primary + Secondary
- **Coverage**: 24/7 (weekday + weekend)

**Rotation calendar:**
```
Week  | Primary  | Secondary
------|----------|----------
Jan 8 | Sarah    | Alex
Jan 15| Alex     | Jordan
Jan 22| Jordan   | Sarah
Jan 29| Sarah    | Alex
```

### On-Call Responsibilities

**Primary on-call:**
- Respond to pages within 15 minutes
- Investigate and triage issues
- Fix if possible, escalate if needed
- Write incident summary

**Secondary on-call:**
- Backup if primary doesn't respond in 30 min
- Help with complex issues
- Review incident summaries

### On-Call Compensation

**Options:**
1. **Time off**: 1 day off for each week on-call
2. **Bonus**: $500-1000/week on-call stipend
3. **Hybrid**: 0.5 day off + $250/week

### Reducing On-Call Burden

**Track interrupt patterns:**
```markdown
Week of Jan 15 - Interrupts: 8

Breakdown:
- Database connection timeouts: 3 (Action: add monitoring)
- Cache invalidation issues: 2 (Action: improve docs)
- User support questions: 2 (Action: FAQ)
- Legit production issue: 1
```

**Continuous improvement:**
- Fix recurring issues
- Improve monitoring and alerts
- Better documentation
- Automate common fixes

**Avoid single point of failure:**
- Document tribal knowledge
- Pair junior with senior engineers
- Cross-train on different systems
- Rotate on-call responsibilities

## Agile Methodologies

### Choosing the Right Methodology

**Scrum** (Best for: Teams with predictable cadence, well-defined features)

*Key elements:*
- 2-week sprints
- Daily stand-ups
- Sprint planning, review, retrospective
- Product backlog

*When it works:*
- Building features with clear requirements
- Stakeholders want predictable delivery
- Team comfortable with ceremonies

**Kanban** (Best for: Support teams, continuous flow, unpredictable work)

*Key elements:*
- Visualize workflow
- Limit work in progress (WIP)
- Continuous delivery (no sprints)
- Pull system

*When it works:*
- Bug fixes and support work
- Priorities change frequently
- Continuous deployment

**Hybrid** (What most teams actually do)

*Example:*
- 2-week sprints (Scrum-like structure)
- Kanban board for visualization
- Limit WIP to prevent context switching
- Flexible on ceremonies (skip what doesn't add value)

### Making Agile Work

**Don't cargo cult Agile:**
- ❌ Bad: "We must do daily stand-ups because Scrum says so"
- ✅ Good: "Daily check-ins help us catch blockers early. Let's try it."

**Adapt to your team:**
- Small team (<5)? Maybe skip formal sprint planning
- Distributed team? Async stand-ups work fine
- Firefighting a lot? Maybe Kanban is better than Scrum

**Measure what matters:**
- Cycle time (idea → production)
- Deployment frequency
- Change failure rate
- Team satisfaction

## PM and Sales Relationship

### The Triangle of Responsibility

```
        PM
       /  \
      /    \
     /      \
 Sales ---- Engineering
```

**PM decides**: What to build (roadmap)
- Gathers input from Sales and Engineering
- Prioritizes based on business value

**Engineering decides**: Who builds it and when
- Estimates complexity
- Allocates resources
- Commits to timeline

**Sales is PM's customer**: Roadmap must support sales needs
- Customer requests flow through PM
- PM validates and prioritizes
- Engineering delivers

### Working with Product Management

**Weekly PM-Eng sync agenda:**
```markdown
1. Roadmap updates (15 min)
   - What's changing?
   - New priorities?

2. In-flight projects (15 min)
   - Status of current work
   - Any blockers?

3. Upcoming work (15 min)
   - Next quarter planning
   - Resource needs

4. Technical debt discussion (10 min)
   - What needs attention?
   - Trade-offs with features

5. Customer feedback (5 min)
   - What are customers saying?
   - Bugs or issues?
```

### Feature Request Process

**Bad process:**
```
Sales → Direct to Engineering → Chaos
```

**Good process:**
```
Sales → PM (validates + prioritizes) → Roadmap → Engineering
```

**How Engineering should handle direct requests:**
```
Salesperson: "Customer needs X by next week!"

Engineering: "Thanks for flagging! Can you create a
ticket and work with PM to prioritize? We can provide
a technical assessment of effort."
```

## Organization and Product Strategy

Conway's Law states: "Organizations design systems that mirror their own communication structure."

This is proven true repeatedly. Deliberately structure your teams to support your product architecture and development velocity.

**Example:**

**Monolithic Product → Single Team**
- Everyone knows entire codebase
- Coordination is easy
- Scales to ~10 engineers

**Microservices → Multiple Teams**
- Teams own specific services
- Clear boundaries and contracts
- Required for >20 engineers

See [Team Organization & Structure](./people/team-structure.html) for detailed team topology models.

{: .note }
> **Remember**: Build the product your customers need, not the product you want to build. Stay close to customers, ship frequently, and iterate based on feedback. Perfect is the enemy of shipped.
