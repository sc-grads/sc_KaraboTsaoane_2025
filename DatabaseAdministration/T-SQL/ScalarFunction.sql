CREATE FUNCTION AmountPlusOne(@Amount smallmoney) --name of function,parameter and data type
RETURNS smallmoney                                --data type it will returnn 
AS
BEGIN

    RETURN @Amount + 1                            --This is the calculation

END
GO

select DateOfTransaction, EmployeeNumber, Amount, dbo.AmountPlusOne(Amount) as AmountAndOne --AmountPlusOne should be defined as a schema here
from tblTransaction

DECLARE @myValue smallmoney
EXEC @myValue = dbo.AmountPlusOne @Amount = 345.67
select @myValue
