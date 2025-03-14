-- Step 1: Drop the table if it already exists
IF OBJECT_ID('FunctionEmployees', 'U') IS NOT NULL
    DROP TABLE FunctionEmployees;

-- Step 2: Create the table
CREATE TABLE FunctionEmployees
(
    EmpID int PRIMARY KEY,
    FirstName varchar(50) NULL,
    LastName varchar(50) NULL,
    Salary int NULL,
    Address varchar(100) NULL
);

-- Step 3: Insert data
INSERT INTO FunctionEmployees([EmpID], [FirstName], [LastName], [Salary], [Address]) 
VALUES (1, 'Abbas', 'Mehmood', 20000, 'Delhi');

INSERT INTO FunctionEmployees([EmpID], [FirstName], [LastName], [Salary], [Address]) 
VALUES (2, 'Imran', 'Afzal', 50000, 'Delhi');

INSERT INTO FunctionEmployees([EmpID], [FirstName], [LastName], [Salary], [Address]) 
VALUES (3, 'James', 'Dino', 90000, 'Delhi');

INSERT INTO FunctionEmployees([EmpID], [FirstName], [LastName], [Salary], [Address]) 
VALUES (4, 'Jaga', 'Babu', 70000, 'Delhi');

-- Step 4: Select all records to verify
SELECT * FROM FunctionEmployees;

-- Step 5: Separate batch with GO to create function (required by SQL Server)
GO 

-- Step 6: Create the function
CREATE FUNCTION fnGetEmpFullName
(
    @FirstName varchar(50),
    @LastName varchar(50)
)
RETURNS varchar(101)
AS
BEGIN
    -- Return concatenated first and last name
    RETURN (@FirstName + ' ' + @LastName)
END;

-- Step 7: Use the function to get full name along with salary
SELECT dbo.fnGetEmpFullName(FirstName, LastName) AS FullName, Salary 
FROM FunctionEmployees;
