1. Create Database
CREATE DATABASE sales_analysis;
USE sales_analysis;

2. Create the table
CREATE TABLE superstore_sales (
    Row_ID INT,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

3. Import data
LOAD DATA INFILE '/path/to/superstore.csv'
INTO TABLE superstore_sales
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

4. Data Cleaning
4.1 Duplicate values check
SELECT Order_ID, COUNT(*) 
FROM superstore_sales
GROUP BY Order_ID, Product_ID
HAVING COUNT(*) > 1;

if duplicates exist,
DELETE s1 FROM superstore_sales s1
JOIN superstore_sales s2 
ON s1.Order_ID = s2.Order_ID AND s1.Product_ID = s2.Product_ID
WHERE s1.Row_ID > s2.Row_ID;

4.2 Null values or missing values check
SELECT 
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Null_Category
FROM superstore_sales;

if exist, 
UPDATE superstore_sales SET Profit = 0 WHERE Profit IS NULL;
UPDATE superstore_sales SET Sales = 0 WHERE Sales IS NULL;

4.3 Format dates properly
UPDATE superstore_sales
SET Order_Date = STR_TO_DATE(Order_Date, '%Y-%m-%d'),
    Ship_Date = STR_TO_DATE(Ship_Date, '%Y-%m-%d');

5. SQL Analysis Queries
5.1 Total Sales, Profit, Quantity
SELECT 
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM superstore_sales;

5.2 Sales by Category
SELECT 
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

5.3 Top 10 Products by Profit
SELECT 
    Product_Name,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore_sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;

5.4 Monthly Sales Trend (for visualization)
SELECT 
    CONCAT(Order_Year, '-', LPAD(Order_Month,2,'0')) AS YearMonth,
    ROUND(SUM(Sales),2) AS Monthly_Sales
FROM superstore_sales
GROUP BY YearMonth
ORDER BY YearMonth;

5.5 Sales by Region and Segment
SELECT 
    Region,
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore_sales
GROUP BY Region, Segment
ORDER BY Region;

5.6 Most Profitable Regions
SELECT 
    Region,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore_sales
GROUP BY Region
ORDER BY Total_Profit DESC;

5.7 Discount Impact on Profit
SELECT 
    ROUND(AVG(Discount),2) AS Avg_Discount,
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM superstore_sales;

5.8 Customer Segmentation by Sales
SELECT 
    Segment,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore_sales
GROUP BY Segment
ORDER BY Total_Sales DESC;

