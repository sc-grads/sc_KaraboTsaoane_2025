-- Ensure database exists
IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'AutoTest')
BEGIN
    CREATE DATABASE AutoTest;
    PRINT 'Database AutoTest created.';
END
ELSE
BEGIN
    PRINT 'Database AutoTest already exists.';
END
GO

-- Use the database
USE AutoTest;
GO

-- Create user table if not exists
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'User')
BEGIN
    CREATE TABLE [user] (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(100) NOT NULL,
        Surname NVARCHAR(100) NOT NULL,
        Email NVARCHAR(255) NOT NULL UNIQUE
    );
    PRINT 'Table user created.';
END
ELSE
BEGIN
    PRINT 'Table user already exists.';
END
GO

-- Create stored procedure for inserting users
IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'InsertUser')
BEGIN
    EXEC('
    CREATE PROCEDURE InsertUser
        @Name NVARCHAR(100),
        @Surname NVARCHAR(100),
        @Email NVARCHAR(255)
    AS
    BEGIN
        INSERT INTO [user] (Name, Surname, Email)
        VALUES (@Name, @Surname, @Email);
        
        SELECT SCOPE_IDENTITY() AS UserId;
    END
    ');
    PRINT 'Stored procedure InsertUser created.';
END
ELSE
BEGIN
    PRINT 'Stored procedure InsertUser already exists.';
END
GO

-- Create Auto_user if not exists
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'AutoUser')
BEGIN
    CREATE LOGIN Au_user WITH PASSWORD = 'StrongPassword123!';
    PRINT 'Login Auto_user created.';
END
ELSE
BEGIN
    PRINT 'Login Auto_user already exists.';
END
GO

-- Grant permissions to Auto_user
USE AutoTest;
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'AutoUser')
BEGIN
    CREATE USER Au_user FOR LOGIN Auto_user;
    PRINT 'User Auto_user created in AutoTest database.';
END
ELSE
BEGIN
    PRINT 'User Auto_user already exists in AutoTest database.';
END
GO
