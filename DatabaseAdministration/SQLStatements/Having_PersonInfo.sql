USE FirstDatabase;
GO

SELECT LastName, AVG(YEAR(DateOfBirth)) AS AvgBirthYear
FROM PersonalInfo
GROUP BY LastName
HAVING AVG(YEAR(DateOfBirth)) > 1990;
GO
