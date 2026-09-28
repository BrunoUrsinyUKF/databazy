-- Active: 1790623365937@@127.0.0.1@5432@superstore
CREATE DATABASE superstore;
CREATE TABLE customers(
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    region VARCHAR (50)
);

CREATE TABLE products(
    product_id VARCHAR(20) PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(100)
);



CREATE TABLE orders(
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20), FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    product_id VARCHAR(20), FOREIGN KEY(product_id) REFERENCES products(product_id),
    order_date DATE,
    ship_date DATE,
    sales NUMERIC,
    quantity INT,
    discount NUMERIC,
    profit NUMERIC 
);

SELECT
    o.order_id,
    c.customer_name,
    o.sales
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE o.sales > 500
ORDER BY o.sales DESC;
