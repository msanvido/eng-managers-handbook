---
title: Team Structure & Organization Design
layout: chapter
nav_order: 4
parent: II. People & Teams
---

{: .no_toc }
# Team Structure and Organization Design

{: .no_toc }
## Table of Contents

1. TOC
{:toc}

## Why this matters

As an organization grows, the structure of your teams stops being a background detail and becomes the single most consequential decision you make. Each structure has specific tradeoffs — advantages that matter in one context become liabilities in another. The wrong structure slows delivery, frustrates engineers, and eventually shapes a product you didn't mean to build.

Conway's Law — "organizations design systems that mirror their own communication structure" — is not an abstract observation. It is the single rule that predicts what your codebase will look like in two years. Team structure and product architecture are the same decision, expressed twice.

## The core engineering split: product, platform, support

Before getting to the named organizational models, the first decision most startups face is how to split product-facing work from the infrastructure and internal-tooling work that makes product-facing work possible.

At a small scale (under ~10 engineers), you don't split anything — everyone does everything. Once you cross that threshold, you start seeing three kinds of work and three kinds of teams emerge:

- **Product teams** — build customer-facing features. Own the roadmap items a PM cares about.
- **Platform teams** — build the internal systems that product teams rely on: CI/CD, auth, data infrastructure, shared libraries. Their customers are other engineers.
- **Support/ops teams** — handle the operational load: incident response, customer escalations, on-call, SRE work. Sometimes merged into platform, sometimes distinct.

The mistake is usually either (a) spinning up a platform team too early, before there's enough shared pain to justify dedicated staffing, or (b) waiting too long and ending up with ten product teams all rebuilding the same authentication layer badly.

A rough heuristic: spin up a platform team when you have at least three product teams whose work would be unblocked by shared infrastructure, and at least two full-time engineers' worth of sustained platform demand.

## Common organization models

### 1. Functional / technology teams

Teams organized around technical specialties or functional areas — frontend, backend, data, infrastructure, QA.

{% mermaid %}
graph TD;
    CTO[CTO/VP Engineering];
    FE[Frontend Lead];
    BE[Backend Lead];
    QA[QA Lead];
    DATA[Data Lead];
    INFRA[Infrastructure Lead];

    CTO --> FE;
    CTO --> BE;
    CTO --> QA;
    CTO --> DATA;
    CTO --> INFRA;

    FE --> FE1[FE Engineer 1];
    FE --> FE2[FE Engineer 2];
    FE --> FE3[FE Engineer 3];

    BE --> BE1[BE Engineer 1];
    BE --> BE2[BE Engineer 2];
    BE --> BE3[BE Engineer 3];

    QA --> QA1[QA Engineer 1];
    QA --> QA2[QA Engineer 2];

    DATA --> DATA1[Data Engineer 1];
    DATA --> DATA2[Data Engineer 2];

    INFRA --> INFRA1[Infra Engineer 1];
    INFRA --> INFRA2[Infra Engineer 2];

    subgraph Product Feature A;
        FE1 -.-> BE1 -.-> QA1 -.-> DATA1 -.-> INFRA1;
    end;

    subgraph Product Feature B;
        FE2 -.-> BE2 -.-> QA2 -.-> DATA2 -.-> INFRA2;
    end;
{% endmermaid %}

**Pros**
* Promotes technical excellence and specialization.
* Clear career paths within technical domains.
* Easier knowledge sharing between specialists.
* Consistent standards and practices within domains.

**Cons**
* Creates handoffs and dependencies between teams.
* End-to-end ownership is difficult.
* Silos and communication barriers form naturally.
* Slower delivery cycles.
* Every product feature requires coordination across multiple teams.

**Best for:** Early-stage organizations with specialized technical needs, or regulated environments that require strict separation of concerns.

### 2. Feature / product teams (cross-functional)

Teams organized around product features or customer experiences, with all necessary skills embedded in the team.

