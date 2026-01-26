# Basic Data Modeling – Concepts

This document is a concise reference for analytical SQL and data modeling.
It focuses on meaning, correct usage, and reasoning about correctness rather than syntax.

The central concept is **grain**.

---

## Quick Start

```bash
docker compose --env-file .env -f docker/docker-compose.yml up
```

Then go to [localhost:5050](http://localhost:5050/browser/)

---

## 1. Grain

### Definition

**Grain** answers a single question:

> What does one row represent?

Examples:

- One row per user
- One row per order
- One row per order item
- One row per user per day
- One row per product per country per month

If the grain cannot be stated clearly, the table or query is not well-defined.

---

### Why grain matters

Grain determines:

- how tables can be joined
- what can be grouped
- which aggregations are valid
- whether results are correct or silently wrong

Most SQL bugs are not syntax errors.
They are **grain errors**.

Common symptoms:

- numbers that are too large
- numbers that change unexpectedly
- mismatched results across dashboards
- use of DISTINCT to 'fix' counts

---

### Grain and related terms

Different disciplines use different words for the same concept:

- grain
- granularity
- row-level
- level of detail
- unit of analysis

All mean: the level at which data is recorded or reported.

---

### Core grain rule

> Every table has exactly one grain.  
> Every query produces exactly one result grain.

Mixing grains in a table or query leads to incorrect results.

---

### Practical habit

Before writing SQL, write one sentence:

> One row in the result represents __________.

If that sentence changes while writing the query, stop and redesign.

---

## 2. Measures and Dimensions

### Measures

- Numeric values that are aggregated
- Examples: revenue, quantity, count

### Dimensions

- Attributes used to group or segment data
- Examples: user, date, country, product

Rule:

- Measures are aggregated
- Dimensions define the grain

---

## 3. GROUP BY (Aggregation)

### What GROUP BY does

- Collapses multiple rows into fewer rows
- Enforces the result grain

### Rules

1. Every non-aggregated column in SELECT defines the grain
2. Every non-aggregated column must appear in GROUP BY
3. Aggregates operate within each group

### Checklist

Before using GROUP BY:

1. One row represents ______
2. The grouping key is ______
3. The measure comes from ______

---

## 4. Fan-Out and Double Counting

### Fan-out

Fan-out occurs when:

- a higher-grain table is joined to a lower-grain table
- example: orders → order items

One order becomes multiple rows after the join.

---

### Why fan-out is dangerous

- Aggregating after fan-out can silently overcount
- The query may run and look correct but produce wrong numbers

---

### Safety rules

- Aggregate at the lowest grain that matches the measure
- Aggregate before joining when possible
- Do not rely on DISTINCT unless the grain is fully understood

---

## 5. Same-Grain Rule

> When aggregating a measure, grouping dimensions must come from the same grain as the measure.

Examples:

- Order-item revenue → group by order-item date
- User metrics → group by user identifiers

Violating this rule causes silent correctness bugs.

---

## 6. Window Functions

### What window functions do

- Compute aggregates without collapsing rows
- Add contextual values to each row

### Key distinction

| GROUP BY | Window functions |
| -------- | ---------------- |
| Collapses rows | Preserves rows |
| Changes grain | Preserves grain |

---

### Core concepts

- PARTITION BY: where the calculation restarts
- ORDER BY: sequence within each partition

### When to use

- Percent of total
- Rankings
- Running totals
- Per-row comparisons

Rule:

- GROUP BY aggregates
- Window functions annotate

---

## 7. Events and Snapshots

### Event tables

Event tables record things that happened.

Characteristics:

- immutable
- append-only
- time-based
- high volume

Examples:

- orders
- order items
- transactions
- user actions

Best for:

- revenue
- funnels
- counts
- behavior analysis

---

### Snapshot tables

Snapshot tables record state at a point in time.

Characteristics:

- one row per entity per time period
- append-only over time
- represent “as-of” truth

Example grain:

- one row per user per day

What belongs:

- stateful attributes (is_active, current_plan)

What does not belong:

- derived metrics
- aggregates
- event summaries

Rule:

- Snapshots store state, not calculations

---

## 8. Fact and Dimension Tables

### Dimension tables

- describe entities
- used for grouping and filtering
- lower cardinality

Examples:

- users
- products
- dates

### Facts

- describe events or measurements
- higher cardinality
- contain foreign keys and measures

Examples:

- orders
- order items
- events

---

## 9. Schema Design Principles

1. One table has one clear grain
2. Do not mix grains in a table
3. Do not store derived metrics in base tables
4. Facts reference dimensions, not the other way around
5. Time must be explicit in facts and snapshots

---

## 10. Common Terminology

- Grain: what one row represents
- Granularity: level of detail
- Measure: numeric value to aggregate
- Dimension: grouping or filtering attribute
- Fan-out: row multiplication due to joins
- Derived metric: calculated value
- Event: something that happened
- Snapshot: state at a point in time
- Partition: window function grouping
- Result grain: grain of a query output

---

## 11. Universal Analytical SQL Workflow

For every analytical query:

1. Define the grain in plain English
2. Identify the grouping key
3. Identify the measure and its source
4. Join only what is required
5. Aggregate or window intentionally
6. Validate row counts and logic

Following this workflow makes SQL predictable, correct, and explainable.
