select * from tblTransaction
where EmployeeNumber between 3 and 11
order by EmployeeNumber

select count(distinct EmployeeNumber) from tblTransaction  --You are selecting unique/no duplicates
where EmployeeNumber between 3 and 11

select count(distinct EmployeeNumber) from tblEmployees
where EmployeeNumber between 3 and 11
