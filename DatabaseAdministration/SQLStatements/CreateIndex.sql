USE [AdventureWorks2016]

GO

SET ANSI_PADDING ON


GO

CREATE NONCLUSTERED INDEX [idx_firstName] ON [Person].[Person]
(
	[FirstName] ASC
)
GO


