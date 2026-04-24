---
title: Engineering Operations
layout: chapter
nav_order: 3
parent: III. Delivery
---

{: .no_toc }
# Engineering Operations

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

## Overview

This chapter covers the operational practices that turn "the team shipped the feature" into "the feature actually works in production over time": release strategy and feature flags, quality and testing, on-call management, and how to choose an agile methodology that fits your team instead of the other way around.

{: .note }
> *"Amateurs talk strategy and tactics. Professionals talk operations."*
> 
> — often attributed to General Omar Bradley
> 
> The quote's attribution is contested; the wisdom is not. The difference between a team that ships a great feature once and a team that ships great features reliably is almost entirely operational. It is the least glamorous part of the job and the most consequential.

## Releases and deployment

### Release strategy

**Example release cadence:**
- **Production releases**: weekly (Tuesdays at 10 AM).
- **Hotfixes**: as needed, any time.
- **Major releases**: quarterly (coordinated with marketing).

The specifics matter less than the predictability. Engineers need to know when their code reaches production so they can plan around it. Customers — internal and external — need to know when they can expect changes.

Every product has a **maximum sustainable speed of delivery to customers**. Ship faster than that and the bug rate in the field climbs until you're spending more time firefighting than building. Ship slower than that and the product is held back from customers who need it, competitors overtake you, and the team loses the feedback loop that keeps them sharp. Finding your team's sustainable speed — and operating at it, not above or below — is one of the quieter operational judgments a manager makes.

### Feature flags

**Use cases:**
1. **Product features.** Enable premium features for paid users.
2. **Gradual rollouts.** Ship to 10% → 50% → 100%.
3. **Kill switches.** Turn off broken features without redeploying.
4. **A/B testing.** Test variations with real users.

**Example feature flag:**
```javascript
if (featureFlags.isEnabled('new-analytics-dashboard', user.id)) {
  return <NewDashboard />;
} else {
  return <OldDashboard />;
}
```

**Flag lifecycle:**
1. **Create** the flag, default OFF.
2. **Test** with internal users.
3. **Roll out** 10% → 50% → 100%.
4. **Monitor** performance and errors.
5. **Remove** the flag within 2-4 weeks of full rollout.

{: .warning }
> **Flag debt.** Old flags are technical debt. Set a policy: remove flags within one month of full rollout. Otherwise you will accumulate thousands of dead code paths in three years and never know which ones are safe to delete.

### Release checklist

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

## Quality and testing

### Testing strategy

The test pyramid is still the right default shape, even when most of your code is written with AI assistance (and especially then — see [Managing in the AI Era]({{ '/delivery/ai-era.html' | relative_url }})).

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

**Unit tests (60% of test effort):**
- Test individual functions or classes.
- Fast (milliseconds).
- Run on every commit.
- Target: 80%+ coverage on business logic — don't chase 100%, the last 20% is usually testing trivia.

**Integration tests (30% of test effort):**
- Test components working together.
- Test database queries.
- Test API endpoints.
- Run before deployment.

**UI / E2E tests (10% of test effort):**
- Test critical user flows.
- Slow (minutes).
- Run before production deployment.
- Keep minimal — they're the most brittle tests you own.

### Example testing guidelines

**Required before merging a PR:**
```markdown
- [ ] Unit tests for new functions
- [ ] Integration test for API endpoint
- [ ] Manual testing of UI changes
- [ ] All tests passing in CI
```

**Critical paths that require E2E tests:**
- User registration and login.
- Payment processing.
- Core product workflows.

### QA best practices

**QA's role:** help *prevent* bugs, not just find them.

**How to work with QA:**
1. **Include QA early.** In design reviews, not just at the end of the sprint.
2. **Clear acceptance criteria.** QA knows what "done" looks like.
3. **Staging environment.** QA tests in a production-like environment.
4. **Bug triage.** Prioritize bugs together (P0/P1/P2).

**QA feedback loop:**
```
Developer → Code Review → QA Testing → Production
                ↑              ↓
                └── Bug Found ──┘
                  (fix and repeat)
```

