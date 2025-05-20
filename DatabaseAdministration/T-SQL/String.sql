Declare @chrASCII as varchar(10) = 'Hellothere'
Declare @chrUNICODE as nvarchar(10) = N'hello'

select left(@chrASCII,2) as myASCII , right(@chrUNICODE , 2) as myUNICODE 
--first takes 2 letters from the left
--second takes 2 letters from the right


select substring(@chrASCII,3 , 2) as middleletters
--it goes to the 3rd letter and takes 2 letters
Select REPLACE (@chrASCII , 'l' , 'L')

select Upper(@chrASCII) as Upper
