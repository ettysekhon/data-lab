-- 02_aggregation.sql
-- Purpose: Correct GROUP BY usage and aggregation at the right grain

-- Total revenue per user
-- Grain: one row per user
SELECT
  o.user_id,
  SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM fact_order o
JOIN fact_order_item oi
  ON o.order_id = oi.order_id
GROUP BY
  o.user_id;

-- Revenue per calendar day
-- Grain: one row per day
SELECT
  DATE(oi.order_item_created_at) AS order_date,
  SUM(oi.quantity * oi.unit_price) AS daily_revenue
FROM fact_order_item oi
GROUP BY
  DATE(oi.order_item_created_at)
ORDER BY
  order_date;
