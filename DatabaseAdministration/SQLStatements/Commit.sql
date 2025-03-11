USE FirstDatabase;
GO

BEGIN TRANSACTION;

-- Update query
UPDATE PersonalInfo
SET DateOfBirth = '1991-06-10'
WHERE FirstName = 'John' AND LastName = 'Doe';

-- Commit the transaction to save changes
COMMIT;
GO
