declare @myvar AS Decimal (7 , 3) = 3  -- we want 2 numbers after comma and total of numbers must be 7
--12345.67 is valid
--123456.7 not valid

SELECT Power(@myvar , 2)
SELECT SQUARE(@myvar)
SELECT Power(@myvar , 0.5)
SELECT SQRT(@myvar)
GO

declare @myvar AS Numeric (7 , 2)  = 3.7
Select FLOOR(@myvar)
Select Ceiling(@myvar)
Select Round(@myvar , 0)