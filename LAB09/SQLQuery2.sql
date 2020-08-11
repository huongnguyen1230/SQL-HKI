USE AdventureWorks2016CTP3

--tao view--
CREATE VIEW SaleOrderDetail
AS
SELECT pr.ProductID, pr.Name, od.UnitPrice, od.OrderQty,
	od.UnitPrice * od.OrderQty as [Total Price]
FROM AdventureWorks2016CTP3.Sales.SalesOrderDetail od
JOIN AdventureWorks2016CTP3.Production.Product pr
ON od.ProductID = pr.ProductID

SELECT * FROM SaleOrderDetail