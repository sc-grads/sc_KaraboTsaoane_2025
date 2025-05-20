--Implicit
Declare @myvar as Decimal(5,2) = 3   --Since it's a decimal type with 2 decimal places, SQL Server will automatically convert it to 3.00.
--You’re creating a variable that can hold a decimal number (up to 5 digits total, 2 after the decimal), and you’re starting it off with the value 3.00
Select @myvar 

--Explicit
Select Convert (decimal(5 ,2), 3)/2
Select Cast (3 as decimal(5 ,2))/2


Select 3/2
Select 3/2.0