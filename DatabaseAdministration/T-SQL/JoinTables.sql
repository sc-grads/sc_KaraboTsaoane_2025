select E.Department ,E.EmployeeFirstName , E.EmployeeLastName , A.EmployeeNumber  ,A.AttendanceMonth , A.NumberAttendance 
--E is a defined alias for a Employee table
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

select A.EmployeeNumber ,year(A.AttendanceMonth) as AttendanceYear , sum(A.NumberAttendance) as TotalAttendance
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
group by A.EmployeeNumber , year(A.AttendanceMonth)
order by A.EmployeeNumber , year(A.AttendanceMonth)
