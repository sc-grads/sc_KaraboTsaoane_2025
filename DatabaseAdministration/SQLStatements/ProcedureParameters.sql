CREATE PROCEDURE SelectAllPersonAddressWithParam (@CITY NVARCHAR(30))
AS

SET NOCOUNT ON

SELECT * FROM Person.Address where City = @city;
