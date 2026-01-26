-- 06_performance.sql
-- Purpose: Analytical performance awareness

-- Identify large scans
EXPLAIN ANALYZE
SELECT
  o.user_id,
  SUM(oi.quantity * oi.unit_price)
FROM fact_order o
JOIN fact_order_item oi
  ON o.order_id = oi.order_id
GROUP BY
  o.user_id;

-- Pre-aggregation for performance
WITH daily_revenue AS (
  SELECT
    DATE(order_item_created_at) AS order_date,
    SUM(quantity * unit_price) AS revenue
  FROM fact_order_item
  GROUP BY
    DATE(order_item_created_at)
)
SELECT
  AVG(revenue) AS avg_daily_revenue
FROM daily_revenue;
