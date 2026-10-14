```sql
-- E-commerce Sales Analysis
-- Dataset: 180 synthetic order records
-- Completed-sales analysis uses Delivered orders.

 1. Check total records
SELECT COUNT(*) AS total_rows
FROM sales_data;

-- 2. Revenue and delivered orders
SELECT
    ROUND(SUM(SalesAmount), 2) AS TotalRevenue,
    COUNT(*) AS DeliveredOrders
FROM sales_data
WHERE OrderStatus = 'Delivered';

 3. Order status distribution
SELECT
    OrderStatus,
    COUNT(*) AS OrderCount
FROM sales_data
GROUP BY OrderStatus
ORDER BY OrderCount DESC;

 4. Monthly revenue
SELECT
    SUBSTR(OrderDate, 1, 7) AS SalesMonth,
    ROUND(SUM(SalesAmount), 2) AS MonthlyRevenue
FROM sales_data
WHERE OrderStatus = 'Delivered'
GROUP BY SUBSTR(OrderDate, 1, 7)
ORDER BY SalesMonth;

 5. Top five products by revenue
SELECT
    Product,
    SUM(Quantity) AS UnitsSold,
    ROUND(SUM(SalesAmount), 2) AS TotalRevenue
FROM sales_data
WHERE OrderStatus = 'Delivered'
GROUP BY Product
ORDER BY TotalRevenue DESC
LIMIT 5;

-- 6. Revenue by region
SELECT
    Region,
    COUNT(*) AS DeliveredOrders,
    SUM(Quantity) AS UnitsSold,
    ROUND(SUM(SalesAmount), 2) AS TotalRevenue
FROM sales_data
WHERE OrderStatus = 'Delivered'
GROUP BY Region
ORDER BY TotalRevenue DESC;

-- 7. Revenue by category
SELECT
    Category,
    COUNT(*) AS DeliveredOrders,
    SUM(Quantity) AS UnitsSold,
    ROUND(SUM(SalesAmount), 2) AS TotalRevenue
FROM sales_data
WHERE OrderStatus = 'Delivered'
GROUP BY Category
ORDER BY TotalRevenue DESC;
```
