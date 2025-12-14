# 🛒 SQL Retail Sales Analysis (Project P1)

## 📌 Project Overview

This project focuses on analyzing **retail sales data using SQL** to uncover meaningful business insights such as sales trends, customer behavior, and category performance.
It demonstrates practical SQL skills including **data cleaning, aggregation, filtering, window functions, and case logic**.

The project is suitable for **SQL beginners to intermediate learners** and can be showcased as part of a **data analyst portfolio**.

---

## 🗄️ Database Setup

```sql
CREATE DATABASE sql_p1;
USE sql_p1;
```

The analysis is performed on a table named:

```
retail_sales
```

---

## 📊 Dataset Columns

The dataset includes the following fields:

* `transactions_id`
* `sale_date`
* `sale_time`
* `customer_id`
* `gender`
* `age`
* `category`
* `quantiy`
* `price_per_unit`
* `cogs`
* `total_sale`

---

## 🔍 Data Exploration & Cleaning

### 1. View Dataset

```sql
SELECT * FROM retail_sales;
```

### 2. Check for NULL Values

```sql
SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
```

---

## 📈 Business Analysis Queries

### Q2. Sales on a Specific Date

```sql
SELECT * 
FROM retail_sales 
WHERE sale_date = '2022-11-05';
```

---

### Q3. Clothing Sales (Quantity ≥ 3) in November 2022

```sql
SELECT * 
FROM retail_sales 
WHERE category = 'clothing'
  AND quantiy >= 3
  AND sale_date LIKE '%2022-11%';
```

---

### Q4. Total Sales & Orders by Category

```sql
SELECT category,
       SUM(quantiy) AS total_quantity,
       COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;
```

---

### Q5. Average Age of Beauty Category Customers

```sql
SELECT AVG(age) 
FROM retail_sales
WHERE category = 'Beauty';
```

---

### Q6. High-Value Transactions (Total Sale > 1000)

```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```

---

### Q7. Transactions by Gender and Category

```sql
SELECT category,
       gender,
       COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY category;
```

---

### Q8. Best Selling Month (Per Year)

```sql
SELECT *
FROM (
    SELECT YEAR(sale_date) AS Yearr,
           MONTH(sale_date) AS Monthh,
           AVG(total_sale) AS avg_sale,
           RANK() OVER (
               PARTITION BY YEAR(sale_date)
               ORDER BY AVG(total_sale) DESC
           ) AS Ranking
    FROM retail_sales
    GROUP BY Yearr, Monthh
) t1
WHERE Ranking = 1;
```

---

### Q9. Top 5 Customers by Total Sales

```sql
SELECT customer_id,
       SUM(total_sale) AS total_sale
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5;
```

---

### Q10. Unique Customers per Category

```sql
SELECT category,
       COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
```

---

### Q11. Orders by Shift (Morning / Afternoon / Evening)

```sql
SELECT shift,
       COUNT(*) AS total_orders
FROM (
    SELECT *,
           CASE
               WHEN HOUR(sale_time) < 12 THEN 'Morning'
               WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
               ELSE 'Evening'
           END AS shift
    FROM retail_sales
) t
GROUP BY shift;
```

---

## 🛠️ Skills Demonstrated

* SQL Database Creation
* Data Cleaning & Validation
* Aggregate Functions (`SUM`, `AVG`, `COUNT`)
* Filtering with `WHERE`
* Grouping & Sorting
* Window Functions (`RANK() OVER`)
* Case Statements
* Business-Oriented Data Analysis

---

## 🚀 How to Use

1. Clone the repository
2. Import the dataset into your SQL environment
3. Run the queries sequentially
4. Modify queries to explore additional insights

---

## 📌 Future Enhancements

* Add visualizations using Power BI / Tableau
* Optimize queries using indexes
* Create stored procedures and views
* Perform customer segmentation analysis

---

** Aditya Thakur **
Aspiring Data Analyst | SQL | Data Analytics

---

