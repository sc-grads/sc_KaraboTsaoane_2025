BACKUP DATABASE [AdventureWorks2016] TO  DISK = N'C:\SQL Backup\AdventureWorks2016_01.tm',  DISK = N'C:\SQL Backup\AdventureWorks2016_full.bak'
WITH  COPY_ONLY, NOFORMAT, NOINIT,  NAME = N'AdventureWorks2016-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
