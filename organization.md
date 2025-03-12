---
title: Organization
layout: home
nav_order: 7
---

{: .no_toc }
# Organization

How you structure your teams has a big impact on the product both in term of architecture as well as product development velocity.
The Conway's Law , which states that "organizations design systems that mirror their own communication structure" [^1], sadly has been proven to be true in my experience. Hence deliberately creating team to better support the product and development is key to the team successes, and indirectly as a team is more successful it will also make the team more happy and productive.


{: .no_toc }
## Table of Contents

1. TOC
{:toc}

## Eng Team Structure

- Product vs Platform vs Support team

{% mermaid %}
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
{% endmermaid %}


## PM and Sales Releationship

The engineering org is ultimately delivering to the PM org, that is the PM is technically your customer. A good way to think about the relationships is:

- PM decides what needs to be build (gathering inputs from sales and engineering): i.e. the roadmap  
- Eng decide who and when: i.e. when the roadmap is delivered based on complexity and resources available  
- Sales is the PM’s customer: Ultimately if the roadmap must cater to the sales team needs.

Ultimately **if it is not on the roadmap it is not going to be built.** So have a good centralized way to view and track the roadmap is vital.

## Building Strong Relationships

- Schedule regular sync-ups between engineering, product management, and sales teams.
- Encourage engineers to join sales calls occasionally to better understand customer needs.
- Implement a system for engineering to provide time estimates and feasibility assessments for feature requests.

## Engineering Organization Structure

As organizations grow, deliberately choosing the right team structure becomes critical for enabling effective product delivery and maintaining engineering velocity. Each structure has specific advantages and disadvantages that make it suitable for different contexts.

### Common Team Organization Models

#### 1. Functional/Technology Teams

Teams organized around technical specialties or functional areas (frontend, backend, data, infrastructure, QA, etc.).

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

**Pros:**
* Promotes technical excellence and specialization
* Clear career paths within technical domains
* Easier knowledge sharing between specialists
* Consistent standards and practices within domains

**Cons:**
* Creates handoffs and dependencies between teams
* End-to-end ownership is challenging
* Can lead to silos and communication barriers
* Often results in slower delivery cycles
* Product features need coordination across multiple teams

**Best for:** Early-stage organizations with specialized technical needs or regulated environments requiring strict separation of concerns.

#### 2. Feature/Product Teams (Cross-functional)

Teams organized around product features or customer experiences with all necessary skills embedded.

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

**Pros:**
* End-to-end ownership reduces handoffs
* Faster delivery and iteration cycles
* Better alignment with customer/business value
* Teams have autonomy to make decisions
* Promotes shared understanding of product goals

**Cons:**
* Technical standards may vary across teams
* Specialists might feel isolated from peers
* Can lead to duplicated work across teams
* Knowledge sharing requires deliberate effort
* May result in inconsistent architecture

**Best for:** Organizations focused on rapid product development and customer-facing features.

#### 3. Matrix Organization

Engineers belong to both functional teams (for standards/expertise) and product teams (for delivery).

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

**Pros:**
* Balances technical excellence with product focus
* Provides community for specialists
* Enables consistent practices across product teams
* Supports knowledge sharing and career development

**Cons:**
* Dual reporting creates complexity and confusion
* Engineers may face competing priorities
* Requires more coordination and overhead
* Decision-making can be slower
* Performance management is more complex

**Best for:** Larger organizations needing both functional excellence and product focus.

#### 4. Team Topologies Model

A modern approach to team organization based on cognitive load and team interaction patterns.

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

1. **Stream-aligned teams**: Focused on a specific product or service stream, delivering value directly to customers.
   * **Pros:** End-to-end ownership, customer focus, autonomy
   * **Cons:** May need significant platform support, risk of divergent practices

2. **Enabling teams**: Temporary teams that help stream-aligned teams overcome specific challenges.
   * **Pros:** Accelerates learning, shares best practices
   * **Cons:** Can create dependencies, risk of becoming permanent

3. **Complicated subsystem teams**: Handle complex components requiring specialized expertise.
   * **Pros:** Manages complexity, allows specialization
   * **Cons:** Can become a bottleneck, risk of creating critical dependencies

4. **Platform teams**: Build internal products that reduce cognitive load for stream-aligned teams.
   * **Pros:** Improves productivity, reduces duplication, enforces standards
   * **Cons:** May not be responsive to stream team needs, risk of overbuilding

**Best for:** Organizations focused on delivery flow and optimizing cognitive load.

