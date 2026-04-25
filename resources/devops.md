---
title: CI/CD and DevOps
layout: chapter
nav_order: 2
parent: IV. Resources & Infrastructure
---

# CI/CD and DevOps Practices

## What the EM actually owns here

This chapter is not a DevOps handbook. It's the subset of CI/CD and DevOps practice an engineering manager has to be conversant in to make good staffing, prioritization, and investment decisions.

Three things matter most to get right as a manager:

1. **You are responsible for the investment level.** How much engineering time goes into pipeline, tooling, and operational maturity is a choice you make — not a choice that happens to you. Under-invest and you'll lose velocity to flakiness and slow feedback loops; over-invest and you'll build infrastructure for a scale you're not yet at.
2. **You are responsible for the team structure that handles this work.** Dedicated platform team? Embedded in product teams? Rotating ownership? Each of these answers produces different outcomes — see [Team Structure]({{ '/people/team-structure.html' | relative_url }}).
3. **You are responsible for setting the bar on operational maturity.** The DORA metrics below are the right place to start. If your team doesn't know its deployment frequency or change failure rate, that's a you-problem, not a DevOps-team problem.

The rest of this chapter is what you need to know to do those three things well.

## DevOps philosophy

Five principles that actually hold up in practice:

* **Collaboration over silos.** Break down the barrier between development and operations — even if "operations" is a single engineer wearing six hats.
* **Automation first.** Anything a human does twice, automate the third time.
* **Measurement and feedback.** You cannot improve what you do not measure.
* **Learning from failure.** Incidents are curriculum, not punishment.
* **Infrastructure as code.** Manage infrastructure through code and version control, not click-ops.

The typical transformation arc:
1. **Assessment.** Evaluate current processes, tools, and culture.
2. **Vision and strategy.** Define the target state, aligned with business goals.
3. **Pilot teams.** Start with small, motivated teams.
4. **Skills development.** Invest in training.
5. **Toolchain selection.** Choose integrated tools.
6. **Process redesign.** Optimize for continuous delivery.
7. **Scaling.** Expand successful practices across the organization.
8. **Continuous improvement.** Regularly review and refine.

In practice, you will not do this as cleanly as the list suggests. You'll pick up one piece, retrofit another, and cargo-cult the middle. That's fine — the goal is directional motion, not clean execution.

## CI/CD pipeline architecture

### Pipeline components

* **Code repository.** Source code management (Git, GitHub, GitLab).
* **Build system.** Compile code and create artifacts (GitHub Actions, CircleCI, Jenkins, etc.).
* **Automated testing.** Unit, integration, end-to-end.
* **Artifact repository.** Store build outputs (JFrog Artifactory, Nexus, or the cloud-native equivalent).
* **Deployment automation.** Infrastructure provisioning and application deployment.
* **Monitoring and observability.** Runtime monitoring and feedback.

### Patterns worth adopting

