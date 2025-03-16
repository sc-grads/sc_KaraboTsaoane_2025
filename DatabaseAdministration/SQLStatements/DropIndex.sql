USE [AdventureWorks2016]
GO

/****** Object:  Index [idx_firstName]    Script Date: 2025/03/16 09:56:02 ******/
DROP INDEX [idx_firstName] ON [Person].[Person]
GO

SET ANSI_PADDING ON
GO

/****** Object:  Index [idx_firstName]    Script Date: 2025/03/16 09:56:04 ******/
CREATE NONCLUSTERED INDEX [idx_firstName] ON [Person].[Person]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