{% mermaid %}
graph TD;
    HEAD[Head of Engineering];

    HEAD --> TEAM_A[Team A Lead<br>User Experience];
    HEAD --> TEAM_B[Team B Lead<br>Payments];
    HEAD --> TEAM_C[Team C Lead<br>Analytics];

    TEAM_A --> A_FE[Frontend Eng];
    TEAM_A --> A_BE[Backend Eng];
    TEAM_A --> A_QA[QA Eng];
    TEAM_A --> A_DEVOPS[DevOps Eng];
    TEAM_A --> A_PM[Product Manager];
    TEAM_A --> A_DESIGN[Designer];

    TEAM_B --> B_FE[Frontend Eng];
    TEAM_B --> B_BE[Backend Eng];
    TEAM_B --> B_QA[QA Eng];
    TEAM_B --> B_DEVOPS[DevOps Eng];
    TEAM_B --> B_PM[Product Manager];
    TEAM_B --> B_DESIGN[Designer];

    TEAM_C --> C_FE[Frontend Eng];
    TEAM_C --> C_BE[Backend Eng];
    TEAM_C --> C_QA[QA Eng];
    TEAM_C --> C_DEVOPS[DevOps Eng];
    TEAM_C --> C_PM[Product Manager];
    TEAM_C --> C_DATA[Data Scientist];

    subgraph Team A: User Experience;
        A_FE --- A_BE --- A_QA --- A_DEVOPS --- A_PM --- A_DESIGN;
    end;

    subgraph Team B: Payments;
        B_FE --- B_BE --- B_QA --- B_DEVOPS --- B_PM --- B_DESIGN;
    end;

    subgraph Team C: Analytics;
        C_FE --- C_BE --- C_QA --- C_DEVOPS --- C_PM --- C_DATA;
    end;
{% endmermaid %}

**Pros**
* End-to-end ownership reduces handoffs.
* Faster delivery and iteration cycles.
* Better alignment with customer and business value.
* Teams have autonomy to make decisions.
* Shared understanding of product goals across disciplines.

**Cons**
* Technical standards may vary across teams.
* Specialists may feel isolated from peers who share their discipline.
* Duplicated work across teams is common.
* Knowledge sharing requires deliberate effort.
* Architecture can drift without cross-team alignment.

**Best for:** Organizations focused on rapid product development and customer-facing features. This is the default shape most startups land on between 10 and 50 engineers.

### 3. Matrix organization

Engineers belong to both functional teams (for standards and expertise) and product teams (for delivery).

{% mermaid %}
graph TD;
    CTO[CTO];
    VP_PRODUCT[VP of Product];

    CTO --> VP_TECH_FE[VP Frontend];
    CTO --> VP_TECH_BE[VP Backend];
    CTO --> VP_TECH_DATA[VP Data];
    CTO --> VP_TECH_INFRA[VP Infrastructure];

    VP_PRODUCT --> PROD_A[Product A<br>Director];
    VP_PRODUCT --> PROD_B[Product B<br>Director];
    VP_PRODUCT --> PROD_C[Product C<br>Director];

    VP_TECH_FE --> FE1[Frontend Eng 1];
    VP_TECH_FE --> FE2[Frontend Eng 2];
    VP_TECH_FE --> FE3[Frontend Eng 3];
    VP_TECH_FE --> FE4[Frontend Eng 4];

    VP_TECH_BE --> BE1[Backend Eng 1];
    VP_TECH_BE --> BE2[Backend Eng 2];
    VP_TECH_BE --> BE3[Backend Eng 3];
    VP_TECH_BE --> BE4[Backend Eng 4];

    VP_TECH_DATA --> DATA1[Data Eng 1];
    VP_TECH_DATA --> DATA2[Data Eng 2];

    VP_TECH_INFRA --> INFRA1[Infra Eng 1];
    VP_TECH_INFRA --> INFRA2[Infra Eng 2];

    %% Product A team
    PROD_A -.-> FE1;
    PROD_A -.-> BE1;
    PROD_A -.-> DATA1;
    PROD_A -.-> INFRA1;

    %% Product B team
    PROD_B -.-> FE2;
    PROD_B -.-> BE2;
    PROD_B -.-> DATA2;

    %% Product C team
    PROD_C -.-> FE3;
    PROD_C -.-> FE4;
    PROD_C -.-> BE3;
    PROD_C -.-> BE4;
    PROD_C -.-> INFRA2;

    classDef functional fill:#d9f2d9,stroke:#78c2ad;
    classDef product fill:#d1ecf1,stroke:#5fa8d3;

    class CTO,VP_TECH_FE,VP_TECH_BE,VP_TECH_DATA,VP_TECH_INFRA,FE1,FE2,FE3,FE4,BE1,BE2,BE3,BE4,DATA1,DATA2,INFRA1,INFRA2 functional;
    class VP_PRODUCT,PROD_A,PROD_B,PROD_C product;
{% endmermaid %}

