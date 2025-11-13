

/***********************************************************************************
******************************
NAME:  Adventure Works
PURPOSE:  Create Answers..
MODIFICATION LOG:
Ver Date Author Description
01 11/12/25- Kelvin Decker Wrote this script for Adventureworks project
-------------------------------------------------------------------------------
1.0 05/23/2022 JJAUSSI 1. Built this script for EC IT43
RUNTIME:
Xm Xs
NOTES:
I am writing this query to answer students questions based on the adventurworks project ...
***********************************************************************************
*******************************/
/*
AdventureWorks SQL Script
Containing Questions from Multiple Students with Solutions
*/

-- =============================================
-- QUESTION 1: Kelvin Decker
-- Business User question: We're running low on warehouse space in our main facility. 
-- Which products have been sitting in inventory for the longest without any sales? 
-- Let's consider clearance pricing for these slow-movers
-- =============================================

SELECT TOP 10
    p.ProductID,
    p.Name AS ProductName,
    p.ProductNumber,
    pi.Quantity AS CurrentStock,
    MAX(soh.OrderDate) AS LastSoldDate,
    DATEDIFF(DAY, MAX(COALESCE(soh.OrderDate, '2011-01-01')), GETDATE()) AS DaysSinceLastSale,
    p.ListPrice,
    p.StandardCost
FROM Production.Product p
INNER JOIN Production.ProductInventory pi ON p.ProductID = pi.ProductID
LEFT JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
LEFT JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE p.FinishedGoodsFlag = 1  -- Only finished goods, not raw materials
GROUP BY p.ProductID, p.Name, p.ProductNumber, pi.Quantity, p.ListPrice, p.StandardCost
HAVING MAX(soh.OrderDate) IS NULL OR MAX(soh.OrderDate) < DATEADD(MONTH, -6, GETDATE())
ORDER BY DaysSinceLastSale DESC, CurrentStock DESC;

-- =============================================
-- QUESTION 2: Kelvin Decker
-- Business User question: I need to calculate quarterly sales commissions. 
-- Can you show me each salesperson's total sales for last quarter, broken down by product category?
-- =============================================

SELECT 
    p.FirstName + ' ' + p.LastName AS Salesperson,
    pc.Name AS ProductCategory,
    SUM(sod.LineTotal) AS CategorySales,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders,
    SUM(sod.OrderQty) AS TotalUnitsSold
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
INNER JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
INNER JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product prod ON sod.ProductID = prod.ProductID
INNER JOIN Production.ProductSubcategory psc ON prod.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE soh.OrderDate >= '2013-10-01' AND soh.OrderDate < '2014-01-01'  -- Q4 2013
GROUP BY p.FirstName, p.LastName, pc.Name
ORDER BY Salesperson, CategorySales DESC;

-- =============================================
-- QUESTION 3: Jesse Ryan Kroeger
-- Business User question—Marginal complexity: 
-- How many employees currently work here?
-- =============================================

SELECT 
    COUNT(*) AS TotalCurrentEmployees
FROM HumanResources.Employee
WHERE CurrentFlag = 1;  -- CurrentFlag = 1 indicates currently employed

-- =============================================
-- QUESTION 4: Jesse Ryan Kroeger
-- Business User question—Moderate complexity: 
-- I want to reward the salesman's hard work. Which salesman achieved the highest total sales this year?
-- =============================================

SELECT TOP 1
    p.FirstName + ' ' + p.LastName AS TopSalesperson,
    SUM(soh.TotalDue) AS TotalSales,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders,
    AVG(soh.TotalDue) AS AverageOrderValue
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
INNER JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
WHERE YEAR(soh.OrderDate) = 2014
    AND soh.OnlineOrderFlag = 0  -- Exclude online orders, only salesperson orders
GROUP BY p.FirstName, p.LastName
ORDER BY TotalSales DESC;

-- =============================================
-- QUESTION 5: Jesse Ryan Kroeger
-- Business User question—Moderate complexity: 
-- I want to check if we need to adjust our prices. What is the average list price of products that have been sold?
-- =============================================

SELECT 
    AVG(p.ListPrice) AS AverageListPriceOfSoldProducts,
    MIN(p.ListPrice) AS MinimumListPriceOfSoldProducts,
    MAX(p.ListPrice) AS MaximumListPriceOfSoldProducts,
    COUNT(DISTINCT p.ProductID) AS NumberOfUniqueProductsSold
FROM Production.Product p
INNER JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE p.ListPrice > 0;  -- Exclude products with no list price

-- =============================================
-- QUESTION 6: Jesse Ryan Kroeger
-- Business User question—Increased complexity: 
-- I want to reward the sales territory that brought in the most revenue. 
-- Which sales territory generated the most revenue in the last fiscal year?
-- =============================================

SELECT TOP 1
    st.Name AS SalesTerritory,
    st.CountryRegionCode,
    SUM(soh.TotalDue) AS TotalRevenue,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders,
    COUNT(DISTINCT soh.CustomerID) AS UniqueCustomers
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
WHERE YEAR(soh.OrderDate) = 2014  -- Using 2014 as the last fiscal year
GROUP BY st.Name, st.CountryRegionCode
ORDER BY TotalRevenue DESC;

-- =============================================
-- QUESTION 7: Galvin Lolo
-- Business User question—Increased complexity: 
-- We want to give a discount to customers that are loyal to our company. 
-- Which customer placed the highest number of orders over the past three years?
-- =============================================

SELECT TOP 5
    p.FirstName + ' ' + p.LastName AS CustomerName,
    COUNT(DISTINCT soh.SalesOrderID) AS TotalOrders,
    SUM(soh.TotalDue) AS TotalSpent,
    MIN(soh.OrderDate) AS FirstOrderDate,
    MAX(soh.OrderDate) AS MostRecentOrder
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE soh.OrderDate >= DATEADD(YEAR, -3, '2014-12-31')  -- Last 3 years from end of 2014
GROUP BY p.FirstName, p.LastName
ORDER BY TotalOrders DESC, TotalSpent DESC;

-- =============================================
-- QUESTION 8: Galvin Lolo
-- Business User question—Marginal complexity: 
-- What is the list price of the product named Road-150 Red, 62?
-- =============================================

SELECT 
    ProductID,
    Name AS ProductName,
    ProductNumber,
    ListPrice,
    Color,
    Size
FROM Production.Product
WHERE Name = 'Road-150 Red, 62';

