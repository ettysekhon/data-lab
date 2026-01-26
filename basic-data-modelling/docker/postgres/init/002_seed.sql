
-- =========================
-- Seed Data for SQL Analytics Lab
-- Small, intentional dataset designed to expose:
-- - fan-out
-- - aggregation errors
-- - window function behavior
-- =========================

-- Users
INSERT INTO dim_user (user_id, created_at, country) VALUES
  (1, '2024-01-01', 'UK'),
  (2, '2024-01-03', 'US'),
  (3, '2024-01-05', 'DE');

-- Products
INSERT INTO dim_product (product_id, product_name, category, price, is_active) VALUES
  (101, 'Basic Subscription', 'Subscription', 10.00, true),
  (102, 'Pro Subscription', 'Subscription', 25.00, true),
  (103, 'One-Time Addon', 'Addon', 5.00, true);

-- Orders
INSERT INTO fact_order (order_id, user_id, order_created_at, order_status, currency) VALUES
  (1001, 1, '2024-01-10 10:00:00', 'completed', 'USD'),
  (1002, 1, '2024-01-11 11:00:00', 'completed', 'USD'),
  (1003, 2, '2024-01-11 09:30:00', 'completed', 'USD'),
  (1004, 3, '2024-01-12 14:15:00', 'completed', 'EUR');

-- Order Items
-- Note: multiple items per order to create fan-out scenarios
INSERT INTO fact_order_item (
  order_item_id,
  order_id,
  product_id,
  quantity,
  unit_price,
  order_item_created_at
) VALUES
  (1, 1001, 101, 1, 10.00, '2024-01-10 10:01:00'),
  (2, 1001, 103, 2, 5.00,  '2024-01-10 10:02:00'),
  (3, 1002, 102, 1, 25.00, '2024-01-11 11:01:00'),
  (4, 1003, 101, 1, 10.00, '2024-01-11 09:31:00'),
  (5, 1003, 103, 1, 5.00,  '2024-01-11 09:32:00'),
  (6, 1004, 102, 1, 25.00, '2024-01-12 14:16:00');
