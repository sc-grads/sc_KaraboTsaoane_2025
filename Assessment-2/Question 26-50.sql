--Question 26
SELECT [SalesOrderID] AS ordernumber,
       [ProductID] ,
	   [OrderQty] AS quantity,
       SUM([OrderQty]) OVER (ORDER BY [SalesOrderID], [ProductID]) AS total,
       AVG(CAST([OrderQty]  AS DECIMAL(5 , 2))) AS Avg,
	   COUNT (*) OVER (ORDER BY [SalesOrderID], [ProductID]) AS count 
FROM [Sales].[SalesOrderDetail]
WHERE [SalesOrderID] IN (43659, 43664) 
	  AND [ProductID] LIKE '71%'
ORDER BY SalesOrderID, ProductID , OrderQty ;


--Question 27
SELECT [SalesOrderID] ,
	   SUM([UnitPrice] * [OrderQty]) AS Orderidcost
FROM [Sales].[SalesOrderDetail]
GROUP BY [SalesOrderID]
HAVING SUM([UnitPrice] * [OrderQty]) > 100000;


--Question 28
SELECT [ProductID],
	   [Name]
FROM [Production].[Product]
WHERE [Name] LIKE 'Lock Washer%'
ORDER BY ProductID ASC;


--Question 29
SELECT [ProductID],
	   [Name],
       [Color]
FROM[Production].[Product]
ORDER BY [ListPrice];


--Question 30
SELECT [BusinessEntityID], 
	   [JobTitle],
	   [HireDate]
FROM HumanResources.Employee
ORDER BY YEAR(HireDate) ASC;


--Question 31
SELECT [LastName],
	   [FirstName] 
FROM [Person].[Person]
WHERE[LastName] LIKE 'R%'
ORDER BY [FirstName] ASC , [LastName] DESC;


--Question 32
SELECT 
    [BusinessEntityID],
    [SalariedFlag]
FROM [HumanResources].[Employee]
ORDER BY [SalariedFlag],
    CASE WHEN [SalariedFlag] = 1 THEN [BusinessEntityID] END DESC,   
    CASE WHEN [SalariedFlag] = 0 THEN [BusinessEntityID] END ASC;   

--Question 33
SELECT sp.[BusinessEntityID],
       p.[LastName],
       st.[Name] AS TerritoryName,
       cr.[Name] AS CountryRegionName
FROM Sales.SalesPerson sp
JOIN Person.Person p
    ON sp.BusinessEntityID = p.BusinessEntityID
JOIN Sales.SalesTerritory st
    ON sp.TerritoryID = st.TerritoryID
JOIN Person.CountryRegion cr
    ON st.CountryRegionCode = cr.CountryRegionCode
ORDER BY
    CASE
        WHEN cr.Name = 'United States' THEN st.Name       
        ELSE cr.Name                                      
    END;


--Question 35
SELECT *
FROM [HumanResources].[Department]
ORDER BY [DepartmentID]
OFFSET 10 ROWS;


--Question 36
SELECT *
FROM [HumanResources].[Department]
ORDER BY [DepartmentID]
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY; 

--Question 37
SELECT [Name],
	   [Color],
	   [ListPrice]
FROM [Production].[Product] 
WHERE Color = 'Red' or Color ='Blue';


--Question 38
SELECT 
    p.Name ,
    sod.SalesOrderID
FROM Production.Product p
FULL OUTER JOIN Sales.SalesOrderDetail sod
    ON p.ProductID = sod.ProductID
ORDER BY 
    p.Name;   

--Question 39
SELECT 
    p.Name AS ProductName,
    s.SalesOrderID
FROM 
    Production.Product p
LEFT JOIN 
    Sales.SalesOrderDetail s
ON 
    p.ProductID = s.ProductID
ORDER BY 
    p.Name;


--Question 40
SELECT 
    p.Name ,
    s.SalesOrderID
FROM 
    Production.Product p
LEFT JOIN 
    Sales.SalesOrderDetail s
ON 
    p.ProductID = s.ProductID
WHERE 
    s.SalesOrderID IS NOT NULL
ORDER BY 
    p.Name;


--Question 41
SELECT 
    t.Name AS territory,
    sp.BusinessEntityID
FROM 
    Sales.SalesPerson sp
LEFT JOIN 
    Sales.SalesTerritory t
ON 
    sp.TerritoryID = t.TerritoryID
ORDER BY 
    t.Name;


--Question 42
SELECT 
    p.FirstName + ' ' + p.LastName AS FullName,
    a.City
FROM 
    HumanResources.Employee e
JOIN 
    Person.Person p
        ON e.BusinessEntityID = p.BusinessEntityID
JOIN 
    Person.BusinessEntityAddress bea
        ON e.BusinessEntityID = bea.BusinessEntityID
JOIN 
    Person.Address a
        ON bea.AddressID = a.AddressID
ORDER BY 
    p.LastName,
    p.FirstName;


-- Question 43
SELECT d.BusinessEntityID,d.FirstName,d.LastName
FROM 
    (
      SELECT BusinessEntityID,FirstName,LastName,PersonType
      FROM Person.Person
    ) AS d
WHERE d.PersonType = 'IN' AND d.LastName = 'Adams'
ORDER BY d.FirstName ASC;
 
-- Question 44
SELECT BusinessEntityID, 
	   FirstName, 
	   LastName
FROM Person.Person
WHERE BusinessEntityID <= 1500 AND LastName LIKE 'Al%' AND FirstName LIKE 'M%';
 
-- Question 45
 SELECT 
    p.ProductID,
    p.Name,
    p.Color
FROM 
    Production.Product p
JOIN 
    (SELECT 'Blade' AS ProductName
     UNION ALL SELECT 'Crown Race'
     UNION ALL SELECT 'AWC Logo Cap') AS dt
ON 
    p.Name = dt.ProductName;

 
-- Question 46
SELECT SalesPersonID,
	   COUNT(SalesOrderID) AS TotalSales, 
	   YEAR(OrderDate) AS SalesYear
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
GROUP BY SalesPersonID, YEAR(OrderDate)
ORDER BY SalesPersonID, YEAR(OrderDate);
 
 
-- Question 47
SELECT 
    AVG(TotalSales) AS [Average Sales Per Person]
FROM 
    (
      SELECT SalesPersonID, 
	  COUNT(SalesOrderID) AS TotalSales
           FROM Sales.SalesOrderHeader
           WHERE SalesPersonID IS NOT NULL
           GROUP BY SalesPersonID
    ) AS SalesTotals;


-- Question 48
SELECT *
FROM Production.ProductPhoto
WHERE LargePhotoFileName LIKE '%green_%';
 
-- Question 49
SELECT 
    a.AddressLine1,
    a.AddressLine2,
    a.City,
    a.PostalCode,
    sp.CountryRegionCode
FROM Person.Address a
INNER JOIN Person.StateProvince sp 
    ON a.StateProvinceID = sp.StateProvinceID
WHERE sp.CountryRegionCode <> 'US'
  AND a.City LIKE 'Par%'
ORDER BY a.City , a.AddressLine1;
 
-- Question 50
SELECT TOP 20 JobTitle, 
			HireDate
FROM HumanResources.Employee
ORDER BY HireDate DESC;
 