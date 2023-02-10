/* =============================================
  Author: <Sai Charan Pappala>
  Create Date:  <1/30/2023> 
  Name:  Question 3:  SELECT statement with Concatenation, Functions, Criteria and Ordering
  Candidate Instructions:  
     Using a copy of the SQL from Question 1, modify to return the orders, with a new field (see below),
	  for customers with English Occupation of Skilled Manual and were placed in 2012.
	    Include fields FullName (First + Last), EnglishOccupation ,EnglishEducation, DateFirstPurchase, SalesOrderNumber,
			OrderDate, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, DealerPrice and SalesAmount.
	    Add new field NewSalesOrderKey, after SalesOrderNumber, which is created based on the following:
			Modify the Sales Order Number by removing the SO prefix and replace it with the Order Date. 
			Append the Sales Order Line Number to the end of the string, prefixed with a "."
			Convert the entire value to a float data type.
	    Order by LastName, FirstName, NewSalesOrderKey
 Solution Description: 
  Step 1: Analyzed all the tables using Database Diagrams and found that three tables 
  such as FactInternetSales, DimProduct and DimCustomer are required for the analysis 
  Step 2: Joined the tables FactInternetsales and DimProduct using INNER JOIN on ProductKey field and 
  joined the resultant table with DimCustomer on CustomerKey field
  Step 3: Filtered the records with customers that have an 
  occupation of Skilled Manual and were placed in 2012
  Step 4: Selected the necessary Columns FullName (First + Last), EnglishOccupation ,
  EnglishEducation, DateFirstPurchase, SalesOrderNumber, OrderDate, 
  ProductAlternateKey,  EnglishProductName, StandardCost, ListPrice, DealerPrice 
  and SalesAmount from the joined tables
  Step 5: Added new field NewSalesOrderKey by removing the SO prefix and replace it with 
  the Order Date and appended the Sales Order Line Number to the end of the string, 
  prefixed with a "." using Cast and Replace functions and converted the entire value to a float data type.
  Step 6: Finally, Ordered the records by LastName, FirstName, NewSalesOrderKey


============================================= */
USE AdventureWorksDW2017
GO

SELECT 
    (c.FirstName + ' ' + c.LastName) as FullName,
    c.EnglishOccupation,
    c.EnglishEducation,
    c.DateFirstPurchase,
    s.SalesOrderNumber,
    CAST(REPLACE(s.SalesOrderNumber,'SO',CONVERT(varchar(10),s.OrderDate,112)) +'.' 
    +CAST(S.SalesOrderLineNumber AS nvarchar) AS float) AS NewSalesOrderKey,
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
    c.EnglishOccupation = 'Skilled Manual'
    AND s.OrderDate >= '2012-01-01' 
    AND s.OrderDate < '2013-01-01'
ORDER BY 
    c.LastName,
    c.FirstName,
    NewSalesOrderKey
