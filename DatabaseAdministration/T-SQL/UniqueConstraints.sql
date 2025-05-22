alter table tblEmployees
ADD CONSTRAINT unqGovernmentID UNIQUE (EmployeeGovernmentID);

select EmployeeGovernmentID, count(EmployeeGovernmentID) as MyCount from tblEmployees
group by EmployeeGovernmentID
having count(EmployeeGovernmentID)>1

select * from tblEmployees where EmployeeGovernmentID IN ('HN513777D', 'TX593671R')

begin tran
delete top(2) from tblEmployees
where EmployeeNumber in (131, 132)

select * from tblEmployees where EmployeeGovernmentID IN ('HN513777D', 'TX593671R')
commit tran


alter table tblTransaction
add constraint unqTransaction UNIQUE (Amount, DateOfTransaction, EmployeeNumber)

delete from tblTransaction
where EmployeeNumber = 131

insert into tblTransaction
VALUES (1,'2015-01-01', 131)
insert into tblTransaction
VALUES (1,'2015-01-01', 131)

alter table tblTransaction
Drop constraint unqTransaction

create table tblTransaction2
(Amount smallmoney not null,
DateOfTransaction smalldatetime not null,
EmployeeNumber int not null,
CONSTRAINT unqTransaction2 UNIQUE (Amount,DateOfTransaction,EmployeeNumber))

drop table tblTransaction2
