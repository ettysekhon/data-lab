-- 01_basics.sql
-- Purpose: Establish result grain, identifiers, and base querying discipline

-- What does one row represent?
-- One row per user
SELECT
  user_id,
  country,
  created_at
FROM dim_user;

-- One row per product
SELECT
  product_id,
  product_name,
  category
FROM dim_product;

-- One row per order
SELECT
  order_id,
  user_id,
  order_created_at,
  order_status
FROM fact_order;

-- One row per order item
SELECT
  order_item_id,
  order_id,
  product_id,
  quantity,
  unit_price
FROM fact_order_item;
