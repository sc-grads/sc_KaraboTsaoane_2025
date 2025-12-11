--Question 1
Select * From [HumanResources].[Employee]
Order by [JobTitle] Asc;


--Question 2
Select * From [Person].[Person] As Employee
Order by [LastName] Asc;


--Question 3
Select [FirstName] ,[LastName], [BusinessEntityID] As Employee_id From [Person].[Person]
Order by[LastName] Asc;

--Question 4
Select [ProductID],[ProductNumber],[Name] From [Production].[Product]
Where [SellStartDate] IS NOT NULL AND  [ProductLine]='T'
Order by Name ASC;


--Question 5
Select  [SalesOrderID], [CustomerID],[OrderDate], [SubTotal], ([TaxAmt]/[SubTotal])* 100  As tax_percent From [Sales].[SalesOrderHeader]
Order by [SubTotal] Asc;


--Question 6
Select Distinct([JobTitle]) From [HumanResources].[Employee]
Order By [JobTitle] Asc ;


--Question 7
Select [CustomerID], Sum([Freight]) AS TotalFreight From [Sales].[SalesOrderHeader]
Group by [CustomerID]
Order by [CustomerID] Asc;


--Question 8
Select  [CustomerID] ,[SalesPersonID], Avg(SubTotal) As avg_subtotal , Sum(SubTotal) As sum_subtotal From [Sales].[SalesOrderHeader]  
Group By [CustomerID] , [SalesPersonID]
Order By[CustomerID] Desc;


--Question 9
Select [ProductID] , Sum([Quantity]) As total_quantity From [Production].[ProductInventory] 
Where [Shelf] = 'A' or [Shelf] ='C' or [Shelf] = 'H'
Group by [ProductID]
Having Sum([Quantity]) > 500 ;


--Question 10
Select Sum([Quantity])* 10 As total_quantity From [Production].[ProductInventory]
Group by [LocationID];


--Question 11
Select p.[BusinessEntityID] , p.[FirstName] , p.[LastName] , pp.[PhoneNumber] From [Person].[Person] p
Left join [Person].[PersonPhone] pp
 On p.[BusinessEntityID]= pp.[BusinessEntityID]
Where [LastName] like 'L%'
Order by p.[LastName] Asc, p.[FirstName] Asc;


--Question 12
Select [SalesPersonID] ,[CustomerID], Sum([SubTotal]) As sum_subtotal From [Sales].[SalesOrderHeader]
Where [SalesPersonID] Is not null
Group by [SalesPersonID] , [CustomerID] 
Order by [SalesPersonID] Asc;


--Question 13
Select [LocationID], [Shelf], Sum([Quantity]) As TotalQuantity From[Production].[ProductInventory]
Group by rollup ([LocationID] , [Shelf]);


--Question 14
Select [LocationID], [Shelf], Sum([Quantity]) As TotalQuantity From[Production].[ProductInventory]
Group by rollup([LocationID],  [Shelf])
Order by [LocationID],  [Shelf];


--Question 15
Select [LocationID] , Sum([Quantity]) As totalquantity From [Production].[ProductInventory]
Group by rollup([LocationID]) 
Order by [LocationID];


--Question 16
Select [City] , Count(*) As noofemployees From [Person].[Address]
Group by City 
Order by City Asc;


--Question 17
Select Year([OrderDate])As Year , Sum([TotalDue]) As OrderAmount  From[Sales].[SalesOrderHeader]
Group by Year([OrderDate])
Order by  Year([OrderDate]) Asc;


--Question 18
Select Year([OrderDate])As yearoforderdate , Sum([TotalDue]) As TotalDueOrder From[Sales].[SalesOrderHeader]
Group by Year([OrderDate])
Having Year([OrderDate]) <= 2016
Order by  Year([OrderDate]) Asc;

--Question 19
Select [ContactTypeID] ,[Name] From [Person].[ContactType]
Where [Name] like '%Manager%';


--Question 20
Select  p.[BusinessEntityID], p.[LastName],   p.[FirstName] From [Person].[Person] p
Inner join [Person].[BusinessEntityContact] bec
 On p.[BusinessEntityID] = bec.[BusinessEntityID]
Inner Join [Person].[ContactType] ct
 On bec.[ContactTypeID] = ct.[ContactTypeID]
Where ct.Name = 'Purchasing Manager'
Order by  p.[LastName] Asc, p.[FirstName] Asc;



