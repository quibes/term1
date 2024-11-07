
INSERT INTO customers (
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
) VALUES (
    'f6dd3ec061db4e3987629fe6b26e6cce',  -- customer_id (ensure this matches)
    'unique_customer_001',
    '12345',
    'Sao Paulo',
    'SP'
);
INSERT INTO orders (
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
) VALUES (
    'ORD12348',                               -- Order ID to be referenced in order_items
    'f6dd3ec061db4e3987629fe6b26e6cce',       -- Existing customer_id in customers table
    'delivered',
    '2023-10-15 14:30:00',
    '2023-10-15 15:00:00',
    '2023-10-16 09:00:00',
    '2023-10-20 12:00:00',
    '2023-10-22 18:00:00'
);
INSERT INTO order_items (
    order_id,
    order_item_id,
    product_id,
    shipping_limit_date,
    price
) VALUES (
    'ORD12348',                     -- Order ID (should match an order_id in orders table)
    1,                              -- Order item ID (for this particular item within the order)
    '"310ae3c140ff94b03219ad0adc3c778f"',                      -- Product ID (should match a product_id in products table)
    '2023-10-18 12:00:00',          -- Shipping limit date
    120.50                         -- Price of the product
);

SELECT * FROM basic_sales_analytics WHERE order_id = 'ORD12348';

