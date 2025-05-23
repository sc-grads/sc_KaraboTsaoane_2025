select * 
from tblTransaction as T
Where EmployeeNumber = some -- or "some" display all the things that the select below wants
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

--any/some =Uses OR condition
--all = Uses AND condition

select * 
from tblTransaction as T
Where EmployeeNumber <> any -- does not work properly
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

select * 
from tblTransaction as T
Where EmployeeNumber <> all --this is not equal to
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

select * 
from tblTransaction as T
Where EmployeeNumber <= all
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber
