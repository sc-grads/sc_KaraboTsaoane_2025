BACKUP DATABASE [AdventureWorks2016] TO  DISK = N'C:\SQL Backup\AdventureWorks2016_diff.bak' WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'AdventureWorks2016-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
