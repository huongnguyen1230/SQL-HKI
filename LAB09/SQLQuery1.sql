--tao co so du lieu--
CREATE DATABASE LAB11
GO
USE LAB11

--tao view--
CREATE VIEW ProductList
AS 
SELECT ProductID, Name FROM AdventureWorks2016CTP3.Production.Product

--su dung khung nhin vua tao bang truy van don gian--
SELECT*FROM ProductList