--if exists(Select * from sys.procedures where name = 'NameEmployees') just check if the procedure exists
if OBJECT_ID('NameEmployees' , 'P') IS NOT NULL
drop  proc NameEmployees
go
create proc NameEmployees(@EmployeeFrom int ,@EmployeeTo as int) as --this is more like a declaration ,this is when you want someone specific
begin
  if exists (select * from tblEmployees where EmployeeNumber between @EmployeeFrom and @EmployeeTo  )--Check if there any values in the columns if not go to next line
  begin
			select EmployeeNumber , EmployeeFirstName , EmployeeLastName
			from tblEmployees
			where EmployeeNumber between @EmployeeFrom and @EmployeeTo
	end
end
go

exec  NameEmployees @EmployeeFrom =324 ,@EmployeeTo =327