--Question 21
Select Row_Number() Over (Partition by a.[PostalCode] Order by sp.[SalesYTD] Desc)  As RowNum, p.[LastName],sp.[SalesYTD],a.[PostalCode] From [Sales].[SalesPerson]  As sp
Join [Person].[Person] As p
  On sp.[BusinessEntityID] = p.[BusinessEntityID]
Join [Person].[BusinessEntityAddress] As bea
  On p.[BusinessEntityID] = bea.[BusinessEntityID]
Join [Person].[Address]  As a
   On bea.[AddressID] = a.[AddressID]
Where sp.[TerritoryID] Is not null   
  And sp.[SalesYTD] <> 0              
  And a.[PostalCode] Is not null 
Order by a.[PostalCode] Asc, RowNum Asc;


--Question 22
Select  ct.[ContactTypeID], ct.[Name]  As ContactTypeName, Count(*) As BusinessEntityContact From [Person].[BusinessEntityContact] As bec
Join [Person].[ContactType] As ct
   On bec.[ContactTypeID] = ct.[ContactTypeID]
Group by  ct.[ContactTypeID], ct.[Name] 
Having Count(*) >= 100
Order by BusinessEntityContact Desc;


--Question 23
Select Convert(date, eph.[RateChangeDate])  As RateChangeDate,
     p.[FirstName]  + ' ' +
     Isnull(p.[MiddleName]+ ' ', '') +
     p.[LastName] As NameInFull,
    (eph.[Rate] * 40)  As WeeklySalary
From [HumanResources].[EmployeePayHistory]eph
Join [HumanResources].[Employee] e
    On eph.[BusinessEntityID] = e.[BusinessEntityID]
Join [Person].[Person] p
    On p.[BusinessEntityID] = e.[BusinessEntityID]
Order by NameInFull Asc;


--Question 24
;With LatestRate  As (
Select
        eph.[BusinessEntityID],
        eph.[Rate],
        eph.[RateChangeDate],
        Row_number() Over  (
            Partition by eph.[BusinessEntityID]
            Order by eph.[RateChangeDate] Desc
        )  As rn
From [HumanResources].[EmployeePayHistory] eph
)
Select Convert(date, lr.[RateChangeDate])  As RateChangeDate,
     p.[FirstName]  + ' ' +
     Isnull(p.[MiddleName]+ ' ', '') +
     p.[LastName] As NameInFull,
    (lr.[Rate] * 40)  As WeeklySalary
From LatestRate lr
Join [HumanResources].[Employee] e
    On lr.[BusinessEntityID] = e.[BusinessEntityID]
Join [Person].[Person] p
    On p.[BusinessEntityID] = e.[BusinessEntityID]
Where lr.rn = 1
Order by NameInFull Asc;


--Question 25
Select
    sod.[SalesOrderID],
    sod.[ProductID],
    sod.[OrderQty],
    Sum(sod.[OrderQty]) Over  (Partition by sod.[SalesOrderID]) As SumOrderQty,
    Avg(sod.[OrderQty]) Over  (Partition by sod.[SalesOrderID])  As AvgOrderQty,
    Count(sod.[OrderQty])Over (Partition by sod.[SalesOrderID])  As CountOrderQty,
    Max(sod.[OrderQty]) Over (Partition by sod.[SalesOrderID])  As MaxOrderQty,
    Min(sod.[OrderQty])Over  (Partition by sod.[SalesOrderID])  As MinOrderQty
From [Sales].[SalesOrderDetail] sod
Where sod.[SalesOrderID] In (43659, 43664);

Selecting BusinessEntityID, LastName, and FirstName from multiple tables based on specified conditionsSELECT pp.BusinessEntityID, LastName, FirstName    
-- Retrieving BusinessEntityID, LastName, and FirstName columnsFROM Person.BusinessEntityContact AS pb      
-- Joining Person.BusinessEntityContact with Person.ContactType based on ContactTypeIDINNER JOIN Person.ContactType AS pc            
ON pc.ContactTypeID = pb.ContactTypeID         -- Joining Person.BusinessEntityContact with Person.Person based on BusinessEntityIDINNER JOIN Person.Person AS pp             ON pp.BusinessEntityID = pb.PersonID     -- Filtering the results to include only records where the ContactType Name is 'Purchasing Manager'WHERE pc.Name = 'Purchasing Manager'-- Sorting the results by LastName and FirstNameORDER BY LastName, FirstName;
 