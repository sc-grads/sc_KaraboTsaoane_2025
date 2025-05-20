declare @mydate as datetime = '2015-06-24 12:34:56.124'
select @mydate as Mydate

declare @mydate2 as datetime = '20150624 12:34:56.124' --Even without hyphens it still works
select @mydate2 as Mydate 

select DATEFROMPARTS(2015 ,06 , 24) as ThatDate
select DATETIME2FROMPARTS(2015 ,06 , 24 , 12 ,34 ,56 ,124 , 3) as ThatDate
