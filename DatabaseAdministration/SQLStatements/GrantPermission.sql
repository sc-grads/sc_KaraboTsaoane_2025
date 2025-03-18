USE [AdventureWorks2016]
GO
CREATE USER [LAPTOP-OKDI7SQH\Karabo Tsaoane] WITH DEFAULT_SCHEMA=[dbo]
GO

GRANT ALTER ON SCHEMA:: Sales TO [LAPTOP-OKDI7SQH\Karabo Tsaoane];

SELECT pe.state_desc, pe.permission_name
FROM sys.database_principals pr INNER JOIN sys.database_permissions pe  
    ON pr.principal_id = pe.grantee_principal_id
  WHERE pr.principal_id = USER_ID('LAPTOP-OKDI7SQH\Karabo Tsaoane');
