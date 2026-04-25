---
title: Product and Roadmap Management
layout: chapter
nav_order: 1
parent: III. Building the Product
---

# Product and Roadmap Management

## What makes a great product: the onion model

The product — what ultimately reaches your customers — is a combination of multiple components, each playing an important role. Think of the product as an onion, with the core technology at the center. The core is often what teams focus on — it's the *pièce de résistance* and likely your competitive edge — but a solid core is necessary and not sufficient for a great product.

Early on, you can get away with neglecting the outer layers, especially if your technology is groundbreaking or market demand is high. But as competitors emerge, those overlooked layers become significant liabilities. The companies that fail late do so because they neglected the outer layers for too long.

### The core: your technology

Examples:
- A machine learning model that is materially more accurate than alternatives.
- A novel data structure that enables real-time processing at a price point competitors can't match.
- A unique approach to a specific problem customers have been paying for in spreadsheets.

### The outer layers

The specific layers vary by market, but for SaaS solutions they typically include:

#### Layers supporting the sales motion

**1. Compliance and security**

*Why it matters:* SOC2, HIPAA, GDPR are table stakes for enterprise sales.

*Concrete example:*
- **Without it**: "We love your product, but we can't use it without SOC2 compliance." → Deal lost.
- **With it**: SOC2 badge on your website opens doors to enterprise customers.

