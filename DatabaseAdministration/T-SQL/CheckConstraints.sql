alter table tblTransaction
add constraint chkAmount check (Amount>-1000 and Amount < 1000) --This is what you're looking for

insert into tblTransaction
values (1010, '2014-01-01', 1)

alter table tblEmployees with nocheck --It is not checking existing rows
add constraint chkMiddleName check
(REPLACE(EmployeeMiddleName,'.','') = EmployeeMiddleName or EmployeeMiddleName is null)

alter table tblEmployee
drop constraint chkMiddleName

begin tran
  insert into tblEmployees
  values (2003, 'A', 'B.', 'C', 'D', '2014-01-01', 'Accounts')
  select * from tblEmployees where EmployeeNumber = 2003
rollback tran

alter table tblEmployees with nocheck
add constraint chkDateOfBirth check (DateOfBirth between '1900-01-01' and getdate())

begin tran
  insert into tblEmployees
  values (2003, 'A', 'B', 'C', 'D', '2015-01-01', 'Accounts')
  select * from tblEmployees where EmployeeNumber = 2003
rollback tran

create table tblEmployee2
(EmployeeMiddleName varchar(50) null, constraint CK_EmployeeMiddleName check
(REPLACE(EmployeeMiddleName,'.','') = EmployeeMiddleName or EmployeeMiddleName is null))

drop table tblEmployee2

alter table tblEmployees
drop chkDateOfBirth
alter table tblEmployees
drop chkMiddleName
alter table tblTransaction
drop chkAmount
