select* from Employee
Go

CREATE PROCEDURE UniqueEmployee
AS
BEGIN
    WITH RankedEmployees AS (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY FullName ORDER BY EmployeeID) AS RowNum
        FROM Employee
    )
    SELECT *
    FROM RankedEmployees
    WHERE RowNum = 1;
END;

Go

EXEC UniqueEmployee;
DROP PROCEDURE GetUniqueEmployee;
