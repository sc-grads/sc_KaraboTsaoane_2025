select * from tblDepartment 
select * from tblEmployee
select * from tblTransaction

select min(EmployeeNumber) as MinNumber, max(EmployeeNumber) as MaxNumber
from tblTransaction

select min(EmployeeNumber) as MinNumber, max(EmployeeNumber) as MaxNumber
from tblEmployee

select T.* 
from tblTransaction as T
inner join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeLastName like 'y%'
order by T.EmployeeNumber

select * 
from tblTransaction as T
Where EmployeeNumber in
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber
