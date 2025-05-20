Create Table tblEmployees
(
EmployeeNumber INT NOT NULL,    --This field is compulsory
EmployeeFirstName VARCHAR(50) NOT NULL, 
EmployeeMiddleName VARCHAR(50) NULL ,
EmployeeLastName VARCHAR(50) NOT NULL ,
EmployeeGovernmentID CHAR(10) NULL,
DateOfBirth DATE NOT NULL
)