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

At a small scale (under ~10 engineers), you don't split anything — everyone does everything. Once you cross that threshold, you start seeing these kinds of work and usually these four kinds of teams emerge:

- **Product teams** — build customer-facing features. Own the roadmap items a PM cares about.
- **Platform teams** — build the internal systems that product teams rely on: build, CI/CD, auth, data infrastructure, shared libraries. Their customers are other engineers.
- **Release teams** — package the final product, validate it, and produce all the supporting assets (e.g. docs). Often folded into the platform or product team, but in larger orgs it's a separate team.
- **Support/ops teams** — handle the operational load: incident response, customer escalations, on-call, SRE work. Sometimes merged into platform, sometimes distinct.

The mistake is usually either (a) spinning up a platform team too early, before there's enough shared pain to justify dedicated staffing, or (b) waiting too long and ending up with ten product teams all rebuilding the same authentication layer badly.

A rough heuristic: spin up a platform team when you have at least three product teams whose work would be unblocked by shared infrastructure, and at least two full-time engineers' worth of sustained platform demand.

There's a nascent belief in Silicon Valley that all functions can be delivered by a single team, with heavy AI support vibe-coding its way through the work. I disagree. For some products, the product team may be able to vibe-code the product itself; for others, the platform and support functions might collapse into a single team. But even when merged, and even when staffed with fewer people, the three roles remain important units of accountability. They may end up as roles rather than distinct teams — but still worth understanding and managing appropriately.

## Common organization models

The literature on team structure is large, but most patterns reduce to a small number of canonical shapes. The most influential modern framing is **Team Topologies** by Matthew Skelton and Manuel Pais — it gave the industry a shared vocabulary for what good engineering orgs were already doing implicitly. The structures below are organized roughly from oldest and most familiar to most recent and most opinionated. None of them are right or wrong in the abstract; they are right or wrong for *your* stage, scale, and culture.

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

This shape promotes deep specialization and gives each discipline a clean career ladder, with consistent standards inside every domain. The cost is structural: every product feature requires coordination across multiple teams, handoffs and dependencies are inevitable, end-to-end ownership is hard to assign, and delivery cycles slow. Best fit: early-stage organizations with very specialized technical needs, or regulated environments that require strict separation of concerns.

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

End-to-end ownership reduces handoffs, alignment with customer value is direct, and teams have the autonomy to make most decisions without coordinating across the org — which is why this is the default shape most startups land on between 10 and 50 engineers. The tradeoffs are real: technical standards drift across teams, specialists can feel isolated from peers in their discipline, the same problem gets solved three different ways, and architecture goes sideways without deliberate cross-team alignment.

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

Done well, a matrix balances technical excellence with product focus and gives specialists a real community across product teams. Done badly — and it is often done badly — the dual reporting becomes confusion, engineers face competing priorities every day, decision-making slows, and performance management is structurally harder because it's never quite clear who is accountable for what. Generally not worth the overhead below ~50 engineers.

### 4. Team Topologies

Skelton and Pais's framework is the modern lingua franca for thinking about team structure. It defines four team types and three interaction modes between them, organized around a single primary objective: minimize the cognitive load on the teams that deliver value to customers.

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

**Stream-aligned teams** are the primary unit. Each is aligned to a single, valuable stream of work — a product line, a customer segment, a user journey — and owns it end-to-end. Most teams in the org should be stream-aligned, and their goal is fast flow.

**Platform teams** build internal products that reduce cognitive load on stream-aligned teams. CI/CD, auth, data infrastructure, observability — anything where centralizing the work lets the rest of the org move faster. Their customers are other engineers, and they should be run with the same product discipline as a customer-facing team.

**Enabling teams** are temporary. They embed in a stream-aligned team to help it acquire a new capability — a new tech stack, a new compliance posture, a new testing practice — and then leave. The risk is becoming permanent; if an enabling team isn't dissolving, you probably needed a platform team instead.

**Complicated-subsystem teams** own components that genuinely require deep specialization — ML model training pipelines, real-time graphics engines, payment-rail integrations. They exist when the cost of every team learning the subsystem exceeds the cost of one team owning it.

