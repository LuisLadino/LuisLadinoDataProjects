# Marketing Campaign Analysis: A/B Testing for Fast Food Restaurant Promotions

## Project Overview

**Purpose** The primary goal is to identify factors that lead to customers leaving the bank and to develop a predictive model that can accurately flag at-risk customers. The insights from this analysis can be used to inform targeted retention strategies and improve customer satisfaction, aligning the project with core business analytics needs.

### Business Alignment

This project supports business analytics by:

- Addressing a critical business problem: customer churn. By predicting which customers are at risk of leaving, the business can take proactive, data-driven actions to improve customer retention, which is often more cost-effective than acquiring new customers.

---

## Dataset Description

- **Source**: [Kaggle](https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn)

- **Structure**:
  - The dataset contains 10,000 rows and 18 columns, including customer demographics, financial details, and engagement metrics. Key fields include: `CreditScore`, `Geography`, `Gender`, `Age`, `Tenure`, `Balance`, `NumOfProducts`, `HasCrCard`, `IsActiveMember`, `EstimatedSalary`, `Exited`, `Complain`, `Satisfaction Score`, `Card Type`, and `Point Earned`.

**Processing**:

- Initial data cleaning involved dropping irrelevant columns such as `RowNumber`, `Surname`, and `CustomerId`. A check for missing values and duplicates was performed, and none were found. Data types were then converted for better analysis, for example, changing categorical variables to the `category` type and binary columns to the `bool` type.

---

## Methodologies and Tools

- **Tools**:

- **Python**: Data manipulation, statistical analysis, and visualization.
- **Libraries**:
  - `pandas`: Data preprocessing and manipulation.
  - `seaborn` & `matplotlib`: Visualization.
  - `scipy` & `statsmodels`: Statistical testing.

### Methods

This project employs a data science workflow using the following tools and methods:

- **Python**: The core language for the entire analysis.
- **Pandas**: Used for data manipulation, cleaning, and initial exploration.
- **Numpy**: Utilized for numerical computing and array operations.
- **Matplotlib & Seaborn**: Employed for data visualization to understand distributions and relationships between variables.
- **Scikit-learn**: The primary library for machine learning tasks, specifically used for splitting the data and building a classification model.
- **Random Forest Classifier**: A machine learning algorithm used to predict customer churn (`Exited`).
- **Classification Report & Confusion Matrix**: Used to evaluate the performance of the predictive model.

---

## Key Insights

- Customers that complain are likely to churn.

### Actionable Insights

1. **Customer Retention**:
   - Focus on customers with low satisfaction scores and high tenure.
   - Use feedback from complaints to improve service quality.
2. **Retention Focus**:
   - Analyze churn drivers (e.g., satisfaction, tenure, geography) to prevent future customer loss.

---

## 5. Usage Instructions

To replicate and run this project, follow these steps:

1.  **Clone the Repository**: Clone or download the project files to your local machine.
2.  **Set up the Environment**: Create a virtual environment and install the required dependencies using the `requirements.txt` file.
3.  **Run the Notebook**: Open and run the `Updated_Customer_Churn_Analysis.ipynb` file in a Jupyter environment. The notebook is structured to be run sequentially from top to bottom.
4.  **Dataset**: Ensure the `Customer-Churn-Records.csv` file is located in the same directory as the notebook.

---

## Contact

For questions or further details, contact the author at Luis@LuisLadino.

---
