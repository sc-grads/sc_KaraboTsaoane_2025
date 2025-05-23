with myTable as
(select year(DateOfTransaction) as TheYear, month(DateOfTransaction) as TheMonth, Amount from tblTransaction)

select * from myTable
PIVOT (sum(Amount) for TheMonth in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) as myPvt
ORDER BY TheYear 
--Amount(Is the values inside the pivot)  Month(The column that gets pivoted/the column runniung across) In (Specify pivoted columns)
--The numbers have ti be in squared brackets/the columns
--Then give it a name