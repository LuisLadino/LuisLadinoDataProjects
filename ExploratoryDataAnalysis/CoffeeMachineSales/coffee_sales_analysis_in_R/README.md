# Coffee Machine Sales Analysis

## Project Overview

**Purpose:** The project analyzes coffee machine sales data to identify patterns, trends, and actionable insights, supporting strategic decision-making in inventory management, marketing, and sales optimization.

**Goals:**

- Explore sales patterns and seasonal trends.
- Analyze product performance by category.
- Provide actionable recommendations for maximizing revenue and customer satisfaction.

**Business Relevance:**
Highlighting critical sales drivers and offering data-backed suggestions, aligning with business goals in operations and marketing.

---

## Dataset Description

- **Source:** (https://www.kaggle.com/datasets/ihelon/coffee-sales)
- **Structure:**
  - Key columns: `datetime`, `coffee_name`, `money`, `cash_type`.
  - Contains both numeric and categorical variables.
- **Processing Steps:**
  - Evaluation of missing values
  - Converted `datetime` column for time-series analysis.

---

## Methodologies and Tools

**Analytical Methods:**

- Time-series analysis for sales trends.
- Summary statistics for product performance.
- Exploratory visualizations to identify key drivers.

**Tools & Libraries:**

- **Language:** R.
- **Libraries:**
  - `dplyr` for efficient data wrangling.
  - `ggplot2` for creating professional-grade visualizations.
  - `magrittr` for streamlined workflows.
  - `here` for reproducability.

---

## Key Insights

- **Seasonal Trends:** Sales peak during specific holidays, suggesting opportunities for targeted promotions.
- **Product Performance:** Coffee products with milk perform higher than coffee products without milk.
- **Actionable Recommendation:** Prioritize inventory for high-sales items during peak seasons; develop promotions for underperforming categories.

---

## Usage Instructions

1. **Prerequisites:**

   - R installed (version 4.0+ recommended).
   - Libraries: `dplyr`, `ggplot2`, `magrittr`, `here`.

2. **Steps to Run:**

   - Clone or download the project files.
   - Run the script using RStudio or an R interpreter.

3. **Output:**
   - Summary tables and visualizations are generated in the console and saved as PNG files in the output directory.

---

## Contact

For inquiries, please contact Luis Ladino at Luis@LuisLadino.com.
