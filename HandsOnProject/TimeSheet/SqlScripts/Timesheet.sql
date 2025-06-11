INSERT INTO TimeSheetEntry
    (EmployeeID, ProjectID, [Date], DayOfWeek, [Description], Comments, Billable, StartTime, EndTime, TotalHours)
SELECT 
    e.EmployeeID,
    p.ProjectID,
    s.[Date],
    s.DayOfWeek,
    LEFT(s.[Description], 20),  -- Match target datatype
    s.Comments,
    s.Billable,
    s.StartTime,
    s.EndTime,
    s.TotalHours
FROM Timesheet_Staging s
INNER JOIN Employee e ON s.FullName = e.FullName
INNER JOIN Project p ON  s.ClientProjectName = p.ProjectName
WHERE 
    s.[Date] IS NOT NULL 
    AND s.DayOfWeek IS NOT NULL 
    AND s.Client IS NOT NULL
    AND s.[Description] IS NOT NULL 
    AND s.[Description] <> 'Public Holiday' 
    AND s.TotalHours IS NOT NULL;


