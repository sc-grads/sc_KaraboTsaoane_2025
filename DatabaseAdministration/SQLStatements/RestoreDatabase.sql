USE [master]
RESTORE DATABASE [AdventureWorks2016] FROM  DISK = N'C:\SQL Backup\AdventureWorks2016_tran_3.trn' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5

GO


