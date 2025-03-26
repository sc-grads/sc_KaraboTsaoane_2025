DECLARE @DBName NVARCHAR(100) = '$(DB_NAME)';

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = @DBName)
BEGIN
    DECLARE @SQL NVARCHAR(MAX) = 'CREATE DATABASE ' + QUOTENAME(@DBName);
    EXEC sp_executesql @SQL;
END;

USE [$(DB_NAME)];

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'user')
BEGIN
    CREATE TABLE [dbo].[user] (
        [Name] NVARCHAR(50) NOT NULL,
        [Surname] NVARCHAR(50) NOT NULL,
        [Email] NVARCHAR(100) NOT NULL
    );
END;

INSERT INTO [dbo].[user] (Name, Surname, Email)
VALUES ('John', 'Doe', 'john.doe@example.com');