The three interaction modes — **collaboration**, **X-as-a-Service**, and **facilitating** — matter as much as the team types. Most dysfunction in a TT-shaped org doesn't come from picking the wrong types; it comes from teams interacting in the wrong mode for the situation. Two stream-aligned teams stuck in permanent "collaboration" should usually be merged. A platform team that never moves to X-as-a-Service mode hasn't yet productized its work.

Best for: organizations focused on flow and reducing cognitive load. Works particularly well in the 30-100 engineer range, where the cracks in pure cross-functional start to show.

### 5. Spotify model (Squads, Tribes, Chapters, Guilds)

A matrix-like structure that became briefly canonical in the mid-2010s and is now mostly a cautionary tale.

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

**Squads** are small cross-functional teams focused on specific product areas. **Tribes** are collections of squads working in related areas. **Chapters** are functional communities that span squads — all the backend engineers across squads form one chapter, with a chapter lead. **Guilds** are voluntary communities of interest around specific topics: security, observability, accessibility.

The model combines team autonomy with functional excellence and provides built-in mechanisms for knowledge sharing across squads. The honest assessment: it requires a strong engineering culture and accepts high communication overhead to work, and it is widely misimplemented. "We're doing Spotify" usually means "we read the blog post, renamed our teams squads, and changed nothing else." Famously, even Spotify has walked away from significant parts of this model.

### 6. Amazon two-pizza teams (and the API mandate)

Amazon's structure is built around a constraint: every team should be small enough to be fed by two pizzas — roughly 6-10 people. Each team owns a service end-to-end (design, code, deploy, on-call) and is accountable for the metrics that service moves.

{% mermaid %}
graph TD;
    LEAD[Engineering Leadership];

    LEAD --> T1[Team 1<br>Service: Search<br>~6-10 people];
    LEAD --> T2[Team 2<br>Service: Cart<br>~6-10 people];
    LEAD --> T3[Team 3<br>Service: Recommendations<br>~6-10 people];
    LEAD --> T4[Team 4<br>Service: Auth<br>~6-10 people];
    LEAD --> T5[Team 5<br>Service: Payments<br>~6-10 people];

    T1 -->|API| T2;
    T2 -->|API| T4;
    T2 -->|API| T5;
    T3 -->|API| T4;
    T1 -->|API| T3;

    classDef leadership fill:#fff3cd,stroke:#f0ad4e;
    classDef team fill:#d1ecf1,stroke:#0275d8;
    class LEAD leadership;
    class T1,T2,T3,T4,T5 team;
{% endmermaid %}

The 2002 "API Mandate" attributed to Bezos pushed this further: every team must expose its functionality through an API; teams may not communicate via shared databases, file systems, or back channels; and the same APIs used internally must be designed as if they would one day be public. The rule forced strict service boundaries, which in turn enabled both AWS as an external product and Amazon's ability to scale to thousands of services without coordination death.

Best for: organizations operating at scale where service ownership and API discipline are foundational. Adopting the form (small teams) without the substance (genuine service boundaries and API discipline) gets you the small-team coordination overhead without the autonomy benefits.

### 7. Netflix — freedom and responsibility

Netflix's structure is often discussed as a culture more than a structure, but the structure is real and unusual. It assumes very high talent density (the famous "we hire only senior people who would be missed if they left" rule) and uses that density to operate with much less process than peer companies.

{% mermaid %}
graph TD;
    LEAD[Senior Leadership<br>Sets context: priorities, strategy, principles];

    LEAD -.->|Context, not control| T1[Team 1<br>High autonomy];
    LEAD -.->|Context, not control| T2[Team 2<br>High autonomy];
    LEAD -.->|Context, not control| T3[Team 3<br>High autonomy];
    LEAD -.->|Context, not control| T4[Team 4<br>High autonomy];

    T1 -.->|Loosely coupled| T2;
    T2 -.->|Loosely coupled| T3;
    T3 -.->|Loosely coupled| T4;

    classDef leadership fill:#fff3cd,stroke:#f0ad4e;
    classDef team fill:#d4edda,stroke:#5cb85c;
    class LEAD leadership;
    class T1,T2,T3,T4 team;
{% endmermaid %}