**Pros**
* Balances technical excellence with product focus.
* Provides a community for specialists.
* Consistent practices across product teams.
* Supports knowledge sharing and career development.

**Cons**
* Dual reporting creates complexity and confusion.
* Engineers face competing priorities.
* More coordination overhead.
* Decision-making slows.
* Performance management is structurally harder.

**Best for:** Larger organizations needing both functional excellence and product focus. Generally not worth the overhead below ~50 engineers.

### 4. Team Topologies model

A modern approach based on cognitive load and team interaction patterns.

{% mermaid %}
graph TD;
    CTO[CTO];

    CTO --> STREAM1[Stream-aligned<br>Team 1];
    CTO --> STREAM2[Stream-aligned<br>Team 2];
    CTO --> STREAM3[Stream-aligned<br>Team 3];
    CTO --> PLATFORM[Platform<br>Team];
    CTO --> COMPLICATED[Complicated<br>Subsystem Team];
    CTO --> ENABLING[Enabling<br>Team];

    %% Interaction modes
    PLATFORM --"X as a Service"--> STREAM1;
    PLATFORM --"X as a Service"--> STREAM2;
    PLATFORM --"X as a Service"--> STREAM3;

    COMPLICATED --"Collaboration"--> STREAM1;
    COMPLICATED --"Collaboration"--> STREAM2;

    ENABLING --"Facilitating"--> STREAM1;
    ENABLING --"Facilitating"--> STREAM2;
    ENABLING --"Facilitating"--> STREAM3;
    ENABLING --"Facilitating"--> PLATFORM;

    %% Customer flow
    CUSTOMER1[Customer A] --> STREAM1;
    CUSTOMER2[Customer B] --> STREAM2;
    CUSTOMER3[Customer C] --> STREAM3;

    subgraph Stream-aligned Teams;
        STREAM1;
        STREAM2;
        STREAM3;
    end;

    subgraph Supporting Teams;
        PLATFORM;
        COMPLICATED;
        ENABLING;
    end;

    classDef stream fill:#d1ecf1,stroke:#0275d8;
    classDef platform fill:#f8d7da,stroke:#d9534f;
    classDef complicated fill:#fff3cd,stroke:#f0ad4e;
    classDef enabling fill:#d4edda,stroke:#5cb85c;
    classDef customer fill:#e2e3e5,stroke:#6c757d;

    class STREAM1,STREAM2,STREAM3 stream;
    class PLATFORM platform;
    class COMPLICATED complicated;
    class ENABLING enabling;
    class CUSTOMER1,CUSTOMER2,CUSTOMER3 customer;
{% endmermaid %}

1. **Stream-aligned teams**: focused on a specific product or service stream, delivering value directly to customers.
   * *Pros*: End-to-end ownership, customer focus, autonomy.
   * *Cons*: May need significant platform support; risk of divergent practices.

2. **Enabling teams**: temporary teams that help stream-aligned teams overcome specific challenges.
   * *Pros*: Accelerates learning, shares best practices.
   * *Cons*: Can create dependencies; risk of becoming permanent.

3. **Complicated subsystem teams**: handle complex components that require specialized expertise.
   * *Pros*: Manages complexity, allows specialization.
   * *Cons*: Can become a bottleneck; risk of creating critical dependencies.

4. **Platform teams**: build internal products that reduce cognitive load for stream-aligned teams.
   * *Pros*: Improves productivity, reduces duplication, enforces standards.
   * *Cons*: May not be responsive to stream-team needs; risk of overbuilding.

**Best for:** Organizations focused on delivery flow and optimizing cognitive load. Works well in the 30-100 engineer range.

### 5. Spotify model (Squads, Tribes, Chapters, Guilds)

A matrix-like structure that balances autonomy with alignment.

