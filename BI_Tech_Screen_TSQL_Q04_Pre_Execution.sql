/* =============================================
  Author: <Sai Charan Pappala>
  Create Date:  <1/30/2023> 
  Name: Question 4:  Query Analysis and Covering Index
  Candidate Instructions: 
    Based on the SQL created from Question 2, analyze the plans and add the appropriate covering indexes.  This includes the following steps:
		Execute existing query and save the pre-update execution plan and messages.
		Create/execute needed indexes.
		Execute optimized query and save the post-update execution plan and messages.
 Solution Description:
 Step 1: Ran the T-SQL Query and saved the execution Plan 

============================================= */

USE [AdventureWorksDW2017]
GO

SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
(c.FirstName + ' ' + c.LastName) as FullName,
 c.EnglishOccupation,
 c.EnglishEducation,
 c.DateFirstPurchase,
 COUNT(s.SalesOrderNumber) AS OrdersCount,
 SUM (s.SalesAmount) AS TotalSales

FROM 
    FactInternetSales s
    JOIN DimCustomer c ON s.CustomerKey = c.CustomerKey
WHERE 
    c.MaritalStatus != 'M' 
    AND c.EnglishOccupation = 'MANAGEMENT'
    AND s.OrderDate >= '2013-01-01' 
    AND s.OrderDate < '2014-01-01'
GROUP BY
    c.FirstName,
    c.LastName,
    c.EnglishOccupation,
    c.EnglishEducation,
	c.DateFirstPurchase
ORDER BY 
    c.LastName,
    c.FirstName,
    TotalSales DESC

SET STATISTICS IO OFF