Concretely: small teams, high autonomy, and a "highly aligned, loosely coupled" coordination model — leadership sets clear context (priorities, strategy, principles) and trusts teams to make decisions inside that context without escalating. There is little formal process, no traditional PIPs (the "keeper test" is the substitute), and individual contributors often have scope that would require manager titles elsewhere.

Best for: companies that can credibly maintain very high talent density. The model breaks badly when applied to teams with mixed seniority — the "freedom" half stops being safe to extend without the talent density to justify the "responsibility" half. Most companies that try to copy Netflix copy the freedom and skip the talent density, which is why the imitations rarely work.

### 8. Valve Corporation — flat / cabals

Valve has a famously flat structure. Its new-employee handbook (which leaked publicly in 2012 and remains illuminating) describes an organization with no managers, no formal reporting lines, and desks on wheels — engineers are expected to physically roll their desk to whichever project they think is highest-leverage.

{% mermaid %}
graph TD;
    POOL[Pool of employees<br>No managers, no fixed reporting];

    POOL --> CABAL_A[Cabal A<br>Project X];
    POOL --> CABAL_B[Cabal B<br>Project Y];
    POOL --> CABAL_C[Cabal C<br>Project Z];

    CABAL_A -.->|Disbands when shipped| POOL;
    CABAL_B -.->|Disbands when shipped| POOL;
    CABAL_C -.->|Disbands when shipped| POOL;

    classDef pool fill:#e2e3e5,stroke:#6c757d;
    classDef cabal fill:#d1ecf1,stroke:#0275d8;
    class POOL pool;
    class CABAL_A,CABAL_B,CABAL_C cabal;
{% endmermaid %}

Projects are organized into ad hoc **cabals** — temporary cross-functional groups that form around a piece of work and dissolve when it ships. Leadership inside a cabal emerges informally rather than being assigned. Performance is evaluated through peer ranking, which has its own well-known issues.

The Valve model is fascinating and almost entirely non-portable. It works because Valve is privately held, has a specific creative-product domain (games), hires very selectively, and has a strong cultural backbone reinforced over decades. Multiple companies that tried to copy it (or its close cousin Holacracy, see below) struggled. Useful to study as a counter-example to over-structured orgs, but not a template you can lift.

### 9. Block — from hierarchy to intelligence

