-- 05_modeling.sql
-- Purpose: Events vs snapshots and modeling intent

-- Event-based metric: orders per day
SELECT
  DATE(order_created_at) AS order_date,
  COUNT(*) AS orders_count
FROM fact_order
GROUP BY
  DATE(order_created_at);

-- Snapshot-based query: active users per day
-- Assumes fact_user_daily exists
SELECT
  snapshot_date,
  COUNT(*) AS active_users
FROM fact_user_daily
WHERE is_active = true
GROUP BY
  snapshot_date
ORDER BY
  snapshot_date;
