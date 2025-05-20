Declare @character as char(10)
set @character = 'Hello'
select @character  as myString , len (@character) as Mylength , DATALENGTH (@character) as myDatalength