#### 5. Spotify Model (Squads, Tribes, Chapters, Guilds)

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

* **Squads:** Cross-functional teams focused on specific product areas
* **Tribes:** Collections of squads working in related areas
* **Chapters:** Functional communities spanning across squads
* **Guilds:** Communities of interest around specific topics

**Pros:**
* Combines team autonomy with functional excellence
* Promotes learning and knowledge sharing
* Scalable as organization grows
* Balances standardization with innovation

**Cons:**
* Complex to implement correctly
* Often misinterpreted or partially implemented
* Requires strong engineering culture
* Depends on high trust and communication

**Best for:** Larger organizations with strong engineering culture seeking balance between autonomy and alignment.

#### 6. DevOps/Full-stack Teams

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

**Pros:**
* Full ownership reduces handoffs and dependencies
* Faster feedback loops and incident resolution
* Aligns incentives (build it, run it)
* Reduces "throw it over the wall" mentality

**Cons:**
* Requires broad skill sets from team members
* On-call responsibilities can lead to burnout
* Difficult to maintain deep expertise in all areas
* Security and compliance may be challenging

**Best for:** Digital-native companies with emphasis on operational excellence and rapid iteration.

### Organizational Evolution

Most organizations evolve through different structures as they grow:

1. **Startup (1-10 engineers):** Usually generalists with fluid responsibilities
2. **Early Growth (10-30 engineers):** Emerging specialization, often organized by features
3. **Scale-up (30-100 engineers):** More formal structure, often transitioning to some form of matrix
4. **Enterprise (100+ engineers):** Complex structures with multiple organizing principles

### Considerations When Choosing a Structure

* **Company stage and growth trajectory**
* **Product complexity and technical requirements**
* **Team size, locations, and time zones**
* **Delivery cadence requirements**
* **Regulatory or compliance constraints**
* **Existing culture and team preferences**
* **Customer interaction model**

### Transitioning Between Structures

When evolving your organization structure:

1. **Communicate clear rationale** for the change
2. **Involve teams** in planning the transition
3. **Move incrementally** rather than all at once
4. **Expect temporary productivity dips**
5. **Be prepared to adjust** based on feedback
6. **Focus on outcomes** rather than strict adherence to a model

Remember that Conway's Law works both ways - deliberately structure your teams to reflect the architecture and product boundaries you want to create.

## Leveling and Promotions

Ok, this is a can of worms, and a very hot topics. Here is my personal view and experience.
First this is a related to performance review but is putting visible (internal or external) structures around it.

I firmly believe that until the company passes the existential threats (i.e. a runway that is not measured in months) leveling will be just a distraction and a cause of unhappiness among the team. So wait until the pressure to have a leveling system in place as much as you can and focus the team on delivering the product/milestones.

So when you should introduce leveling? Here my personal view:
You introduce leveling for the following reasons:
- You need a formal way for junior engineer to grow inside the company,
- You need a way to unify the performance expectations across the org, and ultimately
- You have a benchmark for external hiring people - so they
What its is not:
- A way to compensate people! yes levels are a floor to the comp but they should be losely coupled.


## Communication and Transparency

- Implement a regular cadence of team-wide and company-wide communications.
- Use tools like Slack, email newsletters, and all-hands meetings to keep everyone informed.
- Encourage open dialogue and create channels for anonymous feedback.
- Share successes, failures, and lessons learned to foster a culture of continuous improvement.

## Continuous Learning and Improvement

- Implement a system for collecting and acting on feedback from team members.
- Regularly review and update processes based on team input and changing needs.
- Encourage experimentation and innovation, allowing for controlled failures as learning opportunities.
- Share knowledge through internal tech talks, blog posts, or documentation.

## Work-Life Balance and Well-being

- Promote a healthy work-life balance by setting a good example as a manager.
- Implement policies that support flexible working hours and locations.
- Encourage the use of vacation time and respect off-hours.
- Provide resources for mental health and stress management.

## Diversity, Equity, and Inclusion

- Develop and implement strategies to increase diversity in hiring and promotion.
- Create an inclusive environment where all team members feel valued and heard.
- Provide training on unconscious bias and inclusive leadership.
- Regularly assess and address any pay equity issues.

## Tech Lead-Manager Relationship

Do not prioritize tech items before people management. Rely on the tech lead to own all the tech soundness, they are responsible for the technical execution\!

* tech lead owns **how things are developed**  
* manager owns the **who develops things**  
* both shared is the **when the things are shipped**  
* Tools:  
  * daily sync up (sync or async) and daily linear board review\!