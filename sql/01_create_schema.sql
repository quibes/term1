CREATE DATABASE StoreDB;
USE StoreDB;
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix VARCHAR(15),  -- Increased length for potential longer prefixes
    customer_city VARCHAR(100),
    customer_state VARCHAR(50)             -- Increased length to accommodate longer state names if needed
);
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,        -- Unique identifier for each product
    product_category_name VARCHAR(100),        -- Category of the product (e.g., electronics, furniture)
    product_name_length INT,                   -- Length of the product name, stored as an integer; may be used for text-based analytics
    product_description_length INT,            -- Length of the product description, 
    product_photos_qty INT,                    -- Number of photos available for the product
    product_weight_g FLOAT,                    -- Weight of the product
    product_length_cm FLOAT,                   -- Length of the product 
    product_height_cm FLOAT,                   -- Height of the product
    product_width_cm FLOAT                     -- Width of the product 
);
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(50),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (
    order_id VARCHAR(255),                  -- Unique identifier for each order
    order_item_id INT,                      -- Sequential identifier for each item within a specific order
    product_id VARCHAR(255),                -- Unique identifier for each product in the order
    price FLOAT,                            -- Price of the individual item in the order
    freight_value FLOAT,                    -- Cost of freight or shipping for the individual item

    PRIMARY KEY (order_id, order_item_id),  -- Composite primary key
    FOREIGN KEY (order_id) REFERENCES orders(order_id),  -- Foreign key linking to the orders table
    FOREIGN KEY (product_id) REFERENCES products(product_id)  -- Foreign key linking to the products table
);
ALTER TABLE order_items
DROP COLUMN price;
ALTER TABLE order_items
CHANGE COLUMN freight_value price FLOAT;
DROP TABLE IF EXISTS payments;
CREATE TABLE payments (
    order_id VARCHAR(50),                -- The unique identifier for each order
    payment_sequential INT,              -- Sequence number for payment, used if there are multiple payments for a single order
    payment_type VARCHAR(50),            -- The type of payment method used (e.g., credit card, debit card, voucher, etc.)
    payment_installments INT,            -- Number of installments chosen for the payment, indicating if the customer opted to pay in parts
    payment_value FLOAT,                 -- The amount paid in each installment or payment transaction

    PRIMARY KEY (order_id, payment_sequential),  -- Composite primary key using order_id and payment_sequential, ensuring uniqueness for each payment
    FOREIGN KEY (order_id) REFERENCES orders(order_id)  -- Foreign key linking each payment to an order in the orders table
);
DROP TABLE IF EXISTS olist_order_reviews;
CREATE TABLE olist_order_reviews (
    review_id VARCHAR(50) PRIMARY KEY,  -- Unique identifier for each review
    order_id VARCHAR(50),               -- Unique order identifier, linked to orders table
    review_score INT,                   -- Satisfaction score (1 to 5)
    review_comment_title VARCHAR(255),  -- Title of the customer's comment (optional)
    review_comment_message TEXT,        -- Full text of the customer's review (optional)
    review_creation_date DATE,          -- Date when the survey was sent
    review_answer_timestamp DATETIME,   -- Timestamp of the customer's response

    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
