ALTER TABLE tblEmployees
ADD Department Varchar(10);

Select * FROM tblEmployees

Insert into tblEmployees VALUES
(
132,'Dylan','A'	,'Word','HN513777D' ,'1992/09/14' ,'Customer Relations'
)

ALTER TABLE tblEmployees
Drop Column Department

ALTER TABLE tblEmployees
ADD Department Varchar(15);


ALTER TABLE tblEmployees
Alter Column Department Varchar(20);

ALTER TABLE tblEmployees
Alter Column Department Varchar(19);

Insert into tblEmployees([EmployeeNumber] ,[EmployeeFirstName] ,[EmployeeMiddleName] ,[EmployeeLastName] ,[EmployeeGovernmentID],[DateOfBirth] ,[Department])
--To ensure that it goes in the correct column
VALUES(131 ,	'Jossef	','H' ,'Wright',	'TX593671R','1971/12/24' ,'Litigation')

select *from tblEmployees
where[EmployeeLastName] <> 'Word'

select *from tblEmployees
where[EmployeeLastName] like 'W'

select *from tblEmployees
where[EmployeeLastName] like 'W%'

select *from tblEmployees
where[EmployeeLastName] like '_W%'