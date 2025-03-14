SELECT TOP (1000) [ID]
      ,[FirstName]
      ,[LastName]
      ,[DateOfBirth]
  FROM [FirstDatabase].[dbo].[PersonalInfo]
CREATE TRIGGER EmployeeInsert
   ON  PersonalInfo
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	Insert into Course values ((select top(1) ID FROM PersonalInfo), 'Insert' )
END

GO