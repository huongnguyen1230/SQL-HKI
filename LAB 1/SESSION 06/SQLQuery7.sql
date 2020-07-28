USE AdventureWorks2016CTP3
SELECT SalesPersonID, YEAR(OrderDate) AS OrderYear
From Sales.SalesOrderHeader
WHERE CustomerID = 30084
GROUP BY SalesPersonID, YEAR(OrderDate)
HAVING COUNT(*)>1
ORDER BY SalesPersonID, OrderYear;