-- Switch to the AutoTest database (assumes it exists)
USE AutoTest;
GO

-- Create the user table if it doesn’t exist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'User')
BEGIN
    CREATE TABLE [User] (
        Name VARCHAR(50) NOT NULL,
        Surname VARCHAR(50) NOT NULL,
        Email VARCHAR(100) UNIQUE NOT NULL
    );
    PRINT 'User table created.';
END
ELSE
BEGIN
    PRINT 'User table already exists.';
END
GO

-- Create or alter the stored procedure to insert a user
IF OBJECT_ID('InsertUser') IS NOT NULL
    DROP PROCEDURE InsertUser;
GO

CREATE PROCEDURE InsertUser
    @Name VARCHAR(50),
    @Surname VARCHAR(50),
    @Email VARCHAR(100)
AS
BEGIN
    BEGIN TRY
        INSERT INTO [user] (Name, Surname, Email)
        VALUES (@Name, @Surname, @Email);
        PRINT 'Inserted: ' + @Name + ' ' + @Surname + ' - ' + @Email;
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() = 2627 -- Unique constraint violation
            PRINT 'Email ' + @Email + ' already exists!';
        ELSE
            PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH
END
GO

-- Execute the stored procedure with sample data
EXEC InsertUser 'John', 'Doe', 'john.doe@example.com';
EXEC InsertUser 'Jane', 'Smith', 'jane.smith@example.com';
EXEC InsertUser 'Bob', 'Johnson', 'bob.johnson@example.com';
GO