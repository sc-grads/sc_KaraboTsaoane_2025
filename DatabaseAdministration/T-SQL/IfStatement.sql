declare @firstname as nvarchar(20)
declare @middlename as nvarchar(20)
declare @lastname as nvarchar(20)

set  @firstname = 'John'
set  @middlename = 'Walker'
set  @lastname ='Smith'

select @firstname +' ' + @middlename + ' ' + @lastname + ' ' as FullName --Those ' ' are for spaces


set  @firstname = 'Sarah'
set  @middlename = 'Walker'
--select @firstname +' ' + @middlename + ' ' + @lastname + ' ' as FullName(Because it gives NULL)
--Solution
select @firstname + iif(@middlename is NULL ,'' ,' ' + @middlename) + ' ' + @lastname as FullName