## On-call management

On-call is the single operational practice that most shapes the team's quality of life. Get it right and the team has a sustainable rotation; get it wrong and you lose people to burnout a year from now.

### Setting up the rotation

**Example rotation (team of 6):**
- **Schedule**: 1-week rotations.
- **Rotation**: primary + secondary.
- **Coverage**: 24/7 (weekday + weekend).

**Rotation calendar:**
```
Week  | Primary  | Secondary
------|----------|----------
Jan 8 | Sarah    | Alex
Jan 15| Alex     | Jordan
Jan 22| Jordan   | Sarah
Jan 29| Sarah    | Alex
```

### On-call responsibilities

**Primary on-call:**
- Respond to pages within 15 minutes.
- Investigate and triage issues.
- Fix if possible, escalate if needed.
- Write the incident summary.

**Secondary on-call:**
- Backup if primary doesn't respond in 30 minutes.
- Help with complex issues.
- Review incident summaries.

### On-call compensation

A few models that work:

1. **Time off.** One day off for each week on-call.
2. **Bonus.** $500-1000/week on-call stipend.
3. **Hybrid.** Half-day off + $250/week.

The amount matters less than having *something*. "On-call is part of the job" is true and insufficient — it's also part of the job that happens at 2 AM on a Saturday, and people remember that.

### Reducing on-call burden

Track interrupt patterns:
```markdown
Week of Jan 15 - Interrupts: 8

Breakdown:
- Database connection timeouts: 3 (Action: add monitoring)
- Cache invalidation issues: 2 (Action: improve docs)
- User support questions: 2 (Action: FAQ)
- Legit production issue: 1
```

**Continuous improvement:**
- Fix recurring issues.
- Improve monitoring and alerts (fewer false positives).
- Better documentation.
- Automate common fixes.

**Avoid single points of failure:**
- Document tribal knowledge.
- Pair junior with senior engineers.
- Cross-train on different systems.
- Rotate on-call responsibilities widely.

The on-call rotation is also one of the best places to build judgment in mid-level engineers. They get exposure to the whole system under stress. Treat it as a growth experience, not just a cost.

## Agile methodologies

### Choosing the right methodology

**Scrum** — best for: teams with predictable cadence, well-defined features.

*Key elements:*
- 2-week sprints.
- Daily standups.
- Sprint planning, review, retrospective.
- Product backlog.

*When it works:*
- Building features with clear requirements.
- Stakeholders want predictable delivery.
- Team is comfortable with the ceremony overhead.

**Kanban** — best for: support teams, continuous flow, unpredictable work.

*Key elements:*
- Visualize the workflow.
- Limit work in progress (WIP).
- Continuous delivery — no sprints.
- Pull system.

*When it works:*
- Bug fixes and support work.
- Priorities change frequently.
- Continuous deployment.

**Hybrid** — what most teams actually do.

*Example:*
- 2-week sprints (Scrum-like structure).
- Kanban board for visualization.
- WIP limits to prevent context switching.
- Flexible on ceremonies — skip what doesn't add value.

### Making agile work

**Don't cargo-cult agile.**
- ❌ Bad: "We must do daily standups because Scrum says so."
- ✅ Good: "Daily check-ins help us catch blockers early. Let's try it and drop it if it stops adding value."

**Adapt to your team:**
- Small team (<5)? Skip formal sprint planning.
- Distributed team? Async standups work fine.
- Firefighting a lot? Kanban is probably better than Scrum.
- AI-assisted team shipping in smaller increments? Continuous flow beats fixed sprints — see [Managing in the AI Era]({{ '/delivery/ai-era.html' | relative_url }}).

**Measure what matters:**
- Cycle time (idea → production).
- Deployment frequency.
- Change failure rate.
- Team satisfaction.

The DORA metrics are the canonical version of the first three — see [CI/CD & DevOps]({{ '/infrastructure/devops.html' | relative_url }}#metrics-and-kpis) for detail. Team satisfaction is the one everyone forgets to measure, and it's the leading indicator for the others.
