-- Check if the database exists, create if not
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoTest')
BEGIN
    CREATE DATABASE AutoTest;
END;
GO

-- Use the AutoTest database
USE AutoTest;
GO

-- Check if the stored procedure exists, drop if it does
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'CreateUserTable')
BEGIN
    DROP PROCEDURE CreateUserTable;
END;
GO

-- Create a stored procedure to create the table and insert data
CREATE PROCEDURE CreateUserTable
AS
BEGIN
    -- Check if the table exists, create if not
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'user')
    BEGIN
        CREATE TABLE [user] (
            Name NVARCHAR(50),
            Surname NVARCHAR(50),
            Email NVARCHAR(100)
        );
    END;

    -- Check if data already exists to prevent duplicate inserts
    IF NOT EXISTS (SELECT 1 FROM [user] WHERE Email = 'john.doe@example.com')
    BEGIN
        INSERT INTO [user] (Name, Surname, Email) VALUES
        ('John', 'Doe', 'john.doe@example.com'),
        ('Jane', 'Smith', 'jane.smith@example.com');
    END;
END;
GO

-- Execute the stored procedure
EXEC CreateUserTable;
GO
