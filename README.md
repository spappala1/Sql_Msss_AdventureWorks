# Sql_Msss_AdventureWorks

Go through Hylaine-Step 1 Powerpoint in the files, download the file and follow the instructions and solve the below Questions 
 

Question W1:  Define Primary Key, Foreign Key and Unique Key.
•	Primary Key:
•	Foreign Key:
•	Unique Key:


Question W2:  Define a CTE and how you would use it.



Question W3:  How can you enforce use of a particular index?


Question W4:  What are the best reasons for using a stored procedures instead of direct T-SQL?


Question W5:  What are the steps you would take to improve the performance of a poor performing query?



Question T1:  Basic SELECT statement with Concatenation, Criteria and Ordering
	Return the orders for customers that are married, have an occupation of Professional and were placed in December 2013.
	Include fields FullName (First + Last), EnglishOccupation ,EnglishEducation, DateFirstPurchase, SalesOrderNumber, OrderDate, ProductAlternateKey,EnglishProductName, StandardCost, ListPrice, DealerPrice and SalesAmount.
	Order by LastName, FirstName, EnglishProductName.



Question T2:  Basic Aggregation statement with Criteria and Ordering
	Using a copy of the SQL from Question 1, modify to return the count of orders and total sales for  customers that are not married, have an occupation of Management and were placed in 2013.
	Include fields FullName (First + Last), EnglishOccupation ,EnglishEducation, DateFirstPurchase,  OrdersCount, TotalSales.
	Order by LastName, FirstName, TotalSales DESC.



Question T3:  SELECT statement with Concatenation, Functions, Criteria and Ordering
	Using a copy of the SQL from Question 1, modify to return the orders, with a new field (see below), for customers with English Occupation of Skilled Manual and were placed in 2012.
	Include fields FullName (First + Last), EnglishOccupation ,EnglishEducation, DateFirstPurchase, SalesOrderNumber, OrderDate, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, DealerPrice and SalesAmount.
	Add new field NewSalesOrderKey, after SalesOrderNumber, which is created based on the following:
	Modify the Sales Order Number by removing the SO prefix and replace it with the Order Date. 
	Append the Sales Order Line Number to the end of the string, prefixed with a ".“
	Convert the entire value to a float data type.
	Order by LastName, FirstName, NewSalesOrderKey.



Question T4:  Query Analysis and Covering Index
	Based on the SQL created from Question 2, analyze the plans, and add the appropriate covering indexes.  This includes the following steps:
	Execute existing query and save the pre-update execution plan and messages.
	Create/execute needed indexes.
	Execute optimized query and save the post-update execution plan and messages.
	
Question T5:  Query Analysis and Optimization
	Analyze the provided query and optimized based on analysis (Hint:  Examine criteria and use execution plan for analysis.).  This includes the following steps:
	Analyze existing query, using built in tools.
	Execute existing query and save pre-update execution plan and messages.
	Optimize/adjust query, as needed, as well as source tables.
Execute optimized query and save the post-update execution plan and messages.




