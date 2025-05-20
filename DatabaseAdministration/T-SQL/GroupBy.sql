select left(EmployeeLastName , 1) as Initial ,  --Take first letter of last name  
count(*) as CountofInitial  --Count how many employees have same initial
from tblEmployees 

group by left(EmployeeLastName , 1) 
--Groups the employees by their last name's first letter, so that COUNT(*) can summarize how many employees fall into each initial.
order by count(*) DESC 
--Orders the result by the count of initials, from most frequent to least.

select top (5) left(EmployeeLastName , 1) as Initial ,   count(*) as CountofInitial 
from tblEmployees 
group by left(EmployeeLastName , 1) 
order by count(*) DESC

--1.Get everything from employee table and group it
--2.The computer orders it and then we go to select statement 