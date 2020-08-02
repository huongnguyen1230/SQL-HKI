USE AdventureWorks2016CTP3
SELECT * FROM Person.Person
SELECT Title, FirstName, LastName FROM Person.Person
  SELECT Title + '.' +FirstName + ' ' + LastName AS 'Person Name' FROM Person.Person

  SELECT * FROM Person.Address
SELECT DISTINCT (City) FROM Person.Address
SELECT TOP 10 * FROM Person.Address
SELECT TOP 25 PERCENT * FROM Person.Address

SELECT * FROM HumanResources.EmployeePayHistory
SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory
SELECT COUNT (BusinessEntityID) FROM HumanResources.EmployeePayHistory