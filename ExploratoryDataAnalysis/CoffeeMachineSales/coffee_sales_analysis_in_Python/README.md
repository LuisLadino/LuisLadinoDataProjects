# Coffee Sales Analysis

## Project Overview

**Purpose**: This project performs an exploratory data analysis (EDA) of a coffee sales dataset to uncover insights and patterns.

**Objectives**:

- Analyze transaction patterns by date, payment method, and coffee types.
- Visualize trends in sales and customer preferences.
- Provide actionable insights for business decisions.

**Business Alignment**: The analysis offers a detailed understanding of sales trends and customer preferences, aiding businesses in optimizing inventory, marketing, and operations.

---

## Dataset Description

- **Source**: [Kaggle](https://www.kaggle.com/datasets/ihelon/coffee-sales)
- **Structure**:
  - **date**: Sale date.
  - **datetime**: Sale timestamp.
  - **cash_type**: Cash or card payment.
  - **card**: Card information.
  - **money**: Sales amount in currency.
  - **coffee_name**: Type of beverage (e.g., Latte, Espresso).

**Processing**:

- Converted `DateTime` to a standard datetime format.
- Handled missing values in the `Payment Method` column.
- Removed duplicate entries for clean analysis.

---

## Methodologies and Tools

- **Tools**: Python, pandas, seaborn, matplotlib.
- **Methodologies**:
  - Data Cleaning: Handling missing values, formatting dates, and deduplication.
  - Statistical Analysis: Exploring revenue trends and popular items.
  - Visualization: Visualizing sales trends and payment preferences.

---

## Key Insights

- **Transactions Over Time**: Sales peak during weekends and holidays.
- **Popular Coffee Types**: Coffees with milk are the top-selling products.
- **Payment Preferences**: Most customers prefer card payments.

These insights can guide promotional strategies, inventory planning, and operational improvements.

---

## Usage Instructions

1. Clone the repository and navigate to the project directory.
2. Install dependencies using `requirements.txt`:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the notebook using Jupyter:
   ```bash
   jupyter notebook coffee_sales_analysis_in_Python.ipynb
   ```

---

## File Structure

- **coffee_sales_analysis_in_Python.ipynb**: Main analysis notebook.
- **requirements.txt**: List of dependencies for easy setup.

---

## Contact

For questions or further details, contact the author at Luis@LuisLadino.
