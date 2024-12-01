SELECT * FROM ecomerce.orders;
-- 1.Total Number of Orders and Amount Spent for Each City:
SELECT City, COUNT(*) AS Total_Orders, SUM(Total) AS Total_Amount
FROM orders
GROUP BY City;

-- 2.Average Order Amount for Each State. 
SELECT State, AVG(Total) AS Average_Amount
FROM orders
GROUP BY State;

-- 3.Count of Orders with isCOD True and False:
SELECT isCOD, COUNT(*) AS Order_Count
FROM orders
GROUP BY isCOD;

-- 4.Maximum and Minimum Total Amount of Orders for Each City
SELECT City, MAX(Total) AS Max_Amount, MIN(Total) AS Min_Amount
FROM orders
GROUP BY City;

-- 5.Orders with Total Greater Than the Average Order Amount:
SELECT Name, Total
FROM orders
WHERE Total > (SELECT AVG(Total) FROM orders);

-- 6.Find the top 3 highest total amounts.
SELECT ID,total
FROM orders 
ORDER BY total DESC
limit 3;

-- 7.List all unique states where orders have been placed.
SELECT DISTINCT state
FROM orders;

-- 8.Calculate the total number of orders and the average total amount for each IVR type.
SELECT IVR, count(*) as total_orders,avg(total) as total_average
FROM orders
GROUP BY IVR;

-- 9.Extract the year and month from the Date Placed and count the number of orders for each month. 
SELECT `date placed` as year,`date placed` as month,count(*) as order_count
from orders
group by year
order by month;

-- 10.Concatenate the Name and City columns to create a new column Customer_Details in the result. 
SELECT ID, CONCAT(Name, ' - ', City) AS Customer_Details
FROM orders;

-- 11.Find the orders with a Total amount between $500 and $1000 and order them by Date Placed.
SELECT ID,name,total,`date placed`
FROM orders
where total BETWEEN 500 AND 1000
order BY `date placed`;

-- 12.Calculate the percentage of orders that are COD (Cash on Delivery) versus non-COD orders.
SELECT 
    (SUM(CASE WHEN isCOD = TRUE THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS COD_Percentage,
    (SUM(CASE WHEN isCOD = FALSE THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Non_COD_Percentage
FROM orders;

SELECT * from `orders`;

-- 13.Write an SQL query to retrieve a detailed view of all orders.
SELECT o.ID, o.Name, o.City, o.State, o.Address, o.isCOD, o.`Date Placed`, o.Status, o.IVR, o.Remarks, o.Total, o.`Date Delivered`, o.`Date Returned`,
       c.PID, c.Category, c.Quantity, c.`Product Name`
FROM orders o
INNER JOIN `orderscleaned (2)` c ON o.ID = c.ID;

-- 14.Find the cities where the total Total amount of orders exceeds 1000 from the orders table.
SELECT City, SUM(Total) AS TotalAmount
FROM `orderscleaned (2)`
GROUP BY City
HAVING SUM(Total) > 1000;

-- 15.Find all orders where the Address contains the word "Road" from the orders table.
SELECT ID, Name, Address
FROM `orderscleaned (2)`
WHERE Address LIKE '%Road%';

-- 16.List all orders placed after January 31, 2021, from the orders table.
SELECT ID, Name, `Date Placed`
FROM `orderscleaned (2)`
WHERE `Date Placed` > '2021-01-31';
















