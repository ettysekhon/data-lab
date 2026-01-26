-- 04_windows.sql
-- Purpose: Window functions without changing grain

-- Revenue share per order item
-- Grain: one row per order item
SELECT
  oi.order_item_id,
  o.user_id,
  oi.quantity * oi.unit_price AS item_revenue,
  SUM(oi.quantity * oi.unit_price)
    OVER (PARTITION BY o.user_id) AS user_total_revenue,
  (oi.quantity * oi.unit_price)
    / SUM(oi.quantity * oi.unit_price)
      OVER (PARTITION BY o.user_id) AS revenue_share
FROM fact_order_item oi
JOIN fact_order o
  ON oi.order_id = o.order_id;

-- Rank products by revenue within each category
SELECT
  p.category,
  p.product_id,
  SUM(oi.quantity * oi.unit_price) AS product_revenue,
  RANK() OVER (
    PARTITION BY p.category
    ORDER BY SUM(oi.quantity * oi.unit_price) DESC
  ) AS revenue_rank
FROM fact_order_item oi
JOIN dim_product p
  ON oi.product_id = p.product_id
GROUP BY
  p.category,
  p.product_id;
