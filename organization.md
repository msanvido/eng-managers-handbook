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

Expand on the Team Topologies concept:

1. **Stream-aligned teams**: Focused on a single product or service stream.
2. **Enabling teams**: Support stream-aligned teams in adopting new technologies or practices.
3. **Complicated subsystem teams**: Handle complex components that require specialized knowledge.
4. **Platform teams**: Provide internal services to reduce cognitive load for stream-aligned teams.

Consider how these team structures can be applied to your organization as it grows.

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