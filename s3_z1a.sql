--Uloha 1
CREATE VIEW high_value_customers AS
SELECT c.customer_id,
    c.customer_name,
    sum(o.sales) as total_sales
From customers as c INNER JOIN orders as o on c.customer_id=o.customer_id GROUP BY c.customer_id HAVING sum(o.sales) > 2000;
SELECT * from high_value_customers;

--Uloha 2
CREATE View regional_monthly_sales AS
SELECT c.region,
    date_trunc('month',o.order_date),
    sum(o.sales) as total_sales
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id=o.customer_id
GROUP BY date_trunc('month',o.order_date),c.region;
SELECT * FROM regional_monthly_sales;

--Uloha 3 
CREATE VIEW analyst_orders AS
SELECT order_id,
    customer_id,
    product_id,
    sales,
    quantity,
    discount
From orders;

SELECT * from analyst_orders;

--Uloha 4
CREATE INDEX idx_orders_customer_id 
ON orders(customer_id);

SELECT *
FROM orders
WHERE customer_id = 'C001';

--Uloha 5
CREATE INDEX idx_orders_order_date
ON orders(order_date);

SELECT date_trunc('month',order_date) as month,
    SUM(sales) as sum
FROM orders GROUP BY date_trunc('month',order_date) ORDER BY sum(sales) ASC;

--Uloha 6
CREATE INDEX idx_orders_region_category
ON orders(customer_id,order_date);

CREATE INDEX idx_orders_region_category
ON orders (customer_id, order_date);

SELECT *
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE c.region = 'West'
  AND o.order_date >= '2024-01-01';

--Uloha 7
EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 'C001';