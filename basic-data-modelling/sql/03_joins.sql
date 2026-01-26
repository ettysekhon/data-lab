-- 03_joins.sql
-- Purpose: Demonstrate fan-out and safe join patterns

-- Fan-out example (do not aggregate here)
-- One order can appear multiple times after this join
SELECT
  o.order_id,
  oi.order_item_id
FROM fact_order o
JOIN fact_order_item oi
  ON o.order_id = oi.order_id;

-- Safe aggregation pattern
-- Aggregate at the order level before joining
WITH order_revenue AS (
  SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
  FROM fact_order_item
  GROUP BY
    order_id
)
SELECT
  o.user_id,
  SUM(orv.order_total) AS user_revenue
FROM fact_order o
JOIN order_revenue orv
  ON o.order_id = orv.order_id
GROUP BY
  o.user_id;
