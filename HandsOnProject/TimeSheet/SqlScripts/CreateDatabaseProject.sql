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
        FullName VARCHAR(100) NOT NULL
    );

    -- Client Table
    CREATE TABLE Client (
        ClientID INT PRIMARY KEY IDENTITY(1,1),
        ClientName NVARCHAR(100) NOT NULL 
    );

    -- Updated TimeSheetEntry Table
 CREATE TABLE Timesheet (
    TimesheetID INT PRIMARY KEY IDENTITY(1,1),
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
CREATE TABLE dbo.AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    PackageName NVARCHAR(100),
    FileName NVARCHAR(255),
    RowsInserted INT,
    Timestamp NVARCHAR(30)
);
ALTER TABLE dbo.AuditLog
ADD 
    EmployeeName VARCHAR(100);


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
--for Error Log
CREATE TABLE ErrorLog (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    PackageName NVARCHAR(255),
    TaskName NVARCHAR(255),
    ErrorDescription NVARCHAR(MAX),
    ErrorCode INT,
    ErrorTime DATETIME DEFAULT GETDATE()
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