{% mermaid %}
graph TD;
    CTO[CTO];

    CTO --> TRIBE1[Tribe 1<br>Leader];
    CTO --> TRIBE2[Tribe 2<br>Leader];

    %% Tribe 1 squads
    TRIBE1 --> SQUAD1A[Squad 1A];
    TRIBE1 --> SQUAD1B[Squad 1B];
    TRIBE1 --> SQUAD1C[Squad 1C];

    %% Tribe 2 squads
    TRIBE2 --> SQUAD2A[Squad 2A];
    TRIBE2 --> SQUAD2B[Squad 2B];
    TRIBE2 --> SQUAD2C[Squad 2C];

    %% Chapter connections
    FE_CHAPTER[Frontend<br>Chapter Lead] -.-> FE1[FE Dev 1A];
    FE_CHAPTER -.-> FE2[FE Dev 1B];
    FE_CHAPTER -.-> FE3[FE Dev 2A];
    FE_CHAPTER -.-> FE4[FE Dev 2C];

    BE_CHAPTER[Backend<br>Chapter Lead] -.-> BE1[BE Dev 1A];
    BE_CHAPTER -.-> BE2[BE Dev 1C];
    BE_CHAPTER -.-> BE3[BE Dev 2B];
    BE_CHAPTER -.-> BE4[BE Dev 2C];

    QA_CHAPTER[QA<br>Chapter Lead] -.-> QA1[QA Dev 1B];
    QA_CHAPTER -.-> QA2[QA Dev 1C];
    QA_CHAPTER -.-> QA3[QA Dev 2A];
    QA_CHAPTER -.-> QA4[QA Dev 2B];

    %% Squad members
    SQUAD1A --> FE1;
    SQUAD1A --> BE1;
    SQUAD1B --> FE2;
    SQUAD1B --> QA1;
    SQUAD1C --> BE2;
    SQUAD1C --> QA2;

    SQUAD2A --> FE3;
    SQUAD2A --> QA3;
    SQUAD2B --> BE3;
    SQUAD2B --> QA4;
    SQUAD2C --> FE4;
    SQUAD2C --> BE4;

    %% Guild connections (dashed lines)
    GUILD1[Security<br>Guild] -.- FE1;
    GUILD1 -.- BE1;
    GUILD1 -.- BE3;
    GUILD1 -.- BE4;

    GUILD2[UX<br>Guild] -.- FE1;
    GUILD2 -.- FE2;
    GUILD2 -.- FE3;
    GUILD2 -.- FE4;

    subgraph Tribes;
        TRIBE1;
        TRIBE2;
    end;

    subgraph Chapters;
        FE_CHAPTER;
        BE_CHAPTER;
        QA_CHAPTER;
    end;

    subgraph Guilds;
        GUILD1;
        GUILD2;
    end;

    classDef tribe fill:#d1ecf1,stroke:#0275d8;
    classDef squad fill:#d4edda,stroke:#5cb85c;
    classDef chapter fill:#f8d7da,stroke:#d9534f;
    classDef guild fill:#fff3cd,stroke:#f0ad4e;
    classDef engineer fill:#e2e3e5,stroke:#6c757d;

    class TRIBE1,TRIBE2 tribe;
    class SQUAD1A,SQUAD1B,SQUAD1C,SQUAD2A,SQUAD2B,SQUAD2C squad;
    class FE_CHAPTER,BE_CHAPTER,QA_CHAPTER chapter;
    class GUILD1,GUILD2 guild;
    class FE1,FE2,FE3,FE4,BE1,BE2,BE3,BE4,QA1,QA2,QA3,QA4 engineer;
{% endmermaid %}

* **Squads:** cross-functional teams focused on specific product areas.
* **Tribes:** collections of squads working in related areas.
* **Chapters:** functional communities spanning across squads.
* **Guilds:** communities of interest around specific topics.

**Pros**
* Combines team autonomy with functional excellence.
* Promotes learning and knowledge sharing.
* Scalable as the organization grows.
* Balances standardization with innovation.

**Cons**
* Complex to implement correctly.
* Often misinterpreted or partially implemented ("we're doing Spotify" usually means "we read the blog post").
* Requires strong engineering culture to work.
* Depends on high trust and high communication overhead.

**Best for:** Larger organizations with strong engineering culture seeking a balance between autonomy and alignment. Famously, even Spotify has walked away from significant parts of this model.

### 6. DevOps / full-stack teams

Teams with complete ownership from development through operations.

