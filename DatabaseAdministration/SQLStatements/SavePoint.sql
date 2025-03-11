USE FirstDatabase;
GO

BEGIN TRANSACTION;

-- Insert a new record
INSERT INTO PersonalInfo (FirstName, LastName, DateOfBirth)
VALUES ('Alice', 'Green', '1995-08-12');

-- Set a savepoint
SAVE TRANSACTION SavePoint1;

-- Insert another record
INSERT INTO PersonalInfo (FirstName, LastName, DateOfBirth)
VALUES ('Bob', 'Blue', '1993-04-22');

-- If something goes wrong after the second insert, rollback to the savepoint
--ROLLBACK TRANSACTION SavePoint1;  -- Uncomment to rollback to SavePoint1

-- Commit the transaction to finalize the changes
COMMIT;
GO
