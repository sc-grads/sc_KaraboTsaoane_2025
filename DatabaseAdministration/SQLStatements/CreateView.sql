USE FirstDatabase;
GO

CREATE VIEW vw_PersonalInfo AS
SELECT FirstName, LastName, DateOfBirth
FROM PersonalInfo;
GO
