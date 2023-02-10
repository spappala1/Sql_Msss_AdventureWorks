/* =============================================
  Author: <Sai Charan Pappala>
  Create Date:  <1/31/2023> 
  Name: Question 5:  Query Analysis and Optimization
  Candidate Instructions:  
	Analyze the provided query and optimized based on analysis (Hint:  Examine criteria and use execution plan for analysis.).  This includes the following steps:	
		Analyze existing query, using built in tools.
		Execute existing query and save before pre-update execution plan.
		Optimize/adjust query, as needed, as well as source tables.
		Execute optimized query and save the post-update execution plan.
 Solution Description : 

Step1: Analyzed query in database engine tuning advisor and saved the analysis. 
Step2: Executed the query and saved the pre update execution plan and messages
Step3: Followed the given tuning method suggested by tuning advisor and figured that there is no difference between the optimization
Step4: Created non clustered index on Dim Product  (EnglishProductName) and removed the function key word Left and updated the query 
Step5: Executed optimized query and saved the results.

 
 =========================================== */
USE AdventureWorksDW2017
GO

CREATE NONCLUSTERED INDEX [_dta_index_DimProduct_5_1125579048__K6] ON [dbo].[DimProduct]
(
	[EnglishProductName] 
)



SET STATISTICS IO ON

SELECT
		dp.EnglishProductName
FROM 
		dbo.DimProduct dp
WHERE 
		dp.EnglishProductName LIKE 'B%'
ORDER BY
		dp.EnglishProductName

SET STATISTICS IO OFF