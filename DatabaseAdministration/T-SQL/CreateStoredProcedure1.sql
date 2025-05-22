--if exists(Select * from sys.procedures where name = 'NameEmployees') just check if the procedure exists
if OBJECT_ID('NameEmployees' , 'P') IS NOT NULL
drop  proc NameEmployees
go
create proc NameEmployees(@EmployeeNumber int) as --this is more like a declaration ,this is when you want someone specific
begin
  if exists (select * from tblEmployees where EmployeeNumber=@EmployeeNumber)--Check if there any values in the columns if not go to next line
  begin
	 if @EmployeeNumber <300 --if true execute the first begin
	begin
		select EmployeeNumber , EmployeeFirstName , EmployeeLastName
		from tblEmployees
		where EmployeeNumber = @EmployeeNumber
	end
	else    --You are just adding department and transaction of the person
	begin
		select EmployeeNumber , EmployeeFirstName , EmployeeLastName
		from tblEmployees
		where EmployeeNumber = @EmployeeNumber
		select *from tblTransaction where EmployeeNumber = @EmployeeNumber
	end
 end
end
go
--The following lines are doing the same thing
NameEmployees 4 -- won't execute because it does not exist
execute NameEmployees 223
exec  NameEmployees 324