/* =============================================
  Author: <Sai Charan Pappala>
  Create Date:  <1/30/2023> 
  Name: Question 2:  Basic Aggregation statement with Criteria and Ordering
  Candidate Instructions:  
	Using a copy of the SQL from Question 1, modify to return the count of orders and total sales for 
	  customers that are not married, have an occupation of Management and were placed in 2013.  
		Include fields FullName (First + Last), EnglishOccupation ,EnglishEducation, DateFirstPurchase,  OrdersCount, TotalSales.
		Order by LastName, FirstName, TotalSales DESC.
 Solution Description: 
  Step 1: Analyzed all the tables using Database Diagrams and found that two tables 
  FactInternetSales and Dim Customer are required for the analysis 
  Step 2: Joined the  tables  Fact Internet Sales and DIM Customer using INNER JOIN on 
  CustomerKey field
  Step 3: Filtered the resulted table with the customers that are not married, 
  have an occupation of Management and were placed in 2013.
  Step 4:Grouped the fields FirstName, LastName, EnglishOccupation ,
  EnglishEducation, DateFirstPurchase to get the aggregated columns 
  Step 5: Selected the necessary Columns  FullName (First + Last), EnglishOccupation ,
  EnglishEducation, DateFirstPurchase from the joined tables and used aggregate functions 
  Count and Sum on the resulted table 
  Step 6: Ordered the records by LastName, FirstName, TotalSales Desc

============================================= */
USE AdventureWorksDW2017
GO


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
