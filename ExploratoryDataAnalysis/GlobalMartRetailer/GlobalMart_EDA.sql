USE global_mart;

DROP TABLE IF EXISTS transactions_raw;
CREATE TABLE transactions_raw (
  CustomerID        VARCHAR(64),
  Name              VARCHAR(100),
  Gender            VARCHAR(10),
  Age               INT,
  Country           VARCHAR(50),
  City              VARCHAR(100),
  LoyaltyTier       VARCHAR(20),
  SignupDate        DATE,
  ProductID         VARCHAR(64),
  ProductCategory   VARCHAR(50),
  ProductSubCategory VARCHAR(50),
  OrderID           VARCHAR(64),
  OrderDate         DATE,
  Quantity          INT,
  UnitPrice         DECIMAL(10,2),
  TotalAmount       DECIMAL(12,2),
  DiscountPct       DECIMAL(5,2),
  PaymentMethod     VARCHAR(30),
  Returned          ENUM('Yes','No')
);

SHOW VARIABLES LIKE 'local_infile';
-- If OFF and you have privileges:
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '/Userpath/GlobalMartData.csv'
INTO TABLE transactions_raw
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(CustomerID, Name, Gender, @Age, Country, City, LoyaltyTier, @SignupDate,
 ProductID, ProductCategory, ProductSubCategory, OrderID, @OrderDate,
 @Quantity, @UnitPrice, @TotalAmount, @DiscountPct, PaymentMethod, Returned)
SET
  Age         = NULLIF(@Age,''),
  SignupDate  = STR_TO_DATE(@SignupDate, '%Y-%m-%d'),
  OrderDate   = STR_TO_DATE(@OrderDate,  '%Y-%m-%d'),
  Quantity    = NULLIF(@Quantity,''),
  UnitPrice   = NULLIF(@UnitPrice,''),
  TotalAmount = NULLIF(@TotalAmount,''),
  DiscountPct = NULLIF(@DiscountPct,'');

-- Counting number of rows
SELECT COUNT(*) AS number_of_rows FROM transactions_raw;

-- Reviewing the timespan of the data
SELECT 
  MIN(OrderDate) AS min_order_date,
  MAX(OrderDate) AS max_order_date,
  MIN(SignupDate) AS min_signup_date,
  MAX(SignupDate) AS max_signup_date
FROM transactions_raw;

-- Looking for null values
SELECT 'City' col, COUNT(*) nulls FROM transactions_raw WHERE City IS NULL
UNION ALL SELECT 'DiscountPct', COUNT(*) FROM transactions_raw WHERE DiscountPct IS NULL
UNION ALL SELECT 'Age', COUNT(*) FROM transactions_raw WHERE Age IS NULL
UNION ALL SELECT 'OrderDate', COUNT(*) FROM transactions_raw WHERE OrderDate IS NULL
UNION ALL SELECT 'SignupDate', COUNT(*) FROM transactions_raw WHERE SignupDate IS NULL
UNION ALL SELECT 'TotalAmount', COUNT(*) FROM transactions_raw WHERE TotalAmount IS NULL
ORDER BY nulls DESC;

-- Checking for duplicate orders
SELECT OrderID, COUNT(*) AS duplicates
FROM transactions_raw
GROUP BY OrderID
HAVING COUNT(*) > 1
ORDER BY duplicates DESC, OrderID
LIMIT 20;

-- Building a cleaned view
--  Ensure that dates and numbers are valid
--  Impute empty cities to 'Unknown' and DiscountPct nulls to 0
--  Filter Age from 18-100, Quantities need to be > 0, prices cannot be negative
DROP VIEW IF EXISTS transactions_clean;
CREATE VIEW transactions_clean AS
SELECT
  CustomerID,
  Name,
  Gender,
  CASE WHEN Age BETWEEN 18 AND 100 THEN Age END AS Age,
  Country,
  COALESCE(City, 'Unknown') AS City,
  LoyaltyTier,
  SignupDate,
  ProductID,
  ProductCategory,
  ProductSubCategory,
  OrderID,
  OrderDate,
  CASE WHEN Quantity > 0 THEN Quantity END AS Quantity,
  CASE WHEN UnitPrice >= 0 THEN UnitPrice END AS UnitPrice,
  CASE WHEN TotalAmount >= 0 THEN TotalAmount END AS TotalAmount,
  COALESCE(DiscountPct, 0) AS DiscountPct,
  PaymentMethod,
  Returned
FROM transactions_raw;


-- 
DROP TABLE IF EXISTS transactions_dedup;
CREATE TABLE transactions_dedup AS
WITH ranked AS (
  SELECT t.*,
         ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY OrderDate DESC) AS rn
  FROM transactions_clean t
)
SELECT * FROM ranked WHERE rn = 1;

-- Core KPIs

-- Revenue and Return
SELECT
  ROUND(SUM(TotalAmount),2)                    AS revenue,
  ROUND(AVG(TotalAmount),2)                    AS avg_order_value,
  ROUND(AVG(UnitPrice),2)                      AS avg_unit_price,
  ROUND(100.0 * AVG(CASE WHEN Returned='Yes' THEN 1 ELSE 0 END), 2) AS return_rate_pct
FROM transactions_dedup;

-- Category and Country leaders
SELECT ProductCategory,
       ROUND(SUM(TotalAmount),2) AS revenue,
       COUNT(*) AS orders
FROM transactions_dedup
GROUP BY ProductCategory
ORDER BY revenue DESC;

SELECT Country,
       ROUND(SUM(TotalAmount),2) AS revenue,
       COUNT(*) AS orders
FROM transactions_dedup
GROUP BY Country
ORDER BY revenue DESC;

-- Loyalty and Country
SELECT Country, LoyaltyTier,
       ROUND(SUM(TotalAmount),2) AS revenue,
       COUNT(*) AS orders,
       ROUND(AVG(TotalAmount),2) AS aov
FROM transactions_dedup
GROUP BY Country, LoyaltyTier
ORDER BY Country, revenue DESC;

-- Payment Methods
SELECT PaymentMethod,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM transactions_dedup), 2) AS order_pct,
       ROUND(100.0 * SUM(TotalAmount) / (SELECT SUM(TotalAmount) FROM transactions_dedup), 2) AS revenue_pct
FROM transactions_dedup
GROUP BY PaymentMethod
ORDER BY revenue_pct DESC;

-- Returns by category
SELECT ProductCategory,
       ROUND(100.0 * AVG(CASE WHEN Returned='Yes' THEN 1 ELSE 0 END), 2) AS return_rate_pct,
       COUNT(*) AS orders
FROM transactions_dedup
GROUP BY ProductCategory
HAVING COUNT(*) > 50
ORDER BY return_rate_pct DESC;

-- Time Trends (Monthly)
SELECT
  DATE_FORMAT(OrderDate, '%Y-%m-01') AS month,
  ROUND(SUM(TotalAmount),2) AS revenue,
  COUNT(*) AS orders
FROM transactions_dedup
GROUP BY month
ORDER BY month;