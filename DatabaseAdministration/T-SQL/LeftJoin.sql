Select tblEmployees.EmployeeNumber , EmployeeFirstName , EmployeeLastName , sum(Amount) as SumOfAmount
from tblEmployees
left join tblTransaction
on tblEmployees.EmployeeNumber = tblTransaction.EmployeeNumber
Group By tblEmployees.EmployeeNumber , EmployeeFirstName , EmployeeLastName
Order By EmployeeNumber