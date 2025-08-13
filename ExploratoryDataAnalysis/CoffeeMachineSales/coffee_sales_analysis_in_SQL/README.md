# Coffee Sales Analysis Project in SQL

## Project Overview

This project analyzes transactional coffee sales data to provide actionable insights into customer preferences, sales trends, and revenue performance. The analysis leverages SQL to clean, aggregate, and extract meaningful business insights, showcasing technical proficiency and business acumen.

## Business Value

This project highlights data-driven decision-making capabilities, focusing on:

- Inventory and pricing optimization.
- Marketing and promotional strategy refinement.
- Enhanced customer experience through tailored payment options.

## Dataset Description

- **Source**: (https://www.kaggle.com/datasets/ihelon/coffee-sales)
- **Structure**:
  - **date**: Sale date.
  - **datetime**: Sale timestamp.
  - **cash_type**: Cash or card payment.
  - **card**: Card information
  - **money**: Sales amount in currency.
  - **coffee_name**: Type of beverage (e.g., Latte, Espresso).
- **Processing Steps**:
  - Imported using `LOAD DATA LOCAL INFILE`.
  - Validated for missing values and consistency.

## Methodologies and Tools

- **SQL**:
  - Database design and optimization.
  - Analytical queries for deriving business insights.
- **Key Techniques**:
  - Aggregation and grouping for trend analysis.
  - Filtering and ordering for top-selling products.
- **Tools**:
  - MySQL Workbench

## Key Insights

- **Top-Selling Products**:
  - Identified high-transaction coffee products to optimize inventory and promotions.
  - Example: Beverages with milk are more popular.
- **Revenue Trends**:
  - Highlighted seasonal and daily revenue peaks for targeted marketing.
  - Example: Revenue spiked during weekends and holidays.
- **Payment Preferences**:
  - Cash vs. card trends revealed customer preferences, aiding payment method optimization.
  - Example: Credit cards are used significantly more than cash.

## Usage Instructions

### 1. Setup

- Install MySQL (or a compatible database system).
- Import the SQL script provided to create and populate the database:
  ```bash
  mysql -u <username> -p < coffee_sales_analysis_in_sql.sql
  ```

### 2. Run Analytical Queries

- Execute the provided queries to derive insights:
  - Top-selling products.
  - Daily revenue trends.
  - Customer payment preferences.

### 3. Customize

- Modify or extend queries to align with specific business questions.

---

## Contact

For inquiries, please contact Luis Ladino at Luis@LuisLadino.com.
