select 'My number is :' + convert(varchar(20) , 234)
select 'My number is :' + cast(234 as varchar(20))

select 'My salary is :' + format(234.6 , 'C') --Converts it to a currency
select 'My salary is :' + format(234.6 , 'C' , 'fr-FR') --When you want a specific currency