{% mermaid %}
graph TD;
    CTO[CTO];

    CTO --> TEAM_A[Team A<br>Product X];
    CTO --> TEAM_B[Team B<br>Product Y];
    CTO --> TEAM_C[Team C<br>Product Z];

    %% Team A members
    TEAM_A --> A_LEAD[Team A Lead];
    A_LEAD --> A_DEV1[Full-stack Dev 1];
    A_LEAD --> A_DEV2[Full-stack Dev 2];
    A_LEAD --> A_DEV3[Full-stack Dev 3];
    A_LEAD --> A_SRE[SRE];
    A_LEAD --> A_SEC[Security Eng];

    %% Team B members
    TEAM_B --> B_LEAD[Team B Lead];
    B_LEAD --> B_DEV1[Full-stack Dev 1];
    B_LEAD --> B_DEV2[Full-stack Dev 2];
    B_LEAD --> B_DEV3[Full-stack Dev 3];
    B_LEAD --> B_SRE[SRE];
    B_LEAD --> B_SEC[Security Eng];

    %% Team C members
    TEAM_C --> C_LEAD[Team C Lead];
    C_LEAD --> C_DEV1[Full-stack Dev 1];
    C_LEAD --> C_DEV2[Full-stack Dev 2];
    C_LEAD --> C_DEV3[Full-stack Dev 3];
    C_LEAD --> C_SRE[SRE];
    C_LEAD --> C_SEC[Security Eng];

    %% Team A responsibilities
    A_LEAD --> A_DEVELOP[Development];
    A_LEAD --> A_TEST[Testing];
    A_LEAD --> A_DEPLOY[Deployment];
    A_LEAD --> A_MONITOR[Monitoring];
    A_LEAD --> A_ONCALL[On-call];

    %% Team B responsibilities
    B_LEAD --> B_DEVELOP[Development];
    B_LEAD --> B_TEST[Testing];
    B_LEAD --> B_DEPLOY[Deployment];
    B_LEAD --> B_MONITOR[Monitoring];
    B_LEAD --> B_ONCALL[On-call];

    %% Team C responsibilities
    C_LEAD --> C_DEVELOP[Development];
    C_LEAD --> C_TEST[Testing];
    C_LEAD --> C_DEPLOY[Deployment];
    C_LEAD --> C_MONITOR[Monitoring];
    C_LEAD --> C_ONCALL[On-call];

    subgraph "End-to-End Ownership";
        A_DEVELOP;
        A_TEST;
        A_DEPLOY;
        A_MONITOR;
        A_ONCALL;

        B_DEVELOP;
        B_TEST;
        B_DEPLOY;
        B_MONITOR;
        B_ONCALL;

        C_DEVELOP;
        C_TEST;
        C_DEPLOY;
        C_MONITOR;
        C_ONCALL;
    end;

    classDef team fill:#d1ecf1,stroke:#0275d8;
    classDef dev fill:#d4edda,stroke:#5cb85c;
    classDef ops fill:#f8d7da,stroke:#d9534f;
    classDef responsibility fill:#e2e3e5,stroke:#6c757d;

    class TEAM_A,TEAM_B,TEAM_C,A_LEAD,B_LEAD,C_LEAD team;
    class A_DEV1,A_DEV2,A_DEV3,B_DEV1,B_DEV2,B_DEV3,C_DEV1,C_DEV2,C_DEV3 dev;
    class A_SRE,A_SEC,B_SRE,B_SEC,C_SRE,C_SEC ops;
    class A_DEVELOP,A_TEST,A_DEPLOY,A_MONITOR,A_ONCALL,B_DEVELOP,B_TEST,B_DEPLOY,B_MONITOR,B_ONCALL,C_DEVELOP,C_TEST,C_DEPLOY,C_MONITOR,C_ONCALL responsibility;
{% endmermaid %}

**Pros**
* Full ownership reduces handoffs and dependencies.
* Faster feedback loops and incident resolution.
* Aligns incentives: build it, run it.
* Reduces "throw it over the wall" mentality.

**Cons**
* Requires broad skill sets from team members.
* On-call responsibilities can lead to burnout.
* Difficult to maintain deep expertise in all areas.
* Security and compliance harder without a dedicated function.

**Best for:** Digital-native companies emphasizing operational excellence and rapid iteration.

## Organizational evolution

Most organizations evolve through successive structures as they grow. Knowing which stage you're in — and which transition is coming — is half the work.

