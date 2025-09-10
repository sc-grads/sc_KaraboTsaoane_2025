with recursive countdown(val) As (
select 3 as val
union
select val -1 from countdown where val >1
)
select * 
from countdown;