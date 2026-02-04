# Business Requirements for Data Professionals

This document is a practical guide to gathering business requirements before building data solutions.
It focuses on understanding the problem before designing the solution.

The central principle: **"Why" before "How"**.

---

## Contents

- [1. What and Why](#1-what-and-why)
- [2. The 5 W's Framework](#2-the-5-ws-framework)
- [3. Requirements Hierarchy](#3-requirements-hierarchy)
- [4. Key Questions Checklist](#4-key-questions-checklist)
- [5. Common Mistakes](#5-common-mistakes)
- [6. The 5-Step Process](#6-the-5-step-process)
- [7. Data-Specific Considerations](#7-data-specific-considerations)
- [8. Templates](#8-templates)
- [9. Applied Examples](#9-applied-examples)

---

## 1. What and Why

### Definition

Business requirements capture the **"why"** and **"what"** before the **"how"**.

They answer:

- What problem are we solving?
- What does success look like?
- Who benefits?

### Data Context

Requirements become actionable when tied to decisions:

- What decisions will this data support?
- What questions need answering?
- What actions follow from the insights?

```text
┌─────────────────────┐
│ BUSINESS            │──▶ The "WHY" & "WHAT"
│ REQUIREMENTS        │    before the "HOW"
└─────────────────────┘
         │
         ▼
┌─────────────────────┐      ┌─────────────────┐
│ DATA CONTEXT        │──────▶│ BETTER OUTCOMES │
│                     │      └─────────────────┘
│ • What decisions?   │
│ • What questions?   │
│ • What actions?     │
└─────────────────────┘
```

### Why This Matters

Most data projects fail not from technical issues but from solving the wrong problem.

Symptoms of skipped requirements:

- "This isn't what we needed"
- Constant scope changes
- Dashboards nobody uses
- Team becomes a ticket farm

---

## 2. The 5 W's Framework

A data-focused framework for scoping any request.

```text
              ┌───────┐
              │  WHO  │
              └───┬───┘
                  │ Who needs this data/report/pipeline?
                  ▼
    ┌───────┐           ┌────────┐
    │  WHY  │◀─────────▶│  WHAT  │
    └───┬───┘   5 W's   └───┬────┘
        │    FRAMEWORK      │
        │                   │
        ▼                   ▼
  What business       What specific
  decision does       output do
  it drive?           they need?
        │                   │
        ▼                   ▼
    ┌───────┐           ┌────────┐
    │ WHERE │◀─────────▶│  WHEN  │
    └───────┘           └────────┘
        │                   │
        ▼                   ▼
  Source data live?    How fresh must
  Output delivered?    the data be?
```

### Questions by W

| W | Question | Example |
| ---- | ---- | ---- |
| WHO | Who needs this data? | Sales team, finance, operations |
| WHAT | What specific output? | Revenue report, inventory dashboard, customer list |
| WHY | What decision does it drive? | Pricing strategy, budget allocation, campaign targeting |
| WHERE | Where does data live? Where is output delivered? | CRM → Data warehouse → Dashboard |
| WHEN | How fresh? What deadline? | Real-time for ops, daily for finance, monthly for board |

---

## 3. Requirements Hierarchy

Requirements flow from strategic to technical. Start at the top.

```text
┌─────────────────────────────────────┐
│     BUSINESS REQUIREMENTS           │ ◀── START HERE
│          (Strategic)                │
│                                     │     Don't jump
│  What problem? What outcome?        │     straight to specs.
└──────────────────┬──────────────────┘
                   │
                   ▼
┌─────────────────────────────────────┐
│     STAKEHOLDER REQUIREMENTS        │
│           (Needs)                   │
│                                     │
│  Who uses it? How often?            │
└──────────────────┬──────────────────┘
                   │
                   ▼
┌─────────────────────────────────────┐
│     SOLUTION REQUIREMENTS           │
│   (Functional + Non-Functional)     │
│                                     │
│  What must it do? How must it       │
│  perform? Security? Compliance?     │
└──────────────────┬──────────────────┘
                   │
                   ▼
┌─────────────────────────────────────┐
│     TECHNICAL SPECIFICATIONS        │
│       (Data Team's Domain)          │
│                                     │
│  Schema, pipeline, dashboard spec   │
└─────────────────────────────────────┘
```

### Anti-Pattern

Jumping straight to technical specs without understanding the business context leads to:

- Building the wrong thing efficiently
- Rework when real requirements emerge
- Stakeholder frustration

---

## 4. Key Questions Checklist

Use this checklist in discovery conversations.

| Category | Questions |
| ---- | ---- |
| Business Context | What is the business goal? What problem are we solving? |
| Decision Making | What decisions will you make with this data? |
| Success Criteria | How will you know this project succeeded? |
| Current State | What do you do today? What is painful? |
| Users | Who will use the output? How often? |
| Data Specifics | What granularity? Time range? Filters needed? |
| Constraints | Budget? Timeline? Compliance needs (GDPR, audit)? |

### Domain-Specific Additions

Tailor questions to your industry:

| Domain | Additional Questions |
| ---- | ---- |
| Finance | Real-time or EOD? Reconciliation tolerance? Audit requirements? |
| E-commerce | Order status granularity? Returns handling? Multi-currency? |
| SaaS | Usage metrics definition? Billing cycle alignment? Churn calculation? |
| Healthcare | PHI handling? Consent tracking? Anonymisation requirements? |

---

## 5. Common Mistakes

| Mistake | Better Approach |
| ---- | ---- |
| Taking requests literally | Ask "why" 3-5 times |
| Jumping to solutions | Document the problem first |
| Skipping stakeholder identification | Map all affected parties |
| Assuming you understand | Paraphrase back to confirm |
| No written documentation | Always document (even informally) |
| Ignoring non-functional requirements | Ask about performance, security, data freshness |

### The Literal Request Trap

Request: "Add a column for profit margin to the sales report."

Literal response: Add the column.

Better response: "What decision will this support? Do you need it by product or region? Gross or net margin? Should it reconcile to the finance system?"

The second approach often reveals the actual need is different from the stated request.

---

## 6. The 5-Step Process

A lightweight process that works for any request size.

```text
┌──────────────┐
│ 1. DISCOVER  │──▶ Have a conversation, listen actively
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ 2. DOCUMENT  │──▶ Write it down simply (even bullets)
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ 3. VALIDATE  │──▶ "Did I understand correctly that...?"
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ 4. PRIORITISE│──▶ What's must-have vs nice-to-have?
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ 5. AGREE     │──▶ Get sign-off (email confirmation works)
└──────────────┘
```

### Time Investment

| Request Size | Discovery Time | Documentation |
| ---- | ---- | ---- |
| Small (add a column) | 15 min chat | Slack thread or email |
| Medium (new report) | 1-2 meetings | 1-page brief |
| Large (new pipeline) | Multiple sessions | Formal requirements doc |

The process scales. Don't skip it for "small" requests — those often hide complexity.

---

## 7. Data-Specific Considerations

Questions derived from DAMA DMBOK that apply to most data projects.

### Data Quality

- What is the acceptable error rate?
- How do we handle missing values?
- What validation rules apply?

### Lineage

- Where does this data originate?
- What transformations occur?
- Can we trace back to source?

### Governance

- Who owns this data?
- Who can access it?
- What approval is needed for changes?

### Compliance

- Does it contain PII?
- GDPR, CCPA, or sector-specific regulations?
- Audit trail requirements?

### Integration

- What systems need to connect?
- APIs, file drops, or direct database access?
- Who maintains the integration?

### Historical Needs

- How far back do we need data?
- Do we need to track changes over time?
- Point-in-time accuracy requirements?

---

## 8. Templates

### User Story Format

```text
As a [role],
I want [feature],
so that [benefit].
```

Example:

```text
As a regional sales manager,
I want a daily revenue report by product category,
so that I can identify underperforming lines.
```

### Jobs-to-Be-Done Format

Focus on the accomplishment, not the feature.

```text
When [situation],
I want to [motivation],
so I can [expected outcome].
```

Example:

```text
When monthly sales close,
I want to calculate revenue by region,
so I can report to the board before the 5th.
```

### MoSCoW Prioritisation

| Priority | Meaning |
| ---- | ---- |
| Must | Non-negotiable for go-live |
| Should | Important but not blocking |
| Could | Nice to have if time permits |
| Won't | Explicitly out of scope (this time) |

### Simple Requirements Document

```text
PROJECT: [Name]
DATE: [Date]
OWNER: [Stakeholder name]

PROBLEM
What problem are we solving?

GOALS
What does success look like?

SUCCESS METRICS
How do we measure success?

CONSTRAINTS
Budget, timeline, technical limitations

STAKEHOLDERS
Who is affected? Who decides?

SCOPE
In scope / Out of scope

REQUIREMENTS
[List of must-haves and should-haves]
```

---

## 9. Applied Examples

### Example 1: Daily Revenue Report

**Initial Request:**
"I need a daily revenue report."

**Discovery Questions:**

| Question | Answer |
| ---- | ---- |
| Who needs it? | CEO, Regional Heads, Finance |
| What granularity? | By region, by product line, by sales rep |
| When is it needed? | Before 8am |
| What definition? | Recognised revenue or booked orders? |
| Comparison? | Day-over-day, MTD, YTD |
| Where delivered? | Email + dashboard |

**Uncovered Requirements:**

- Must reconcile to finance system within £500
- Needs drill-down capability
- Finance needs audit trail for month-end
- Must handle order amendments and cancellations

**What Would Have Gone Wrong:**

Without discovery, you might build a report that:

- Uses wrong revenue definition (booked vs recognised)
- Doesn't match Finance's numbers
- Arrives too late for morning meetings
- Can't handle same-day amendments

---

### Example 2: Inventory Dashboard

**Initial Request:**
"Can you build an inventory dashboard?"

**Discovery Questions:**

| Question | Answer |
| ---- | ---- |
| Who uses it? | Warehouse (real-time), Procurement (weekly), Finance (month-end) |
| What inventory? | Raw materials, WIP, finished goods |
| By location? | Yes, by warehouse and by SKU |
| Refresh rate? | Warehouse needs near-real-time; Finance needs month-end snapshot |
| Drill-down? | By supplier, category, age band |

**Uncovered Requirements:**

- Three different user groups with different needs
- Real-time for warehouse is actually "within 15 minutes"
- Finance needs point-in-time snapshots for valuation
- Must integrate with ERP and WMS systems
- Slow-moving stock alerts required

**Outcome:**

Instead of one dashboard, the solution became:

- Operational view (refreshes every 15 min)
- Weekly procurement summary
- Month-end valuation snapshot (frozen at period close)

---

### Example 3: Order Fulfilment Pipeline

**Initial Request:**
"Automate the order fulfilment reporting."

**Discovery Using 5 W's:**

| W | Question | Answer |
| ---- | ---- | ---- |
| WHO | Who tracks fulfilment today? | Operations team of 4 |
| WHAT | What do they produce? | Dispatch confirmations, delivery ETAs, exception reports |
| WHY | Why automate? | Manual errors, late updates, customer complaints |
| WHERE | Where does data come from? | Order system, WMS, carrier APIs |
| WHEN | When must it update? | Within 1 hour of status change |

**Non-Functional Requirements Uncovered:**

- Must maintain audit trail for 3 years
- Escalation workflow for delayed orders
- Must handle partial shipments and returns
- SLA: 99.5% of updates within 1 hour

**What Success Looks Like:**

- Status updates sent within 1 hour of dispatch
- 90% straight-through processing (no manual intervention)
- Customer complaint rate reduced by 50%

---

## Summary

Business requirements are not bureaucracy. They are the foundation that determines whether your data solution solves the right problem.

**Key Principles:**

1. Understand "why" before "how"
2. Ask questions — don't take requests literally
3. Document everything, even informally
4. Validate understanding before building
5. Consider non-functional requirements early

**The Payoff:**

- Build the right thing first time
- Earn stakeholder trust
- Transform from ticket-taker to strategic partner

---

## References

- Marcel Dybalski — Business Requirements 101 diagram
- DAMA DMBOK — Data Management Body of Knowledge
- Jobs-to-Be-Done Framework — Clayton Christensen
