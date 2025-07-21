
schema_description = """
Tables:
- Employee(EmployeeID, FullName)
- Client(ClientID, ClientName)
- Timesheet(TimesheetID, EmployeeID, ClientID, Date, DayOfWeek, Description, Comments, Billable, StartTime, EndTime, TotalHours)
- Leave(LeaveID, EmployeeID, LeaveType, StartDate, EndDate, NumberOfDays, ApprovalObtained, SickNote)
- AuditLog(AuditID, PackageName, FileName, RowsInserted, Timestamp, EmployeeName)
- Leave_Staging(TypeOfLeave, StartDate, EndDate, NumberOfDays, ApprovalObtained, SickNote, FullName)
- Timesheet_Staging(Date, DayOfWeek, Client, ClientProjectName, Description, Billable, Comments, TotalHours, StartTime, EndTime, FullName)
- ErrorLog(ErrorID, PackageName, TaskName, ErrorDescription, ErrorCode, ErrorTime)

Relationships:
- Timesheet.EmployeeID → Employee.EmployeeID
- Timesheet.ClientID → Client.ClientID
- Leave.EmployeeID → Employee.EmployeeID
"""
#This is teaching my LLM about the structure of my database
#schema_description variable will be imported by your prompt builder script — the part that combines this context with the user's question.