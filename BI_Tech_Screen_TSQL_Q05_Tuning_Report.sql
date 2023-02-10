use [AdventureWorksDW2017]
go

SET ANSI_PADDING ON

go

CREATE NONCLUSTERED INDEX [_dta_index_DimProduct_5_1125579048__K6] ON [dbo].[DimProduct]
(
	[EnglishProductName] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

