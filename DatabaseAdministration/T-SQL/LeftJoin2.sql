select tblDepartment.Department , sum(Amount) as SumOfAmount
from tblDepartment
left join tblEmployees
on tblDepartment.Department = tblEmployees.Department
left join tblTransaction
on tblEmployees.EmployeeNumber = tblTransaction.EmployeeNumber
group by tblDepartment.Department