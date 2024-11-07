
# Brazilian E-Commerce Data Warehouse

This project implements a data warehouse for Brazilian e-commerce data, designed to analyze orders, products, customer information, and reviews. It leverages MySQL for data storage, ETL processes for data transformation, and materialized views to support analytics.

This project is based on the **Brazilian E-Commerce Public Dataset by Olist**. The dataset contains information on orders made between 2016 and 2018, with insights into order status, customer reviews, payment methods, and more. The data warehouse created here allows for a wide range of analytics, including customer segmentation, sales performance, and delivery logistics.

![Data Warehouse Structure](https://github.com/user-attachments/assets/a7a42c6e-8607-432e-8d2a-4ee95c5630e9)

---

## Tables

### `customers`
- Stores customer information such as unique ID, zip code, city, and state.

### `products`
- Stores product details, including category, dimensions, and weight.

### `orders`
- Contains details about each order, including timestamps for purchase, approval, delivery, and estimated delivery.

### `order_items`
- Stores individual items within each order, linking to products and orders.

### `payments`
- Details payment methods and installment plans for each order.

### `olist_order_reviews`
- Stores customer reviews, including review scores, comments, and timestamps for review creation.

---

## Basic Sales Analytics Table

The **`basic_sales_analytics`** table consolidates data from other tables, allowing for efficient queries for analytical purposes. It contains the following fields:

- `order_id`, `customer_id`, `customer_unique_id`, `product_id`, `product_category_name`
- `price`, `total_order_value`, `total_items_in_order`, `order_item_id`

---

## ETL Process

The ETL process for this project involves loading raw data into the database, transforming it, and loading it into analytical tables for optimized querying.

### Procedures and Triggers

- **`populate_basic_sales_analytics` Procedure**: This stored procedure extracts data from operational tables and populates `basic_sales_analytics` with consolidated data.
  
- **Triggers**:
  - **`after_order_items_insert`** and **`after_orders_insert`** triggers call the ETL procedure each time a new order or order item is inserted.

---

## Key Analytics Metrics

- **Total Orders and Revenue by Product Category**: Helps understand which categories contribute the most to revenue.
  
- **Customer Analytics**: Assesses customer value, spending patterns, and repeat purchase rates.