Block has been more public than most about a sharp departure from conventional org structure. In a 2025 post, [*From Hierarchy to Intelligence*](https://block.xyz/inside/from-hierarchy-to-intelligence), the company describes an explicit attempt to organize itself as a "company-wide intelligence" — replacing the information-routing function of middle management with AI-mediated coordination.

The argument runs roughly: organizations have been bound for two thousand years by the same constraint — a manager can effectively oversee 3-8 people, so any growth past that point forces layers, and layers slow information flow. Block's bet is that AI can now perform the parts of management that were really about routing context, freeing the org to operate without permanent middle management.

{% mermaid %}
graph TD;
    subgraph "System (what coordinates)";
        CAPS[Atomic capabilities<br>Payments, Lending, Banking,<br>BNPL, Card issuance, Payroll];
        WORLD[Company World Model<br>Continuous picture<br>of what's being built];
        CUSTOMER[Customer World Model<br>Per-customer signals<br>from transaction data];
        ENGINE[Intelligence Layer<br>Composes capabilities<br>into proactive solutions];
        INTERFACES[Interfaces<br>Square, Cash App, Afterpay,<br>TIDAL, Bitkey, Proto];
    end;

    CAPS --> ENGINE;
    WORLD <--> ENGINE;
    CUSTOMER <--> ENGINE;
    ENGINE --> INTERFACES;

    subgraph "People at the edge";
        IC[ICs<br>Deep in one system layer];
        DRI[DRIs<br>Own a cross-cutting outcome<br>for a fixed period];
        PC[Player-coaches<br>Build + develop ICs<br>No status meetings];
    end;

    IC -.->|reads context from| WORLD;
    DRI -.->|pulls resources via| ENGINE;
    PC -.->|mentors| IC;

    classDef system fill:#d1ecf1,stroke:#0275d8;
    classDef people fill:#d4edda,stroke:#5cb85c;
    class CAPS,WORLD,CUSTOMER,ENGINE,INTERFACES system;
    class IC,DRI,PC people;
{% endmermaid %}

The system side is built around five components. **Atomic capabilities** are headless financial primitives — payments, lending, card issuance, banking, buy-now-pay-later, payroll — with no UI of their own. A **company world model** maintains a continuous, AI-readable picture of what's being built, what's blocked, and where resources are allocated; a parallel **customer world model** does the same per-customer (or per-merchant), built from transaction data. An **intelligence layer** composes capabilities into proactive solutions for specific moments — a restaurant's cash flow tightening before a seasonal dip, a Cash App user's signals suggesting a move to a new city. The customer-facing **interfaces** — Square, Cash App, Afterpay, TIDAL, Bitkey, Proto — are explicitly positioned as the surface, not the value.

The people side compresses to three roles. **Individual contributors** specialize deep in one system layer; the world model gives them the context a manager used to relay, so they can decide without waiting. **Directly Responsible Individuals (DRIs)** are assigned to a specific outcome — the post's example is "merchant churn in a specific segment for 90 days" — with full authority to pull resources across teams for the duration of the assignment. **Player-coaches** combine building with developing people; they don't run status meetings or alignment sessions, because the world model is supposed to handle alignment.

Whether this works is the question. Block itself says the company is in the early stages of the transition, that "parts of it will likely break before they work," and that two prerequisites are non-trivial: a remote-first, machine-readable work environment, and rich customer signal (financial transactions are unusually rich). The post is also light on the conventional org-chart questions — reporting lines, team sizes, how DRIs and player-coaches relate, how the intelligence-layer team is itself organized — which suggests the model is, at least for now, more philosophy than blueprint.

Worth tracking even if you can't apply it. The interesting claim is structural: that a particular *kind* of management work (context routing, alignment maintenance, status reporting) was always system work in disguise, and that AI is finally good enough to do it.

### 10. Async-first / handbook-driven (GitLab)

Not strictly a team shape, but a coordination model worth naming. GitLab is the canonical reference: a fully-remote, fully-async-first company where almost everything is written down in a public-facing handbook ([handbook.gitlab.com](https://handbook.gitlab.com)), most communication is async by default, and meetings are deliberately rare.

The handbook is the single source of truth — for processes, decisions, values, even compensation formulas. Onboarding becomes self-serve. Coordination across time zones stops being a tax. Decisions leave a durable artifact future hires can find.

The cost is real: writing things down takes more time than saying them, and the discipline to actually maintain the handbook is significant. But for distributed teams, the alternative — coordination via Slack and meetings — scales worse and worse the bigger the org gets.

Best for: distributed organizations that want to operate at scale without coordination overhead taking over the work.

### What didn't survive

A few patterns that had their moment and largely didn't last, worth knowing if only because someone will eventually pitch them to you.

**Holacracy.** A formal "self-management" framework with circles instead of teams and elaborate constitutional rules. Adopted by Zappos in 2014 amid much fanfare and largely walked back. The pattern repeated elsewhere: companies adopt the form, lose the implicit structure that the old org chart provided, and end up reinventing managers under new names.

**"No managers" experiments.** Several startups have tried eliminating engineering managers entirely. Some of the work distributes well to senior engineers. The rest — career development, performance feedback, conflict resolution, advocacy upward — doesn't, and tends to either fall on whichever senior engineer is most empathetic (a brutal tax on them) or simply not happen. Most companies that tried this between 2015 and 2020 have quietly added managers back. There is a comeback in 2026, since there is believe that AI can take over most of the managerial tasks, and hence flatten the organizations drammatically. There is some validity to the point, but hte jury is still out.

The pattern in both cases: management is real work. Removing the formal role does not remove the work; it just makes the work invisible and unevenly distributed.

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
