-- Create a new database for the coffee sales data
CREATE DATABASE IF NOT EXISTS coffee_machine_sales;
-- Use the database
USE coffee_machine_sales;

-- Create a table for the coffee sales 
CREATE TABLE IF NOT EXISTS coffee_sales_data (
    date DATE,				     -- Date of the sale
    datetime DATETIME,		     -- Date and time of the sale
    cash_type VARCHAR(10),	     -- Cash type of the purchase
    card VARCHAR(50),            -- Name of the coffee product
    money DECIMAL(10, 2),	     -- Sales amount
    coffee_name VARCHAR(50),      -- Beverage type
    PRIMARY KEY (date, datetime) -- Primary key for integrity
);

-- Enable local infile
SET GLOBAL local_infile = 1;
-- Load data from the CSV file into the database
-- Replace '/path_to/coffee_sales_index.csv' with your actual file path
LOAD DATA LOCAL INFILE '/Users/luisladino/Desktop/Portfolio/data_analysis/coffee_machine_sales/coffee_sales_analysis_in_SQL/coffee_sales_index.csv'
INTO TABLE coffee_sales_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(date, datetime, cash_type, card, money, coffee_name);

-- Inspect the structure of the table
DESCRIBE coffee_sales_data;

-- Check for missing values by column
SELECT 
    COUNT(*) AS total_rows,
    COUNT(date) AS valid_dates,
    COUNT(datetime) AS valid_timestamps,
    COUNT(cash_type) AS valid_cash_type,
    COUNT(card) AS valid_card,
    COUNT(money) AS valid_revenues,
    COUNT(coffee_name) AS valid_beverages
FROM coffee_sales_data;

-- Exploratory Analysis
-- Count of Records
SELECT COUNT(*) AS total_transactions FROM coffee_sales_data;

-- Summary of transaction amounts
SELECT
	MIN(money) AS min_transaction,
    MAX(money) AS max_transaction,
    AVG(money) AS avg_transaction,
    SUM(money) AS total_revenue
FROM coffee_sales_data;

-- Identify top-selling products
SELECT
	coffee_name,
    COUNT(*) AS num_purchases
FROM coffee_sales_data
GROUP BY coffee_name
ORDER BY num_purchases DESC;

-- Customer Payment preferences
SELECT
	cash_type,
    COUNT(*) AS num_transactions,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM coffee_sales_data)) AS percentage
FROM coffee_sales_data
GROUP BY cash_type
ORDER BY num_transactions DESC;

-- Distribution of transaction amounts
SELECT 
    CASE
        WHEN money < 10 THEN 'Under 10'
        WHEN money BETWEEN 10 AND 20 THEN '10-20'
        WHEN money BETWEEN 20 AND 30 THEN '20-30'
        WHEN money BETWEEN 30 AND 40 THEN '30-40'
        ELSE 'Above 40'
    END AS amount_range,
    COUNT(*) AS num_transactions
FROM coffee_sales_data
GROUP BY amount_range
ORDER BY amount_range;

-- Aggregate revenue and transactions by date
SELECT 
    date,
    SUM(money) AS daily_revenue,
    COUNT(*) AS daily_transactions
FROM coffee_sales_data
GROUP BY date
ORDER BY date;

-- Trends over time (daily)
SELECT 
    date,
    COUNT(*) AS num_transactions,
    SUM(money) AS total_revenue
FROM coffee_sales_data
GROUP BY date
ORDER BY date;
    
