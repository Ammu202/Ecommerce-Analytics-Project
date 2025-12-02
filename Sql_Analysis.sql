CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE transactions (
    transaction_id VARCHAR(50),
    user_name VARCHAR(100),
    age INT,
    country VARCHAR(100),
    product_category VARCHAR(100),
    purchase_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    transaction_date DATE
);
SELECT 
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT user_name) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    AVG(purchase_amount) AS avg_purchase_value
FROM transactions;

SELECT 
    country,
    SUM(purchase_amount) AS total_revenue,
    COUNT(*) AS num_transactions
FROM transactions
GROUP BY country
ORDER BY total_revenue DESC;

SELECT 
    product_category,
    SUM(purchase_amount) AS total_revenue,
    COUNT(*) AS num_transactions,
    AVG(purchase_amount) AS avg_spend
FROM transactions
GROUP BY product_category
ORDER BY total_revenue DESC;

SELECT 
    transaction_date,
    SUM(purchase_amount) AS daily_revenue
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date;

SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    SUM(purchase_amount) AS monthly_revenue
FROM transactions
GROUP BY month
ORDER BY month;

SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_transactions,
    SUM(purchase_amount) AS total_revenue
FROM transactions
GROUP BY age_group
ORDER BY total_revenue DESC;

SELECT
    payment_method,
    COUNT(*) AS num_transactions,
    SUM(purchase_amount) AS total_revenue
FROM transactions
GROUP BY payment_method
ORDER BY total_revenue DESC;
