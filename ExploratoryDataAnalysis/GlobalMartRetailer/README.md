# GlobalMart Retailer – Exploratory Data Analysis (SQL)

## 1. Project Overview

**Purpose:**  
Perform a complete exploratory data analysis (EDA) on a synthetic retail & e-commerce dataset using **MySQL** to uncover business insights and prepare data for dashboards.

**Business Context:**  
GlobalMart is a fictional multinational retailer operating across multiple countries and channels. This SQL-based EDA helps answer key operational and strategic questions:

- What is our total revenue and average order value?
- Which product categories and countries drive the most sales?
- How do loyalty tiers impact revenue across geographies?
- What is our return rate by category?
- How are sales trending over time?

---

## 2. Dataset

**Source:** Synthetic dataset (`GlobalMartData.csv`) generated to simulate real-world retail transactions.

**Key Fields:**

- **Customer Data:** `CustomerID`, `Name`, `Gender`, `Age`, `Country`, `City`, `LoyaltyTier`, `SignupDate`
- **Product Data:** `ProductID`, `ProductCategory`, `ProductSubCategory`
- **Order Data:** `OrderID`, `OrderDate`, `Quantity`, `UnitPrice`, `TotalAmount`, `DiscountPct`, `PaymentMethod`, `Returned`

---

## 3. Methodology

The SQL script performs the following steps:

### Data Loading & Staging

- Creates `transactions_raw` staging table
- Loads CSV data via `LOAD DATA LOCAL INFILE`
- Ensures correct data types and NULL handling

### Data Profiling

- Row count verification
- Date range checks (`MIN` / `MAX` for OrderDate & SignupDate)
- Null value counts per column
- Duplicate order detection

### Data Cleaning

- Impute missing `City` → `"Unknown"`
- Impute missing `DiscountPct` → `0`
- Filter invalid ages (<18 or >100)
- Remove negative prices and zero/negative quantities
- Deduplicate orders (keep latest by `OrderDate`)

### Core KPI Calculations

- **Revenue**, **Average Order Value**, **Average Unit Price**
- **Return Rate (%)**
- **Top Product Categories**
- **Top Countries**
- **Loyalty Tier performance per country**
- **Payment Method mix**
- **Return rates by category**
- **Monthly revenue trends**

---

## 4. Business Insights Expected

From running this EDA, the business can:

- Focus marketing spend on high-revenue categories/countries
- Identify loyalty tier segments for targeted promotions
- Improve return-prone categories
- Adjust inventory based on monthly demand trends
- Optimize payment options based on usage/revenue share

---

## 5. Usage Instructions

1. **Load Script in MySQL Workbench**
   - Open `GlobalMart_EDA.sql`
   - Update the `LOAD DATA LOCAL INFILE` path to match your CSV location
2. **Run in Sections**
   - **Setup:** Create schema/table, load raw data
   - **Profiling:** Run initial SELECTs to validate
   - **Cleaning:** Create `transactions_clean` view and dedup table
   - **KPIs:** Run each SELECT to generate insights
3. **Export Results**
   - Use MySQL Workbench "Export Resultset" or `INTO OUTFILE` to save outputs for dashboards

---

## 6. Tools & Technologies

- **MySQL 8.x**
- **MySQL Workbench** (for SQL execution & result visualization)
- **CSV dataset** (synthetic, 5,000+ rows)
- **Indexes** for query optimization

---

## 7. Next Steps

- Connect cleaned & aggregated tables/views to **Excel** or **Tableau** for dashboarding
- Automate monthly EDA refresh with scheduled SQL scripts
- Extend analysis with customer lifetime value and churn predictions
