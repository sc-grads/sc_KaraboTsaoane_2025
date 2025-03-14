USE FirstDatabase;
GO

UPDATE PersonalInfo
SET DateOfBirth = '1991-06-10'
WHERE FirstName = 'John' AND LastName = 'Doe';
GO
