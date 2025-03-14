select s.RollNo,s.StudentName,c.CourseID from [dbo].[Student] s
full join [dbo].[Course] c 
on s.RollNo = c.RollNO