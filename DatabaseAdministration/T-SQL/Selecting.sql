select * from tblEmployees
where not EmployeeNumber> 200  --Not greater than 200 so it includes 200

select * from tblEmployees
where EmployeeNumber != 200 -- is an equivalent of not


select * from tblEmployees
where EmployeeNumber >= 200 and EmployeeNumber <= 209

select * from tblEmployees
where not (EmployeeNumber >= 200 and EmployeeNumber <= 209)

select * from tblEmployees
where  EmployeeNumber >= 200 or EmployeeNumber <= 209 --One has to be true