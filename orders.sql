SET SQL_SAFE_UPDATES = 0;

-- Convert from string to DATE
ALTER TABLE orders 
MODIFY Order_Date DATE;

-- 1.Extract month from order_date
SELECT EXTRACT(MONTH FROM Order_Date) AS month FROM orders;

-- 2.Extract year from order_date 
SELECT EXTRACT(YEAR FROM Order_Date) AS year FROM orders;


-- 3. Monthly revenue and order volume
SELECT 
    year,
    month,
    ROUND(SUM(Amount), 2) AS total_revenue,
    COUNT(DISTINCT `Transaction_ID`) AS total_orders
FROM orders
GROUP BY year, month
ORDER BY year, month;

-- 4. Top 5 products by total revenue
SELECT 
    Product_name,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM orders
GROUP BY Product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 5. Revenue by region
SELECT 
    Region,
    ROUND(SUM(Amount), 2) AS total_revenue,
    COUNT(DISTINCT `Transaction_ID`) AS total_orders
FROM orders
GROUP BY Region
ORDER BY total_revenue DESC;

-- 6. Monthly revenue by product category
SELECT 
    year,
    month,
    Product_Category,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM orders
GROUP BY year, month, Product_Category
ORDER BY year, month, total_revenue DESC;

-- 7. Revenue by payment method
SELECT 
    Payment_Method,
    ROUND(SUM(Amount), 2) AS total_revenue,
    COUNT(DISTINCT `Transaction_ID`) AS total_orders
FROM orders
GROUP BY Payment_Method
ORDER BY total_revenue DESC;

-- 8. Best-selling product each month
SELECT 
    year,
    month,
    Product_name,
    ROUND(SUM(Amount), 2) AS monthly_revenue
FROM orders
GROUP BY year, month, Product_name
ORDER BY year, month, monthly_revenue DESC;

-- 9. Average order value per month
SELECT 
    year,
    month,
    ROUND(SUM(Amount) / COUNT(DISTINCT `Transaction_ID`), 2) AS avg_order_value
FROM orders
GROUP BY year, month
ORDER BY year, month;

-- 10. Highest revenue day
SELECT 
    Order_Date,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM orders
GROUP BY Order_Date
ORDER BY total_revenue DESC
LIMIT 1;

-- 11. Total units sold by category
SELECT 
    Product_Category,
    SUM(Units_Sold) AS total_units_sold
FROM orders
GROUP BY Product_Category
ORDER BY total_units_sold DESC;

-- 12. Revenue by region and category
SELECT 
    Region,
    Product_Category,
    ROUND(SUM(Amount), 2) AS total_revenue
FROM orders
GROUP BY Region, Product_Category
ORDER BY Region, total_revenue DESC;

