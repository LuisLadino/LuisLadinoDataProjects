# Marketing Campaign Analysis: A/B Testing for Fast Food Restaurant Promotions

## Project Overview

**Purpose** This project evaluates the effectiveness of three different marketing promotions (Promotion 1, Promotion 2, and Promotion 3) for a fast-food restaurant chain. The primary objective is to recommend the most effective strategy to maximize sales.

### Business Alignment

This project supports business analytics by:

- Using statistical analysis to derive actionable insights from sales data.
- Providing evidence-based recommendations to improve marketing strategies.

---

## Dataset Description

- **Source**: [Kaggle](https://www.kaggle.com/code/chebotinaa/a-b-testing-of-fast-food-marketing-campaign)

- **Structure**:
  - **MarketSize**: Size of market.
  - **AgeOfStore**: Years since opening.
  - **Promotion**: Promotion type.
  - **week**: Duration of the promotion.
  - **SalesInThousands**: Sales amount in thousands.

**Processing**:

- **Cleaning**: Handling missing and duplicate entries.
- **Transformation**: Preparing data for statistical tests (e.g., ANOVA, Tukey’s HSD).
- **Inspection**: Initial descriptive statistics and visualizations.

---

## Methodologies and Tools

- **Tools**:

- **Python**: Data manipulation, statistical analysis, and visualization.
- **Libraries**:
  - `pandas`: Data preprocessing and manipulation.
  - `seaborn` & `matplotlib`: Visualization.
  - `scipy` & `statsmodels`: Statistical testing.

### Methods

- **One-Way ANOVA**: To test differences in means between the campaigns.
- **Tukey's HSD**: To identify significant differences between campaigns.
- **Chi-Square Test**: To examine categorical relationships.

---

## Key Insights

- Promotion 3 is the top-performing campaign with higher sales. -**ANOVA Results**:
  - Significant differences in sales between campaigns (**p-value < 0.05**).

### Actionable Insights

-**Focus on Promotion 1 and 3**:

- Allocate more resources to Promotion 1 and 3 as they significantly outperform Promotion 2.

---

## 5. Usage Instructions

### Setup

1. Clone the repository and navigate to the project directory.

2. Install dependencies using `requirements.txt`:

   ```bash
   pip install -r requirements.txt
   - Python 3.x

   ```

3. Run the notebook using Jupyter:
   ```bash
   jupyter notebook marketing_campaign_analysis.ipynb
   ```

---

## File Structure

- **marketing_campaign_analysis.ipynb**: Main analysis notebook.
- **requirements.txt**: List of dependencies for easy setup. -**WA_Marketing-Campaign.csv**: data file for analysis.

---

## Contact

For questions or further details, contact the author at Luis@LuisLadino.
