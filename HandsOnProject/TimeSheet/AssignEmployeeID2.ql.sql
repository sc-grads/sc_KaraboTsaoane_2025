
select* from Employee
GO
CREATE PROCEDURE AssignEmployeeID2
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Create CleanedEmployee table if it doesn't exist
    IF OBJECT_ID('dbo.CleanedEmployee', 'U') IS NULL
    BEGIN
        CREATE TABLE dbo.CleanedEmployee (
            EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
            FullName NVARCHAR(100) NOT NULL UNIQUE
        );
    END

    -- Step 2: Insert new employees who are not yet assigned an EmployeeID
    INSERT INTO dbo.CleanedEmployee (FullName)
    SELECT DISTINCT e.FullName
    FROM dbo.Employee e
    LEFT JOIN dbo.CleanedEmployee c
        ON e.FullName = c.FullName
    WHERE c.FullName IS NULL;
END;
GO


EXEC AssignEmployeeID2;
Drop Procedure AssignEmployeeID2;
DROP TABLE IF EXISTS dbo.CleanedEmployee;