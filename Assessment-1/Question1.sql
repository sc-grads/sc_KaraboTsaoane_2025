--Question 1
Select * From [HumanResources].[Employee]
Order by JobTitle Asc;


--Question 2
Select * From [Person].[Person] As Employee
Order by LastName Asc;


--Question 3
Select[FirstName] ,[LastName], [BusinessEntityID] As Employee_id From [Person].[Person]
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
Group by CustomerID
Order by CustomerID Asc;


--Question 8
Select  [CustomerID] ,[SalesPersonID], Avg(SubTotal) As avg_subtotal , Sum(SubTotal) As sum_subtotal From [Sales].[SalesOrderHeader]  
Group By [CustomerID] , [SalesPersonID]
Order By[CustomerID] Desc;


--Question 9
Select [ProductID] , Sum([Quantity]) AS total_quantity From [Production].[ProductInventory] 
Where [Shelf] = 'A' or [Shelf] ='C' or [Shelf] = 'H'
Group by [ProductID]
Having Sum([Quantity]) > 500 ;


--Question 10
Select Sum([Quantity])*10 AS total_quantity From [Production].[ProductInventory]
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
Order by City Asc


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
        On p.[BusinessEntityID] = bec.[PersonID]
    Inner Join [Person].[ContactType] ct
        On bec.[ContactTypeID] = ct.[ContactTypeID]
Where
    ct.Name = 'Purchasing Manager'
Order by  p.[LastName] Asc, p.[FirstName] Asc;

--Question 21
SELECT
  ROW_NUMBER() OVER (PARTITION BY a.PostalCode ORDER BY sp.SalesYTD DESC) AS RowNum,
  p.LastName,
  sp.SalesYTD,
  a.PostalCode
FROM Sales.SalesPerson AS sp
JOIN Person.Person AS p
  ON sp.BusinessEntityID = p.BusinessEntityID
JOIN Person.BusinessEntityAddress AS bea
  ON p.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address AS a
  ON bea.AddressID = a.AddressID
WHERE sp.TerritoryID IS NOT NULL    -- salesperson "belongs to a territory"
  AND sp.SalesYTD <> 0              -- SalesYTD is not zero
  AND a.PostalCode IS NOT NULL
ORDER BY a.PostalCode ASC, RowNum ASC;


--Question 22
SELECT
  ct.ContactTypeID,
  ct.Name AS ContactTypeName,
  COUNT(*) AS BusinessEntityContact
FROM Person.BusinessEntityContact AS bec
JOIN Person.ContactType AS ct
  ON bec.ContactTypeID = ct.ContactTypeID
GROUP BY
  ct.ContactTypeID,
  ct.Name
HAVING
  COUNT(*) >= 100
ORDER BY
  BusinessEntityContact DESC;


--Question 23
SELECT
    CONVERT(date, eph.RateChangeDate) AS RateChangeDate,
    LTRIM(
        RTRIM(
            p.FirstName + ' ' +
            ISNULL(p.MiddleName + ' ', '') +
            p.LastName
        )
    ) AS NameInFull,
    (eph.Rate * 40) AS WeeklySalary
FROM HumanResources.EmployeePayHistory eph
JOIN HumanResources.Employee e
    ON eph.BusinessEntityID = e.BusinessEntityID
JOIN Person.Person p
    ON p.BusinessEntityID = e.BusinessEntityID
ORDER BY
    NameInFull ASC;


--Question 24
;WITH LatestRate AS (
    SELECT
        eph.BusinessEntityID,
        eph.Rate,
        eph.RateChangeDate,
        ROW_NUMBER() OVER (
            PARTITION BY eph.BusinessEntityID 
            ORDER BY eph.RateChangeDate DESC
        ) AS rn
    FROM HumanResources.EmployeePayHistory eph
)
SELECT
    CONVERT(date, lr.RateChangeDate) AS RateChangeDate,
    LTRIM(RTRIM(
        p.FirstName + ' ' + 
        ISNULL(p.MiddleName + ' ', '') + 
        p.LastName
    )) AS NameInFull,
    (lr.Rate * 40) AS WeeklySalary
FROM LatestRate lr
JOIN HumanResources.Employee e
    ON lr.BusinessEntityID = e.BusinessEntityID
JOIN Person.Person p
    ON p.BusinessEntityID = e.BusinessEntityID
WHERE lr.rn = 1
ORDER BY NameInFull ASC;


--Question 25
SELECT
    sod.SalesOrderID,
    sod.ProductID,
    sod.OrderQty,
    SUM(sod.OrderQty) OVER (PARTITION BY sod.SalesOrderID) AS SumOrderQty,
    AVG(sod.OrderQty) OVER (PARTITION BY sod.SalesOrderID) AS AvgOrderQty,
    COUNT(sod.OrderQty) OVER (PARTITION BY sod.SalesOrderID) AS CountOrderQty,
    MAX(sod.OrderQty) OVER (PARTITION BY sod.SalesOrderID) AS MaxOrderQty,
    MIN(sod.OrderQty) OVER (PARTITION BY sod.SalesOrderID) AS MinOrderQty
FROM Sales.SalesOrderDetail sod
WHERE sod.SalesOrderID IN (43659, 43664);