1. **Startup (1-10 engineers):** generalists with fluid responsibilities. No real structure. Everyone does everything.
2. **Early growth (10-30 engineers):** emerging specialization, usually organized by features or product areas. First platform work starts to appear, often done 20%-time by product engineers.
3. **Scale-up (30-100 engineers):** more formal structure, often transitioning to some form of matrix or Team Topologies. Platform teams become first-class. Managing managers starts to be a real topic.
4. **Enterprise (100+ engineers):** complex structures with multiple organizing principles. Beyond the scope of this book.

The transitions are where most of the pain lives. 10 → 30 and 30 → 100 are both structural phase changes — what worked at the lower end actively breaks at the upper end.

### Commandos, infantry, and police: matching people to the stage

A useful frame from Robert X. Cringely's *Accidental Empires* — who observed that Silicon Valley companies need three different kinds of people across the lifecycle, and that the same person is rarely great at more than one:

- **Commandos** thrive in the 1-10 engineer stage. They land in hostile territory with no map, improvise, ship something that shouldn't work, and move on. High tolerance for chaos, low tolerance for process. They're the first hires and the ones who make the company exist at all.
- **Infantry** is the 10-50 engineer wave. They take the beachhead the commandos established and turn it into held territory — productionize the prototypes, add the tests, build the scalable systems. They need some structure but still operate well under uncertainty.
- **Police** come in at scale (50+ engineers). They hold territory: enforce standards, maintain quality, manage compliance, run the established systems. They need and build the process that the earlier waves resisted.

The critical insight: **most people are only great at one of these stages.** A great commando is often a terrible police officer — they'll chafe at the process they're supposed to enforce and leave. A great police officer parachuted into a 5-person startup will insist on structure that strangles the team.

Your job at a transition is to recognize which stage the company is entering and match hiring — and sometimes the existing team — to it. Some of your early commandos will not want to be infantry, and will leave. That is fine, and expected. Honoring their commando contribution on the way out is part of the job.

### Alignment is the org's hidden variable

Every individual engineer, left alone, moves in a somewhat random direction — the aggregate looks like Brownian motion. The team's collective velocity is a function of how *aligned* those individual vectors are. Perfect alignment and the team moves as one; no alignment and the team appears busy but the center of mass barely shifts.

This is why an existential threat — a looming deadline, a real competitor, a funding cliff — often produces the highest-velocity periods in a company's history. The threat forces alignment the way a magnet aligns iron filings. The harder question is how to produce alignment *without* the threat: a clear and repeated vision, explicit priorities that everyone can recite, and a willingness to be boring about saying the same things in the same order for months on end.

The bigger the company, the harder the alignment problem — and the more of the manager's job it becomes.

## How to choose (and re-choose) a structure

Factors that should drive the decision:

* **Company stage and growth trajectory.** What you're optimizing for differs by stage.
* **Product complexity and technical architecture.** Your team structure should mirror the shape of what you're building — or the shape you want to build.
* **Team size, locations, time zones.** A matrix across three time zones is a different animal than the same matrix in one office.
* **Delivery cadence requirements.** Weekly product releases push you toward cross-functional teams. Annual regulated releases pull you the other way.
* **Regulatory or compliance constraints.** Some industries require functional separation.
* **Existing culture and team preferences.** You inherit the culture. Fighting it is usually a losing move.
* **Customer interaction model.** B2B enterprise with named accounts has different needs than self-serve B2C.

## Transitioning between structures

When you evolve your organization structure, expect discomfort. A few principles that help:

1. **Communicate the rationale clearly.** Engineers will accept a restructure if they understand why. They will resent it if it looks arbitrary.
2. **Involve the teams in planning the transition.** Not the decision of whether to restructure — that's yours — but the shape of the new teams and the sequencing.
3. **Move incrementally.** Change fewer teams per quarter than feels ambitious.
4. **Expect a temporary productivity dip.** Budget for it. Don't panic when it arrives.
5. **Be prepared to adjust.** Your initial mapping will be wrong in specific, predictable ways. Plan a six-month post-mortem.
6. **Focus on outcomes over strict adherence.** "We're doing Team Topologies" is less important than "the teams are delivering and the engineers are growing."

{: .note }
> Conway's Law works in both directions. You can use it offensively: deliberately structure your teams to reflect the architecture and product boundaries you want to create. A restructure is not just a people change — it is an architectural statement.
