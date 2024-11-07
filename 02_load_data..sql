-- Load data into the customers table
LOAD DATA LOCAL INFILE '/Users/anastasyarussu/Downloads/archive/olist_customers_dataset.csv'
INTO TABLE StoreDB.customers
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into the products table
LOAD DATA LOCAL INFILE '/Users/anastasyarussu/Downloads/archive/olist_products_dataset.csv'
INTO TABLE StoreDB.products
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into the orders table
LOAD DATA LOCAL INFILE '/Users/anastasyarussu/Downloads/archive/olist_orders_dataset.csv'
INTO TABLE StoreDB.orders
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into the order_items table
LOAD DATA LOCAL INFILE '/Users/anastasyarussu/Downloads/archive/olist_order_items_dataset.csv'
INTO TABLE StoreDB.order_items
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into the payments table
LOAD DATA LOCAL INFILE '/Users/anastasyarussu/Downloads/archive/olist_order_payments_dataset.csv'
INTO TABLE StoreDB.payments
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into the olist_order_reviews table
LOAD DATA LOCAL INFILE '/Users/anastasyarussu/Downloads/archive/olist_order_reviews_dataset.csv'
INTO TABLE StoreDB.olist_order_reviews
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