*How to approach:*
- Start the SOC2 process 6-9 months before targeting enterprise customers.
- Budget $50-100k for first-time certification.
- Assign a compliance owner (doesn't have to be full-time initially).

See [Security & Compliance]({{ '/infrastructure/security.html' | relative_url }}) for depth on this layer.

**2. User management**

*Why it matters:* Authorization, authentication, RBAC, multi-tenancy enable enterprise deployment.

*Concrete example:*
- **Basic**: Email/password authentication, everyone has same permissions.
- **Enterprise-ready**: SSO (SAML/OAuth), role-based access control, audit logs, team hierarchies.

*Implementation checklist:*
- [ ] SSO integration (SAML 2.0, OAuth 2.0)
- [ ] Role-based permissions (admin, editor, viewer minimum)
- [ ] Audit logs — who did what, when
- [ ] Multi-tenant architecture with data isolation between customers
- [ ] Session management and MFA support

**3. Scalability and flexibility**

*Concrete example:*
- **Feature flags**: Deploy a new dashboard to 10% of users, monitor performance, roll out to everyone.
- **Backward compatibility**: API v2 ships, but v1 continues working for 12 months with deprecation warnings.

*How to implement:*
- Use a feature flag service (LaunchDarkly, Split.io, or a simple in-house toggle system).
- Establish API versioning strategy from day one.
- Document deprecation policy — minimum 6 months notice is a good default.

**4. Documentation and guides**

*Why it matters:* Reduces support burden, accelerates adoption, makes your product sellable without your engineers in the room.

*Documentation hierarchy:*
1. **Quick start** (5 minutes): first API call working.
2. **Tutorials** (30 minutes each): complete common workflows.
3. **How-to guides**: solve specific problems.
4. **Reference**: complete API documentation, ideally auto-generated.
5. **Concepts**: deep dives into architecture.

*Recommended structure:*
```
docs/
├── getting-started/
│   └── quickstart.md           # 5-minute tutorial
├── tutorials/
│   ├── your-first-workflow.md
│   └── advanced-integration.md
├── how-to-guides/
│   ├── authentication.md
│   └── error-handling.md
├── reference/
│   └── api-reference.md        # auto-generated from OpenAPI spec
└── concepts/
    └── architecture-overview.md
```

#### Layers supporting development velocity

**1. Monitoring and observability**

*Concrete example of a monitoring stack:*
- **Metrics**: Response times, error rates, throughput (Datadog, Prometheus).
- **Logs**: Structured logs with correlation IDs (ELK, Splunk).
- **Traces**: Request flows across services (Jaeger, Honeycomb).
- **Alerts**: PagerDuty for critical issues, Slack for warnings.

*Essential metrics to track from day one:*
```yaml
- API response time (p50, p95, p99)
- Error rate (by endpoint)
- Active users
- Database query performance
- Memory/CPU usage
```

**2. Release and patching**

*Concrete release strategy:*
- **Weekly releases**: feature releases every Tuesday.
- **Hotfix releases**: as needed, any day.
- **Canary deployments**: 5% → 25% → 100% over 2 hours.
- **Rollback plan**: one-click rollback within 15 minutes.

More depth on releases, flags, and operational practice in [Engineering Operations]({{ '/delivery/eng-operations.html' | relative_url }}).

## The who, how, when framework

Engineering's job, once the *what* is agreed with Product Management, is to answer three questions: who builds it, how it's built, and when it ships.

- **PM is responsible for**: what gets built.
- **Engineering is responsible for**: who builds it, how it's built, and when it ships.

### Step 1: Define the WHO

Use your [strength map]({{ '/people/fundamentals.html' | relative_url }}#building-a-strength-map) to assign tasks effectively.

**Example: building a new analytics dashboard**

*Task breakdown:*
1. Backend API for analytics data (complex, 2 weeks)
2. Frontend dashboard UI (medium, 1 week)
3. Database schema changes (complex, 3 days)
4. Testing and QA (medium, 3 days)
5. Documentation (simple, 2 days)

*Assignment considerations:*

| Task | Assigned to | Rationale |
|------|------------|-----------|
| Backend API | Sarah (Senior) | Built similar APIs, can move fast |
| Frontend UI | Alex (Mid) + Jordan (Junior) | Alex leads, Jordan learns React |
| Database | Sarah (Senior) | Critical path, needs experience |
| Testing | Jordan (Junior) | Good learning opportunity, low risk |
| Documentation | Alex (Mid) | User-facing, Alex has good communication skills |

*Distribution checklist:*
- ✅ Load balanced (Sarah: 2.5 weeks, Alex: 1.5 weeks, Jordan: 1 week)
- ✅ Learning opportunities (Jordan paired with Alex)
- ✅ Visibility (Jordan owns testing presentation in demo)
- ✅ Set up for success (junior not alone on critical path)

### Step 2: Determine the HOW

Work closely with tech leads and architects. Your role: ensure the design is sound, achievable, not over-engineered, and not under-engineered. You are not the decider on implementation; you are the quality gate on the decision process.

**Example design review process:**

*Week 1: initial design — small group.*
- Attendees: tech lead, 2-3 engineers working on it, architect.
- Duration: 1-2 hours.
- Output: high-level design document.

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

*Week 1: broader team review — async.*
- Share design doc with full team.
- Collect feedback in comments.
- Identify dependencies and conflicts.

*Week 2: final design — small group.*
- Address feedback.
- Finalize the approach.

### Step 3: Communicate the WHEN

Only estimate after you have design feedback and understand dependencies. Estimating before design is a recipe for numbers everyone regrets.

{: .note }
> **Newtonian approximation for planning.** Don't try to produce a perfect timeline in one pass. Start with a coarse estimate, attach an explicit probability to it ("70% confident we hit 6 weeks, 90% confident on 8"), and refine over time as uncertainty collapses. A plan with attached confidence beats a plan with false precision — because it tells your stakeholders *what to worry about*, not just *when to expect it*.

{: .warning }
> **Parkinson's Law** states: *"Work expands to fill the time available for its completion."* A colleague of mine once described projects as **gas particles** — given a fixed timeframe, a project will expand to occupy all of it. The job is to deliberately *compress* the project until the non-essential parts get squeezed out. Buffer is necessary; loose scope is not. The 30% buffer below is for unknowns, not for scope creep you could have cut.

**Estimation example (analytics dashboard):**

| Task | Estimate | Dependencies | Risk Level |
|------|----------|--------------|------------|
| Database schema | 3 days | None | Medium (migration risk) |
| Backend API | 10 days | Database complete | Low |
| Frontend UI | 5 days | API complete | Low |
| Testing | 3 days | UI complete | Medium (unknowns) |
| Documentation | 2 days | Feature complete | Low |

**Total: 23 working days ≈ 4.5 weeks**

Add buffer: **Ship target — 6 weeks** (30% buffer for unknowns).

**Communicating the timeline:**
- To PM: "We're targeting 6 weeks, assuming no major scope changes."
- To the team: "We have 6 weeks. Let's aim for 5 and use week 6 for polish."
- To stakeholders: weekly progress updates. Never disappear between commitment and delivery.

## The roadmap

The roadmap should be the **source of truth** for the entire company.

**Principle**: if it's not on the roadmap, it's not happening. If it needs to happen, it goes on the roadmap — or something else comes off.

### Roadmap levels

Three levels, each with a different audience and a different cadence:

1. **Company roadmap** (6-12 months): themes and major initiatives. Audience: board, leadership, everyone who wants the big picture.
2. **Product roadmap** (3-6 months): specific features. Audience: customers (in sanitized form), sales, the rest of the company.
3. **Engineering roadmap** (1-3 months): technical work. Audience: engineering, sometimes Product. Where platform work and tech debt show up explicitly.

**Example quarterly roadmap:**
```markdown
# Q1 2026 Engineering Roadmap

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
- [ ] Upgrade core runtime
- [ ] Remove deprecated endpoints
- [ ] Consolidate logging libraries
```

## The PM / Engineering / Sales triangle

At most startups, three functions share responsibility for what gets built and when it ships. Clarity here is the difference between a healthy roadmap and three months of Slack arguments.

```
        PM
       /  \
      /    \
     /      \
 Sales ---- Engineering
```

- **PM decides what to build.** They gather input from Sales, Engineering, and customers, and prioritize based on business value.
- **Engineering decides who builds it, how, and when.** Estimates complexity, allocates resources, commits to a timeline.
- **Sales is PM's customer.** Customer requests flow through PM, who validates and prioritizes. Engineering delivers against that.

### Working with Product Management

A healthy weekly PM-Engineering sync has a predictable shape:

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

### Handling direct feature requests from Sales

**The bad pattern:**
```
Sales → Direct to Engineering → Chaos
```

**The good pattern:**
```
Sales → PM (validates + prioritizes) → Roadmap → Engineering
```

**How Engineering should handle a direct ask from Sales:**

> *Salesperson*: "Customer needs X by next week!"
> 
> *You*: "Thanks for flagging. Can you create a ticket and work with PM to prioritize? We can provide a technical assessment of effort once PM has validated this against the roadmap."

The answer is not "no." The answer is "yes, through the right channel." If you break that discipline for one friendly sales rep, you'll break it for all of them within a month, and your roadmap will be whatever whoever-yelled-loudest wanted.

## Organization and product strategy

Team structure shapes product architecture. This is covered in depth in [Team Structure and Organization Design]({{ '/people/team-structure.html' | relative_url }}) — but the key observation applies here too:

- **Monolithic product → single team.** Everyone knows the whole codebase. Coordination is easy. Scales to ~10 engineers.
- **Microservices → multiple teams.** Teams own specific services. Clear boundaries and contracts. Required for ~20+ engineers.

If you're deciding on product architecture at the same time as team structure — which you often are during a restructure — treat it as one decision, not two. You'll end up living with whichever one you actually follow through on.
