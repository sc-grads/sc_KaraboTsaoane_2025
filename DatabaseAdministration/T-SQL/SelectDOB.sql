select * from tblEmployees
where DateOfBirth between '19760101' and '19861231'  --DOB year 1976 ands 1986

Select year(DateOfBirth) as YearOfBirth , count(*) as NumberBorn
From tblEmployees
Group By year(DateOfBirth)
--non-deterministic( you wont get the same order each time you run this)

select * from tblEmployees
where year(DateOfBirth) = 1976