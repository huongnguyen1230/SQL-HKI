USE AdventureWorks2016CTP3

--BAI 1--
CREATE PROCEDURE Display_Customers
AS 
SELECT CustomerID, AccountNumber, rowguid, ModifiedDate FROM Sales.Customer

EXECUTE Display_Customers

--BAI 2--
EXECUTE xp_fileexist 'c:\myTest.txt'

--BAI 3--
EXECUTE sys.sp_who