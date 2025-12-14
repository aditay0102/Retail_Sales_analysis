create Database sql_p1;
use sql_p1;

-- SQL Retail Sales Analysis - P1 
select * from  retail_sales;

-- check for null values
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
   
   -- q2 sales on '2022-11-05 
   select * from retail_sales;
   
   select * from retail_sales where sale_date  = '2022-11-05';
   
   select * from retail_sales where category = 'clothing' and quantiy >=  3 and sale_date  like ('%2022-11%');
   
   -- q3 total sales for eatch category
   
   select  category , sum(quantiy),
   count(*) as total_orders
   from retail_sales 
   group by category;
   
   -- q4 average age of beauty category customers
   select avg(age) from retail_sales 
   where category = 'Beauty';
    
-- q5 find all transactions where the total_sale is greater than 1000;

select * from retail_sales;
select * from retail_sales 
where total_sale > 1000; 

-- q6 total no of transactions made by each gender in each category



select category,
		gender,
		count(*) as total_trans
 from retail_sales
group by category, gender
order by category;

-- q7 avg sale of each month . find best selling month in year;  max sale month;
select * from retail_sales;

select * From 
(
select year(sale_date) Yearr ,  month(sale_date) as Monthh , avg(total_sale) as total_sale,
		Rank() over(Partition by year(sale_date) order by avg(total_sale) desc) as Ranking 
from retail_sales
group by Yearr, Monthh 
) as t1
where Ranking = 1;

-- q8  query to find the top 5 customers based on the higest total sales;
select * from retail_sales;

select customer_id, sum(total_sale) as total_sale from retail_sales
group by customer_id, total_sale
order by total_sale desc
limit 5;


-- q9 find the nubmer of unique customers who purchased items from each category;
select * from retail_sales;

select count(distinct customer_id ), category from retail_sales
group by category; 

-- q10  each shift and number of orders(Example Morning <= 12, Afternoon Because 12 & 17, evening > 17 ) 
select shift,count(*) from 
(
select *,	
	CASE 
		when hour(sale_time) < 12 then 'Morning'
        when hour(sale_time)  between 12 and 17  then 'Afternoon'
        else 'Evening'
	end as shift  
 from retail_sales
) t
group by shift;


