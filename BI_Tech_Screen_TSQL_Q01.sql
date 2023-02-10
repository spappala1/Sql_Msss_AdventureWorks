/* =============================================
  Author: <Sai Charan Pappala>
  Create Date:  <1/30/2023> 
  Name: Question 1:  Basic SELECT statement with Concatenation, Criteria and Ordering
  Candidate Instructions:  
	Return the orders for customers that are married, have an occupation of Professional and were placed in December 2013.  
	  Include fields FullName (First + Middle + Last), EnglishOccupation ,EnglishEducation, DateFirstPurchase, SalesOrderNumber, 
			OrderDate, ProductAlternateKey,EnglishProductName, StandardCost, ListPrice, DealerPrice and SalesAmount.
	  Order by LastName, FirstName, EnglishProductName.
  Solution Description:
  Step 1: Analyzed all the tables using Database Diagrams and found that three tables such 
  as  FactInternetSales, DimProduct and DimCustomer are required for the analysis 
  Step 2: Joined the tables FactInternetsales and DimProduct using INNER JOIN on ProductKey field and 
  joined the resultant table with DimCustomer on CustomerKey field
  Step 3: Filtered the records with customers that are married, have an 
  occupation of Professional and were placed in December 2013 
  Step 4: Selected the necessary fields FullName (First + Middle + Last), 
  EnglishOccupation ,EnglishEducation, DateFirstPurchase, SalesOrderNumber, /
  OrderDate, ProductAlternateKey,EnglishProductName, StandardCost, ListPrice, 
  DealerPrice and SalesAmount from the joined tables
  Step 5 : Finally, Ordered the records by LastName, FirstName, EnglishProductName.


============================================= */
USE AdventureWorksDW2017
GO

SELECT 
    (c.FirstName + ' ' + c.LastName) as FullName,
    c.EnglishOccupation,
    c.EnglishEducation,
    c.DateFirstPurchase,
    s.SalesOrderNumber,
    s.OrderDate,
    p.ProductAlternateKey,
    p.EnglishProductName,
    p.StandardCost,
    p.ListPrice,
    p.DealerPrice,
    s.SalesAmount
FROM 
    FactInternetSales s
    JOIN DimProduct p ON s.ProductKey = p.ProductKey
    JOIN DimCustomer c ON s.CustomerKey = c.CustomerKey
WHERE 
    c.MaritalStatus = 'M' 
    AND c.EnglishOccupation = 'Professional'
    AND s.OrderDate >= '2013-12-01' 
    AND s.OrderDate < '2014-01-01'
ORDER BY 
    c.LastName,
    c.FirstName,
    p.EnglishProductName
