---
title: Security and Compliance
layout: chapter
nav_order: 2
parent: VI. Infrastructure
---

{: .no_toc }
# Security and Compliance

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

## What the EM needs to know

This chapter is not a security handbook. It's the subset an engineering manager at a 0-50 person startup has to understand to make good decisions about when, how much, and in what order to invest in security and compliance.

The practical question this chapter answers: *what are the minimum things you need to do, and when does each of them become urgent?*

The short version:

- **Always:** strong authentication, access controls, secrets management, basic logging, encryption in transit and at rest. These are free table stakes. Shipping without them is malpractice.
- **When you start selling to enterprise customers:** SOC2 Type I, then Type II. Start 6-9 months before the first enterprise sales conversation — see [Product and Roadmap Management]({{ '/delivery/product-roadmap.html' | relative_url }}#the-outer-layers).
- **When you handle regulated data:** HIPAA (health), PCI DSS (payments), GDPR (EU personal data). These are not optional — they are legal requirements that carry material fines for non-compliance.
- **Continuous:** security hygiene across the team. Training, reviews, dependency scanning, access reviews.

Procrastination on security is often the right call in a startup — you cannot do everything at once — but *procrastination on having the capability to execute security fast* is almost never the right call. "We'll do it later" is only a safe position if "later" is a well-defined moment and someone owns the path to being ready.

## Security

### Security principles for engineering leaders

Five principles that hold up.

* **Security is a shared responsibility.** Foster a culture where security is part of everyone's job, not the security team's problem to chase. Most early-stage startups don't have a dedicated security team anyway — you are the security team.
* **Security by design.** Incorporate security requirements from the beginning of projects, not as an afterthought. Retrofitting security to a system that wasn't designed for it is 10x harder than doing it from the start.
* **Defense in depth.** Multiple layers of security controls. Any single control will eventually fail.
* **Principle of least privilege.** Grant minimal access rights. This applies to humans, services, and — increasingly — to AI agents with write access to your systems.
* **Continuous security testing.** Integrate security testing throughout the development lifecycle rather than treating it as a pre-launch gate.

### Security implementation areas

**Application security.**
- Regular code reviews with a security lens.
- SAST (static analysis) in CI/CD pipelines.
- DAST (dynamic analysis) for runtime vulnerability detection.
- SCA (software composition analysis) for dependency vulnerabilities.
- Secure coding guidelines and training.

**Infrastructure security.**
- Network segmentation and firewall configuration.
- Intrusion detection and prevention.
- Server hardening.
- Cloud security posture management.
- Container image scanning and runtime security.

**Data security.**
- Data classification — know what data you have and what it's worth to an attacker.
- Encryption at rest and in transit.
- Access controls and logging.
- Database activity monitoring.
- Data loss prevention.

**Identity and access management.**
- Strong authentication (MFA minimum).
- Role-based access control.
- Just-in-time access provisioning.
- Regular access reviews — people's roles change, access rarely gets cleaned up unless you force it.
- API token lifecycle management.

**Security monitoring.**
- Centralized log management.
- Security information and event management (SIEM) — though this is usually overkill for early-stage startups.
- Automated alerting for suspicious activities.
- Real-time threat intelligence integration.
- Incident response playbooks. Written down, rehearsed at least once.

### Security governance

* **Security champions program.** Embed security-focused engineers within development teams. A realistic target at early stage: one security-minded engineer per team, not a separate security org.
* **Regular security training.** Quarterly awareness training for all team members. Tempting to skip; expensive to have skipped when something goes wrong.
* **Security metrics.** Track and report KPIs — vulnerability remediation time, security debt.
* **Bug bounty program.** Consider establishing one once your product is mature enough that external researchers have something to look at.
* **Penetration testing.** Regular third-party security assessments. Expected by most enterprise customers during procurement.

### Shift left, shift right

The shorthand every security vendor uses, but it's genuinely useful:

- **Shift left when you can automate it.** Vulnerability scanning, static analysis, secret detection in commits — push these as early in the pipeline as possible.
- **Shift right when necessary.** Production monitoring, intrusion detection, runtime security. Some things can only be detected in production, and pretending they can all be prevented earlier is how you end up not detecting them at all.
- **Monitor continuously and implement intelligent alerting.** Alert fatigue is its own security problem.

## Compliance

### The major frameworks

**SOC2 — System and Organization Controls.** The most common compliance ask at B2B SaaS startups.
- **Type I** — point-in-time assessment of controls.
- **Type II** — assessment of controls over a period, usually 6-12 months.
- Five trust service criteria: security, availability, processing integrity, confidentiality, privacy.
- Preparation typically takes 3-6 months for the first audit.
- Annual reassessment required.
- **Practical note:** most startups use Vanta, Drata, or a similar platform to automate evidence collection. Expect 3-6 months of engineering time across the team the first time through.

**HIPAA — Health Insurance Portability and Accountability Act.** Applies if you handle protected health information (PHI).
- Key requirements: Privacy Rule, Security Rule, Breach Notification Rule.
- Technical safeguards: access controls, audit controls, integrity controls, transmission security.
- Annual risk assessments and employee training required.
- Business Associate Agreements (BAAs) needed for vendors — this becomes a real procurement constraint.

**GDPR — General Data Protection Regulation.** Applies to personal data of EU residents — even if your company is in the US.
- Key principles: lawfulness, fairness, transparency, purpose limitation, data minimization.
- Rights for data subjects: access, rectification, erasure, portability.
- Data Protection Impact Assessments (DPIAs) for high-risk processing.
- 72-hour breach notification requirement.

**PCI DSS — Payment Card Industry Data Security Standard.** Applies if you handle cardholder data directly.
- 12 requirements covering network security, data protection, vulnerability management.
- Different compliance levels based on transaction volume.
- Regular vulnerability scanning and penetration testing.
- Annual assessment or self-assessment questionnaire.
- **Practical note:** most startups outsource this by using Stripe or a similar PCI-compliant payment processor and never touching card data themselves. This is almost always the right call.

### When each framework starts to matter

- **SOC2 Type I** — when the first enterprise prospect asks for it. Usually around your first ~$1M of enterprise ARR. Start 3-6 months before you expect that ask.
- **SOC2 Type II** — 6-12 months after Type I, once you have evidence history to show.
- **HIPAA** — the moment you sign your first healthcare customer. Non-negotiable; don't sign until ready.
- **GDPR** — the moment you have any EU users. This is "we have a web app" level of triggering.
- **PCI DSS** — the moment you handle card data. Avoid this by using a PCI-compliant processor.

### Compliance implementation strategy

1. **Assess applicability.** Determine which regulations apply.
2. **Gap analysis.** Compare current practices against requirements.
3. **Remediation planning.** Prioritize gaps based on risk and effort.
4. **Policy development.** Create comprehensive policies and procedures.
5. **Technical implementation.** Deploy required security controls.
6. **Training.** Educate staff on compliance requirements.
7. **Ongoing monitoring.** Establish continuous compliance tracking.
8. **Documentation.** Maintain evidence of compliance activities.

Steps 1-3 take less time than you think. Steps 4-8 take more time than you think — especially step 8, which never stops.

### Tooling

* **Policy management and evidence automation:** Vanta, Drata, TrustCloud, Secureframe, Tugboat Logic, Ostendio. These platforms are now standard for SOC2 at startups — evaluate at least two before picking.
* **Risk assessment:** SimpleRisk, RiskLens, Resolver.
* **Security monitoring:** Datadog, Splunk, Elastic Security.
* **Vendor management:** OneTrust VRM, Whistic, SecurityScorecard — matters once you have a non-trivial vendor footprint.
* **Training and awareness:** KnowBe4, Proofpoint Security Awareness, SANS.

{: .note }
> Compliance is a tax on doing business, not a security posture. A compliant system is not a secure system — it's a documented system. Don't confuse the two. Build the security; document it to get the certification; keep going.
