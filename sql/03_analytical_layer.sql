DROP TABLE IF EXISTS basic_sales_analytics;

CREATE TABLE basic_sales_analytics (
    order_id VARCHAR(50),                  -- Unique identifier for each order
    customer_id VARCHAR(50),               -- Customer ID for segmentation analysis
    customer_unique_id VARCHAR(50),        -- Unique customer ID to identify repeat customers
    product_id VARCHAR(50),                -- Product ID for product-level analysis
    product_category_name VARCHAR(100),    -- Product category for category-level analysis
    price DECIMAL(10, 2),                  -- Price of the product in the order
    total_order_value DECIMAL(10, 2),      -- Total value of the order (sum of items)
    total_items_in_order INT,              -- Total number of items in the order
    order_item_id INT,                     -- Unique identifier for each item within the order
    PRIMARY KEY (order_id, product_id, order_item_id)  -- Make each row unique by order item
);
