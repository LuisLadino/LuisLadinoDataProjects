# =====================================================
# R version: 4.2.2
# Required Packages: dplyr (1.1.2), ggplot2 (3.4.0), magrittr (2.0.3), here (1.0.1)
# =====================================================

# ================================================
# Libraries and Dependencies
# ================================================

# Load required libraries
library(dplyr)      # Data manipulation
library(ggplot2)    # Data visualization
library(magrittr)   # Pipe operations
library(here)       # Relative paths

# Set working directory for relative paths
setwd(here())

# ================================================
# Functions for modular tasks
# ================================================

# Function to check for missing values in the dataset
check_missing_values <- function(data) {
  missing_summary <- colSums(is.na(data))
  print("Missing values by column:")
  print(missing_summary)
  return(missing_summary)
}

# Function to calculate summary statistics for numeric columns
calculate_summary_statistics <- function(data) {
  print("Summary statistics for numeric columns:")
  summary(data)
}

# Function to save visualizations to the output directory
save_plot <- function(plot, filename) {
  # Create the "output" directory if it doesn't exist
  output_dir <- "output"
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  # Construct the full file path
  full_filename <- file.path(output_dir, filename)
  ggsave(full_filename, plot = plot, width = 8, height = 6)
  print(paste("Plot saved as", full_filename))
}

# ================================================
# Data Loading
# ================================================

# Load dataset
file_path <- here("coffee_sales_index.csv")
if (!file.exists(file_path)) {
  stop("Dataset file not found! Please check the file path.")
}

coffee_sales_data <- read.csv(file_path)

# ================================================
# Data Inspection
# ================================================

# Inspect data structure and initial checks
print("Dataset structure:")
str(coffee_sales_data)

# Check for missing values
missing_values <- check_missing_values(coffee_sales_data)

# Summary statistics
calculate_summary_statistics(coffee_sales_data)

# ================================================
# Data Cleaning
# ================================================

# Convert datetime column to proper format for time-series analysis
if ("datetime" %in% colnames(coffee_sales_data)) {
  coffee_sales_data$sale_datetime <- as.POSIXct(coffee_sales_data$datetime, format = "%Y-%m-%d %H:%M:%S")
} else {
  stop("Column 'datetime' is missing in the dataset!")
}

# ================================================
# Visualizations
# ================================================

# Sales Trends Over Time
sales_trend_plot <- ggplot(coffee_sales_data, aes(x = sale_datetime, y = money)) +
  geom_line(color = "blue", linewidth = 0.7) +
  geom_smooth(method = "loess", color = "orange", linetype = "dashed") +
  labs(
    title = "Daily Sales Trends",
    x = "Date",
    y = "Units Sold",
    caption = "Dashed line shows smoothed sales trend."
  ) +
  theme_dark() +
  theme(plot.title = element_text(hjust = 0.5))

save_plot(sales_trend_plot, "sales_trend_plot.png")

# Total Revenue by Product Type
sales_by_product <- coffee_sales_data %>%
  group_by(coffee_name) %>%
  summarise(total_sales = sum(money, na.rm = TRUE)) %>%
  arrange(desc(total_sales))

print("Total Revenue by product type:")
print(sales_by_product)

product_sales_plot <- ggplot(sales_by_product, aes(x = reorder(coffee_name, -total_sales), y = total_sales)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = round(total_sales, 0)), vjust = -0.5, size = 3, color = "white") +
  labs(
    title = "Total Sales by Product Type",
    x = "Product Type",
    y = "Total Revenue",
    caption = "Data sorted by sales volume."
  ) +
  theme_dark() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(hjust = 0.5))

save_plot(product_sales_plot, "product_sales_plot.png")

# Monthly Sales Trend
monthly_sales <- coffee_sales_data %>%
  mutate(month = format(sale_datetime, "%Y-%m")) %>%
  group_by(month) %>%
  summarise(total_sales = sum(money, na.rm = TRUE))

monthly_sales_plot <- ggplot(monthly_sales, aes(x = month, y = total_sales, fill = total_sales)) +
  geom_bar(stat = "identity") +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  labs(
    title = "Monthly Sales Trend",
    x = "Month",
    y = "Total Revenue",
    caption = "Bar color intensity indicates sales volume."
  ) +
  theme_dark() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(hjust = 0.5))

save_plot(monthly_sales_plot, "monthly_sales_plot.png")

# Output results to console
print("Analysis complete. Visualizations saved to output directory.")
