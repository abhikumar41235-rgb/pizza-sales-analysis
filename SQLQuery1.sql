 select * from pizza_sales

-- ## KPI's ##

-- 1. Total Revenue(kul kamai)

SELECT SUM (total_price) as Total_revenue
FROM  pizza_sales;

-- 2. Average order value(Har order ka avg kharcha)

SELECT SUM (total_price) / COUNT (DISTINCT order_id) AS Avg_order_value
FROM pizza_sales; 

-- 3. Total pizza sold (kul kitne pizza bike )

SELECT SUM (quantity) AS total_pizza_sold
FROM pizza_sales;

-- 4. Total orders(kul kitne orders aaye ) 

SELECT COUNT (DISTINCT order_id) AS total_orders
FROM pizza_sales;

-- 5. Average pizzas per order (Har order me avg kitne pizza the )

SELECT CAST (SUM(quantity) AS DECIMAL(10,2)) /
       CAST (COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Avg_pizzas_per_order
FROM pizza_sales;

-- 6. Daily Trend for total orders 

SELECT 
      DATENAME(DW, order_date) AS order_day,
      COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

-- 7. Hourly Trend for total orders
SELECT
      DATEPART(HOUR, order_time) AS order_hours,
      COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales 
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR, order_time);


-- 8. Percantage of sales by pizza category

SELECT * FROM pizza_sales
         
SELECT pizza_category,
         SUM(total_price) AS Total_sales,
         SUM(total_price)*100/
         (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date)=1) AS PCT
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category;

-- 9. Percentage  of sales by pizza size

SELECT * FROM pizza_sales
         
SELECT pizza_size,
         SUM(total_price) AS Total_sales,
         SUM(total_price)*100/
         (SELECT SUM(total_price) FROM pizza_sales ) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC

-- 10. Total pizzas sold by pizza category

SELECT
      pizza_category,
      SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_pizzas_sold DESC;

-- 11. Top 5 best sellers by total pizzas sold

SELECT TOP 5
      pizza_name,
      SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizzas_sold DESC

-- 12. Bottom 5 worst seller by total pizzas sold

SELECT TOP 5
      pizza_name,
      SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizzas_sold ASC




    
     

