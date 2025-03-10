USE AutoTest;

CREATE TABLE [User] (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50),
    Surname NVARCHAR(50),
    Email NVARCHAR(100)
);
