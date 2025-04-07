
--- 1. Check if database exists, create it if not
BEGIN TRY
    IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'AutoTest_KaraboTsaoane')
    BEGIN
        CREATE DATABASE AutoTest_KaraboTsaoane;
        PRINT 'Database AutoTest_KaraboTsaoane created successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Database AutoTest_KaraboTsaoane already exists.';
    END
END TRY
BEGIN CATCH
    PRINT 'Error creating database: ' + ERROR_MESSAGE();
    THROW;
END CATCH
GO

--- 2. Switch to the new database
BEGIN TRY
    USE AutoTest_KaraboTsaoane;
    PRINT 'Switched to AutoTest_KaraboTsaoane database.';
END TRY
BEGIN CATCH
    PRINT 'Error switching database: ' + ERROR_MESSAGE();
    THROW;
END CATCH
GO

-- 3. Drop stored procedure if it exists
BEGIN TRY
    IF OBJECT_ID('CreateUserTable', 'P') IS NOT NULL
    BEGIN
        DROP PROCEDURE CreateUserTable;
        PRINT 'Dropped existing CreateUserTable procedure.';
    END
END TRY
BEGIN CATCH
    PRINT 'Error dropping procedure: ' + ERROR_MESSAGE();
    THROW;
END CATCH
GO

-- 4. Create stored procedure that creates the table and inserts data
BEGIN TRY
    CREATE PROCEDURE CreateUserTable
    AS
    BEGIN
        BEGIN TRY
            -- Check if the table exists
            IF OBJECT_ID('user', 'U') IS NULL
            BEGIN
                CREATE TABLE [user] (
                    Name NVARCHAR(50),
                    Surname NVARCHAR(50),
                    Email NVARCHAR(100)
                );
                PRINT 'Table [user] created successfully.';

                -- Insert data
                INSERT INTO [user] (Name, Surname, Email)
                VALUES 
                    ('John', 'Doe', 'john@example.com'),
                    ('Jane', 'Smith', 'jane@example.com');
                PRINT 'Data inserted into [user] table successfully.';
            END
            ELSE
            BEGIN
                PRINT 'Table [user] already exists.';
            END
        END TRY
        BEGIN CATCH
            PRINT 'Error in CreateUserTable procedure: ' + ERROR_MESSAGE();
            THROW;
        END CATCH
    END
    PRINT 'Stored procedure CreateUserTable created successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error creating procedure: ' + ERROR_MESSAGE();
    THROW;
END CATCH
GO

-- 5. Execute the stored procedure
BEGIN TRY
    EXEC CreateUserTable;
    PRINT 'Stored procedure CreateUserTable executed successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error executing procedure: ' + ERROR_MESSAGE();
    THROW;
END CATCH
GO
