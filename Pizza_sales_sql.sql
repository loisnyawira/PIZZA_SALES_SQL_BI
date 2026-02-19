SELECT *
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]

  --Total Revenue 
SELECT SUM ([total_price]) AS Total_Revenue
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]


 --Average Order Value 

 SELECT 
SUM (total_price)/ COUNT (DISTINCT [order_id]) AS Ave_Order_value
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]


--Total Pizzaz Sold
SELECT SUM ( [quantity]) AS Total_Pizzas_sold
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]


--Total Orders placed

SELECT COUNT (DISTINCT [order_id]) AS Total_Orders_placed
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]



--Average Pizzas per Order

 SELECT 
SUM (quantity)/ COUNT (DISTINCT [order_id]) AS Ave_Order_value
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]

  
  SELECT 
CAST (SUM (quantity) AS DECIMAL (10,2))/ CAST( COUNT (DISTINCT [order_id]) AS DECIMAL (10,2))AS Ave_Order_valuePERCENTAGE 
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
  

  --Daily Trend for Orders 
  SELECT * 
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]


    SELECT 
    DATENAME (DW, order_date) AS order_day
    FROM [Pizza DB].[dbo].[pizza_sales_excel_file]


  SELECT 
  DATENAME (DW, order_date) AS order_day ,
  COUNT (DISTINCT order_id ) AS Total_Orders 
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
  GROUP BY DATENAME (DW,order_date)

  --Monthly Trend for orders 

  SELECT 
  DATENAME (MONTH, order_date) AS order_month ,
  COUNT (DISTINCT order_id ) AS Total_Orders
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
  GROUP BY DATENAME (MONTH, order_date)
  ORDER BY Total_Orders DESC

  --Percentage of the sales by PIZZA category 

  SELECT 
  SUM ([total_price]) As Total_Sales ,
  [pizza_category]
  FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
 GROUP BY pizza_category

 SELECT 
   [pizza_category],
    SUM ([total_price]) As Total_Sales ,
   SUM ([total_price])*100/   (SELECT sum ([total_price]) from [Pizza DB].[dbo].[pizza_sales_excel_file]  WHERE  MONTH(order_date) = 1) AS Total_sales_percentage 
   FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
   WHERE  MONTH(order_date) = 1
   GROUP BY [pizza_category]

   select 
   DATENAME (MONTH,order_date)  as ORDER_month 
   from [Pizza DB].[dbo].[pizza_sales_excel_file]
 
 
-- Percentage of sales by the PIZZA size 

 SELECT 
   [pizza_size],
    SUM ([total_price]) As Total_Sales ,
   SUM ([total_price])*100/   (SELECT sum ([total_price]) from [Pizza DB].[dbo].[pizza_sales_excel_file] ) AS Total_sales_percentage 
   FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
   GROUP BY [pizza_size]
   
   finding_sales_by_pizza_size_for_the_1stquarter 

 SELECT 
   [pizza_size],
   CAST (SUM ([total_price]) AS DECIMAL (10,2)) As Total_Sales ,
   CAST( SUM ([total_price])*100/(SELECT sum ([total_price]) from [Pizza DB].[dbo].[pizza_sales_excel_file]) AS DECIMAL (10,2)) AS Total_sales_percentage 
   FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
   GROUP BY [pizza_size]
   ORDER BY Total_sales_percentage  DESC

   
 SELECT 
   [pizza_size],
   CAST (SUM ([total_price]) AS DECIMAL (10,2)) As Total_Sales ,
   CAST( SUM ([total_price])*100/(SELECT sum ([total_price]) from [Pizza DB].[dbo].[pizza_sales_excel_file] WHERE DATEPART (QUARTER ,order_date)=1) AS DECIMAL (10,2)) AS Total_sales_percentage 
   FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
   WHERE DATEPART (QUARTER, order_date) =1
   GROUP BY [pizza_size]
   ORDER BY Total_sales_percentage  DESC

   --Total 5 Best Sellers by Revenue,Total Quantity and Total Orders 

    --Total 5 Best Sellers by Revenue,

   SELECT TOP 5 
  [pizza_name],
  SUM ([total_price]) AS Total_revenue
   FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
   GROUP BY pizza_name
  order by Total_revenue DESC


     --Total 5 Best Sellers by Revenue
  SELECT TOP 5 
  [pizza_name],
  CAST (SUM ([total_price])AS DECIMAL (10,2)) AS Total_revenue
   FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
   GROUP BY pizza_name
  order by Total_revenue ASC

   --Total 5 Best Sellers by Total Quantity 

   SELECT TOP 5 
[pizza_name],
SUM ([quantity]) AS Total_quantity 
FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
GROUP BY pizza_name


   SELECT TOP 5 
[pizza_name],
SUM ([quantity]) AS Total_quantity 
FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
GROUP BY pizza_name
ORDER BY Total_quantity  DESC

--Total 5 LAST Sellers by Total Quantity 

  SELECT TOP 5 
[pizza_name],
SUM ([quantity]) AS Total_quantity 
FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
GROUP BY pizza_name
ORDER BY Total_quantity  asc

 --Total 5 Best Sellers by total orders 

 SELECT TOP 5 
[pizza_name],
COUNT (DISTINCT order_id) AS Total_orders
 FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
GROUP BY pizza_name
ORDER BY Total_orders DESC

 --Total 5 WORST Sellers by total orders 

 SELECT TOP 5 
[pizza_name],
COUNT (DISTINCT order_id) AS Total_orders
 FROM [Pizza DB].[dbo].[pizza_sales_excel_file]
GROUP BY pizza_name
ORDER BY Total_orders ASC