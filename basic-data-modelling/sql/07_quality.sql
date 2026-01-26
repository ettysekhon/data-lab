-- 07_quality.sql
-- Purpose: Data quality, trust, and anomaly detection

-- Duplicate order items
SELECT
  order_id,
  product_id,
  COUNT(*) AS duplicate_count
FROM fact_order_item
GROUP BY
  order_id,
  product_id
HAVING
  COUNT(*) > 1;

-- Orders with no order items
SELECT
  o.order_id
FROM fact_order o
LEFT JOIN fact_order_item oi
  ON o.order_id = oi.order_id
WHERE
  oi.order_id IS NULL;

-- Revenue sanity check (negative or zero)
SELECT
  *
FROM fact_order_item
WHERE
  quantity <= 0
  OR unit_price <= 0;
