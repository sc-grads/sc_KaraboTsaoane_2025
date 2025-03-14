USE FirstDatabase;
GO

CREATE TABLE PersonalInfo (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL
);
GO
