-- =========================
-- Dimensions
-- =========================

CREATE TABLE dim_user (
    user_id        INTEGER PRIMARY KEY,
    created_at     TIMESTAMP NOT NULL,
    country        VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id     INTEGER PRIMARY KEY,
    product_name   VARCHAR(255) NOT NULL,
    category       VARCHAR(100),
    price          NUMERIC(12,2),
    is_active      BOOLEAN NOT NULL DEFAULT true
);

-- =========================
-- Facts
-- =========================

CREATE TABLE fact_order (
    order_id           INTEGER PRIMARY KEY,
    user_id            INTEGER NOT NULL REFERENCES dim_user(user_id),
    order_created_at   TIMESTAMP NOT NULL,
    order_status       VARCHAR(20) NOT NULL,
    currency           VARCHAR(3) NOT NULL
);

CREATE TABLE fact_order_item (
    order_item_id           INTEGER PRIMARY KEY,
    order_id                INTEGER NOT NULL REFERENCES fact_order(order_id),
    product_id              INTEGER NOT NULL REFERENCES dim_product(product_id),
    quantity                INTEGER NOT NULL,
    unit_price              NUMERIC(12,2) NOT NULL,
    order_item_created_at   TIMESTAMP NOT NULL
);
