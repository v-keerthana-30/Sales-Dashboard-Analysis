## 🛒 Superstore Sales Analysis (MySQL + Python + Power BI Project)

***

### 📌 Project Overview
This project performs a detailed analysis of Superstore sales data to uncover patterns in profits, customer behavior, and regional performance.
The dataset is imported into MySQL Workbench for structured querying and Python is used for visualization and analysis, and Power BI is used to build an interactive business dashboard for insight visualization.

***

### 🎯 Objectives
The main goals of this analysis are:

Understand overall sales and profit trends.

Identify high-performing and low-performing product categories.

Analyze customer segments and regional contributions.

Measure the impact of discounts on sales and profitability.

Provide insights to improve business strategies.

***

### 🧠 Analytical Sections & Sample Insights

1️⃣ Sales & Profit Analysis

Identify top-performing regions and states by profit.

Find the most profitable and least profitable product categories.

Analyze monthly and yearly sales growth trends.

2️⃣ Customer & Segment Insights

Determine which customer segment contributes most to total revenue.

Evaluate customer purchase frequency and order size.

Identify loyal or repeat customers based on order count.

3️⃣ Product & Category Insights

List top 10 best-selling products by quantity and revenue.

Identify items with high discount percentages but low profits.

Analyze the effect of shipping mode on delivery time and satisfaction.

4️⃣ Regional & Discount Impact

Compare performance across regions: East, West, Central, South.

Assess how discounts affect profitability.

Visualize profit margins with and without discount filters.

***

### ⚙️ Tools & Technologies

Database: MySQL Workbench

Programming Language: Python (Pandas, Matplotlib, Seaborn)

Dashboard Tool: Power BI

Query Language: SQL

Data Source: Superstore dataset (Kaggle)

***

### 🧾 How to Run the Project

1 Import Dataset

Open MySQL Workbench

Create a new database:

CREATE DATABASE superstore_analysis;

USE superstore_analysis;

Import the Superstore dataset CSV file into MySQL.

2 Run SQL Queries

Execute each file from the SQL_Queries folder to perform data analysis.

Queries cover sales, profit, and category insights.

3 Python Analysis

Open superstore_analysis.py or Jupyter notebook file.

Run the script to generate graphs and summary insights.

4 Power BI Dashboard

Open the Superstore_Sales_Dashboard.pbix file in Power BI Desktop.

Explore interactive visuals across 4 pages:

Sales Overview

Monthly Sales Trend

Sales vs Profit by Segment

Regional & Segment Analysis
