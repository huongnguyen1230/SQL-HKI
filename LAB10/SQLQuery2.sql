CREATE DATABASE ToyzUnlimited
GO
USE ToyzUnlimited

--tao bnag TOYS--
CREATE TABLE TOYS (
	ProductCode varchar(5),
	Name varchar (30),
	Category varchar(30),
	Manufacturer varchar(40),
	AgeRange varchar (15),
	UnitPrice money,
	Netweight int,
	QtyOnHand int
	CONSTRAINT PK_PC PRIMARY KEY (ProductCode)
)


				--PHAN III BAI TAP TU LAM--
--1--
	SELECT * FROM TOYS 
	INSERT INTO TOYS VALUES ('A01', 'ROBOT', 'LAP GHEP', 'ABC', 10, 100, 500, 50)
	INSERT INTO TOYS VALUES ('A02', 'QUEST', 'CAU DO', 'ABC', 7, 50, 100, 30)
	INSERT INTO TOYS VALUES ('A03', 'CHICKEN FLY', 'GAME', 'ABC', 10, 500, 500, 70)
	INSERT INTO TOYS VALUES ('A04', 'DOLL', 'LAP GHEP', 'ABC', 7, 300, 700, 40)
	INSERT INTO TOYS VALUES ('A05', 'BABIES HOUSE', 'LAP GHEP', 'ABC', 10, 1000, 700, 80)
	INSERT INTO TOYS VALUES ('A06', 'FISHING', 'GAME', 'ABC', 5, 500, 300, 50)
	INSERT INTO TOYS VALUES ('A07', 'FRUIT CARD', 'CAU DO', 'ABC', 3, 100, 50, 30)
	INSERT INTO TOYS VALUES ('A08', 'ANIMALS CARD', 'CAU DO', 'ABC',3, 100, 70, 50)
	INSERT INTO TOYS VALUES ('A09', 'COOKING', 'GAME', 'ABC', 5, 300, 500, 60)
	INSERT INTO TOYS VALUES ('A10', 'CAR', 'GAME', 'ABC', 5, 500, 300, 30)

--2--
	CREATE PROCEDURE HeavyToys
	AS
	SELECT Category FROM TOYS
	WHERE Netweight > 500

--3--
	CREATE PROCEDURE PriceIncrease 
	AS
	SELECT UnitPrice + 10 AS [cho phep tang 10 don vi gia] FROM TOYS

--4--
	CREATE PROCEDURE QtyOnHand
	AS
	SELECT QtyOnHand - 5 AS [cho phep giam 5 don vi ] FROM TOYS

--5--
	EXECUTE HeavyToys
	EXECUTE PriceIncrease
	EXECUTE QtyOnHand


				--PHAN IV BAI TAP VE NHA--
--1--
	EXECUTE sp_helptext HeavyToys
	EXECUTE sp_helptext PriceIncrease
	EXECUTE sp_helptext QtyOnHand

	
	SELECT * FROM sys.sql_modules

	SELECT OBJECT_DEFINITION (OBJECT_ID (N'HeavyToys'))
	SELECT OBJECT_DEFINITION (OBJECT_ID (N'PriceInscrease'))
	SELECT OBJECT_DEFINITION (OBJECT_ID (N'QtyOnHand'))

--2 hien thi doi tuong phu thuoc --
	EXECUTE sp_depends HeavyToys
	EXECUTE sp_depends PriceIncrease
	EXECUTE sp_depends QtyOnHand

--3--
--4--
	CREATE PROCEDURE SpecificPriceIncrease 
	AS
	BEGIN
	UPDATE TOYS SET UnitPrice = QtyOnHand + UnitPrice
	END
--5--
--6--
--7--
--8--
	DROP PROCEDURE HeavyToys
	DROP PROCEDURE PriceIncrease
	DROP PROCEDURE QtyOnHand
	