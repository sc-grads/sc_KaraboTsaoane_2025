--Creating database
CREATE DATABASE TimesheetDB;
GO

-- Use the database
USE TimesheetDB;
GO

-- Stored procedure to create the tables
CREATE PROCEDURE CreateTimesheetTables
AS
BEGIN
    --Employee Table
    CREATE TABLE Employee (
        EmployeeID INT PRIMARY KEY IDENTITY(1,1),
        FullName NVARCHAR(Max) NOT NULL
    );

    -- Client Table
    CREATE TABLE Client (
        ClientID INT PRIMARY KEY IDENTITY(1,1),
        ClientName NVARCHAR(Max) NOT NULL 
    );

    -- Project Table
    CREATE TABLE Project (
        ProjectID INT PRIMARY KEY IDENTITY(1,1),
        ClientID INT NOT NULL,
        ProjectName NVARCHAR(Max) NOT NULL,
        FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
    );
	

    -- Updated TimeSheetEntry Table
 CREATE TABLE TimeSheetEntry (
    TimeSheetEntryID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
	ClientID INT NOT NULL,
    Date DATE NOT NULL,
    DayOfWeek NVARCHAR(20) NOT NULL,
    Description NVARCHAR(20),
	Comments  NVARCHAR(MAX),
    Billable NVARCHAR(20),  -- e.g., 'Billable', 'Non-Billable', or NULL
    StartTime TIME,
    EndTime TIME,
    TotalHours TIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	 FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

    -- Updated Leave Table
    CREATE TABLE Leave (
        LeaveID INT PRIMARY KEY IDENTITY(1,1),
        EmployeeID INT NOT NULL,
        LeaveType NVARCHAR(50) NOT NULL,
        StartDate DATE NOT NULL,
        EndDate DATE NOT NULL,
		NumberOfDays int NOT NULL,
        ApprovalObtained nvarchar(10),
	    SickNote nvarchar (10) NULL,
        FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
    );
	--Creating auditlog
	CREATE TABLE AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    PackageName NVARCHAR(100),
    ExecutionTime DateTime2(7),
    RowsInserted INT NULL,
    ErrorMessage NVARCHAR(MAX) NULL 
);


	--Staging table for leave
	CREATE TABLE Leave_Staging (
    TypeOfLeave NVARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    NumberOfDays INT,
    ApprovalObtained NVARCHAR(10),
    SickNote NVARCHAR(50),
	FullName VARCHAR(100) NOT NULL
);
--Staging table fortimesheet
CREATE TABLE Timesheet_Staging (
    Date DATE,
    DayOfWeek NVARCHAR(20),
    Client NVARCHAR(100),
    ClientProjectName NVARCHAR(200),
    Description NVARCHAR(MAX),
    Billable NVARCHAR(20),
    Comments NVARCHAR(MAX),
    TotalHours TIME,
    StartTime TIME,
    EndTime TIME,
	FullName NVARCHAR(100) NOT NULL
);
--For the TimeEntrySheet
CREATE TABLE ProcessedSheets (
    SheetName NVARCHAR(100),
    ProcessedDate DATETIME
);


END;
GO

EXEC CreateTimesheetTables;
GO

-- Stored procedure to drop all tables
CREATE PROCEDURE DropTimesheetTables
AS
BEGIN
    -- Drop in reverse order of dependencies
    IF OBJECT_ID('Leave', 'U') IS NOT NULL DROP TABLE Leave;
    IF OBJECT_ID('TimeSheetEntry', 'U') IS NOT NULL DROP TABLE TimeSheetEntry;
    IF OBJECT_ID('Project', 'U') IS NOT NULL DROP TABLE Project;
    IF OBJECT_ID('Client', 'U') IS NOT NULL DROP TABLE Client;
    IF OBJECT_ID('Employee', 'U') IS NOT NULL DROP TABLE Employee;
END;
GO

ALTER PROCEDURE DropTimesheetTables
AS
BEGIN
    -- Drop in reverse order of dependencies
    IF OBJECT_ID('Leave', 'U') IS NOT NULL DROP TABLE Leave;
    IF OBJECT_ID('TimeSheetEntry', 'U') IS NOT NULL DROP TABLE TimeSheetEntry;
    IF OBJECT_ID('Project', 'U') IS NOT NULL DROP TABLE Project;
    IF OBJECT_ID('Client', 'U') IS NOT NULL DROP TABLE Client;
    IF OBJECT_ID('Employee', 'U') IS NOT NULL DROP TABLE Employee;
END;

EXEC DropTimesheetTables;
