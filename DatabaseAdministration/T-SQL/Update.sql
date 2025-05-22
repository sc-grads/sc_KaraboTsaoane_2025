select * from tblEmployees where EmployeeNumber = 194
select * from tblTransaction where EmployeeNumber = 3
select * from tblTransaction where EmployeeNumber = 194

begin tran 
select * from tblTransaction where EmployeeNumber = 194

update tblTransaction
set EmployeeNumber = 194
output inserted.* , deleted.* --This just showsthe columns that were inserted and deleted
from tblTransaction
where EmployeeNumber in (3 , 5 , 7 , 9)

select * from tblTransaction where EmployeeNumber = 194
rollback tran