* **Trunk-based development.** Short-lived feature branches merged frequently to main. The modern default.
* **Environment promotion.** Code progresses through dev, test, staging, production.
* **Feature flagging.** Decouple deployment from release. See [Engineering Operations]({{ '/delivery/eng-operations.html' | relative_url }}#feature-flags).
* **Parallel testing.** Run test suites concurrently to reduce feedback time.
* **Self-service deployment.** Engineers can deploy through automated processes without needing a dedicated ops person in the loop.

### Pipeline speed and efficiency

- Optimize build and test time — under 10 minutes for basic validation is a reasonable target.
- Parallel execution where possible.
- Cache dependencies and build artifacts.
- Incremental builds.
- Monitor pipeline metrics and fix bottlenecks as they emerge.

A 20-minute CI feedback loop feels acceptable when it's new. Six months later, that 20 minutes is costing you a dozen engineer-hours a day in context-switching. It's worth fixing early.

### Quality gates

- Static analysis and linting.
- Unit test coverage requirements (70-80% is a reasonable floor).
- Security vulnerability scanning.
- Dependency analysis and updates.
- Performance testing thresholds.
- Code review requirements.

### Testing strategy in the pipeline

- **Unit tests.** Fast, isolated, every commit.
- **Integration tests.** Verify component interactions.
- **End-to-end tests.** Full system validation — run sparingly, they're expensive.
- **Load / performance tests.** For critical paths.
- **Security tests.** Regular scanning.

See [Engineering Operations > Quality and Testing]({{ '/delivery/eng-operations.html' | relative_url }}#quality-and-testing) for the broader testing strategy.

### Environment management

- Reproducible dev environments.
- Staging that actually mirrors production. "Mostly like production" is not mirroring production — it's a production-incident generator.
- Feature branch environments where useful.
- Clean environment creation and teardown.
- Infrastructure as Code for environment definitions.

### Deployment safety

- Feature flags for controlled rollouts.
- Automated rollback capabilities.
- Blue-green or canary deployments.
- Production verification tests.
- Automated smoke tests post-deployment.

### Observability

- Pipeline health metrics.
- Build success/failure rates.
- Test coverage trends.
- Deployment frequency.
- Mean time to recovery.

### Developer experience

- Clear error messages and failure notifications.
- Self-service tools for common tasks.
- Local environment parity with CI.
- Easy access to logs and debugging tools.
- Documentation for pipeline maintenance.

Developer experience is one of the highest-leverage investments you can make, and also one of the most invisible to people who don't do the work. A CI pipeline that fails with an opaque error message costs you three hours the first time it happens and fifteen minutes every time after. Multiplied across a team, across a year, this is real money.

### Security and compliance in the pipeline

- Secrets management.
- Access control and audit logs.
- Compliance checks integration.
- Artifact signing and verification.
- Container image scanning.

See [Security and Compliance]({{ '/resources/security.html' | relative_url }}) for broader treatment.

## A realistic implementation guide

### Setting up continuous integration

1. **Version control practices.**
   - Enforce branch protection rules.
   - Require peer reviews for all changes.
   - Keep branches short-lived — 1-2 days maximum.
   - Commit message standards that are enforced, not aspired to.

2. **Automated build configuration.**
   - Build tools appropriate to the tech stack.
   - Incremental builds where possible.
   - Dependency caching.
   - Artifact versioning strategy.

3. **Test automation strategy.**
   - Implement the test pyramid (unit → integration → E2E).
   - Run fast tests first.
   - Target 80%+ unit test coverage for business logic.
   - Test data management strategy.

### Setting up continuous delivery

1. **Infrastructure automation.**
   - Infrastructure as Code (Terraform, CloudFormation, Pulumi, etc.).
   - Reusable modules for common patterns.
   - Version infrastructure code alongside application code.
   - Infrastructure testing.

2. **Deployment strategies.**
   - Blue-green deployments for zero-downtime updates.
   - Canary releases for controlled rollout.
   - Rollback mechanisms for quick recovery.
   - Immutable infrastructure.

3. **Security integration.**
   - Scan dependencies for vulnerabilities.
   - SAST / DAST security testing.
   - Secrets management.
   - Automated compliance validation.

## Metrics and KPIs

### The DORA metrics — and why they still matter

The four DORA metrics are still the right starting point in 2026.

* **Deployment frequency.** How often you deploy to production.
* **Lead time for changes.** Time from code commit to production.
* **Mean time to recovery (MTTR).** How long to recover from failures.
* **Change failure rate.** Percentage of deployments causing production incidents.

You do not need dashboards for these on day one. You need rough numbers in your head. A team that ships weekly with a 10% incident rate looks very different from a team that ships daily with a 1% incident rate — both technically "shipping regularly," but only one is actually a high-performing team.

### Quality metrics

* **Code coverage** — percentage of code exercised by automated tests.
* **Defect escape rate** — bugs found in production vs. earlier stages.
* **Technical debt ratio** — measure of maintainability issues.
* **Security vulnerability count** — open security issues.

### Performance metrics

* **Build duration.**
* **Test execution time.**
* **Deployment duration.**
* **Environment provisioning time.**

## Common challenges and what works

### Challenges

- **Cultural resistance.** Teams reluctant to adopt new practices.
- **Legacy systems.** Older systems that are difficult to automate.
- **Skills gaps.** Lack of expertise in automation technologies.
- **Tool proliferation.** Too many disconnected tools.
- **Security and compliance tension.** Balancing speed with security requirements.

### What tends to work

- **Executive sponsorship.** Secure leadership buy-in for transformation work explicitly. Without it, you'll be continually justifying engineering-only time.
- **Incremental modernization.** Gradually refactor legacy systems. Rewrites fail; strangler-fig migrations mostly succeed.
- **Training.** Invest in upskilling.
- **Integrated toolchains.** Complementary tools that work together beat best-of-breed silos.
- **Security as code.** Integrate security validation into pipelines so it doesn't become a separate gate.

## Tools (current landscape)

Specific tool recommendations age poorly. These are the categories and representative options as of 2026 — treat them as a starting point, not a commitment.

### CI/CD platforms
- **GitHub Actions.** Tight GitHub integration, easy setup, cloud-hosted. The default for most startups.
- **CircleCI.** Fast setup, good parallelization, cloud-hosted.
- **GitLab CI.** End-to-end DevOps platform if you're on GitLab.
- **Jenkins.** Highly customizable, extensive plugins, self-hosted. Less common at new startups.
- **Azure DevOps.** Comprehensive Microsoft platform, strong enterprise integration.

### Infrastructure as code
- **Terraform.** Multi-cloud, declarative, large community.
- **OpenTofu.** Open-source fork of Terraform, worth evaluating for licensing-sensitive use.
- **AWS CloudFormation.** Native AWS, comprehensive AWS support.
- **Pulumi.** Infrastructure as actual code (Python, TypeScript, etc.).
- **Ansible.** Configuration management, simple YAML syntax.

### Containerization and orchestration
- **Docker.** Industry standard.
- **Kubernetes.** Container orchestration at scale — often overkill for small teams.
- **Docker Compose.** Simple multi-container applications.
- **Managed container services** (ECS, EKS, GKE, Cloud Run, Fargate) for teams that don't want to run Kubernetes themselves.

### Monitoring and observability
- **Prometheus / Grafana.** Open-source monitoring stack.
- **Datadog.** Comprehensive SaaS monitoring and APM. Expensive, powerful.
- **New Relic.** Application performance monitoring.
- **Honeycomb.** Observability-focused, event-based.
- **ELK Stack.** Logging and search.

## Implementation roadmap

A realistic timeline for a 0-50 engineer startup building this up from scratch.

**Phase 1 — Foundation (months 1-3)**
- Version control best practices.
- Basic CI for automated builds and tests.
- Infrastructure as code for one environment.
- Start measuring the DORA metrics — even manually.

**Phase 2 — Optimization (months 3-6)**
- Extend CI/CD to all environments.
- Automated security scanning.
- Deployment automation.
- Self-service capabilities for developers.

**Phase 3 — Advanced practices (months 6-12)**
- Feature flagging.
- Chaos engineering practices.
- Advanced monitoring and alerting.
- Automated compliance validation.

{: .note }
> Successful DevOps transformation requires both technical changes and cultural shifts. Focus on small wins that demonstrate value, and prioritize initiatives that directly address your organization's specific pain points — not generic "best practices" from a blog post.
