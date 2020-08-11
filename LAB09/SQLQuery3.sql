 CREATE DATABASE LAB09
GO
USE LAB09

						--tao bang BOOKSOLD--
CREATE TABLE BOOKSOLD(
	BookSoldID int,
	CustomerID int,
	BookCode int,
	Date datetime,
	Price int,
	Amount int
	CONSTRAINT PK_BS PRIMARY KEY (BookSoldID)
)
--chen 10 ban ghi--
SELECT * FROM BOOKSOLD
INSERT INTO BOOKSOLD VALUES (1, 100, 001, 1-12-2019, 400,1)
INSERT INTO BOOKSOLD VALUES (2, 101, 002, 1-12-2019, 200,5)
INSERT INTO BOOKSOLD VALUES (3, 102, 003, 1-12-2019, 100,6)
INSERT INTO BOOKSOLD VALUES (4, 103, 004, 1-12-2019, 200,2)
INSERT INTO BOOKSOLD VALUES (5, 104, 005, 1-12-2019, 100,3)
INSERT INTO BOOKSOLD VALUES (6, 105, 006, 1-12-2019, 430,4)
INSERT INTO BOOKSOLD VALUES (7, 106, 007, 1-12-2019, 230,5)
INSERT INTO BOOKSOLD VALUES (8, 107, 008, 1-12-2019, 120,6)
INSERT INTO BOOKSOLD VALUES (9, 108, 009, 1-12-2019, 200,2)
INSERT INTO BOOKSOLD VALUES (10, 109, 010, 1-12-2019,100,3)


							--tao bang BOOKS--
CREATE TABLE BOOKS(
	BookCode int NOT NULL,
	Category varchar(50),
	Author varchar(50),
	Publisher varchar(50),
	Title varchar (100),
	Price int,
	Instore int
	CONSTRAINT FK_BC FOREIGN KEY (BookCode) REFERENCES BOOKSOLD
)
--chen 5 ban ghi--
SELECT * FROM BOOKS
INSERT INTO BOOKS VALUES (001, 'VAN HOC', 'NGUYEN A','KIM DONG', 'ABC',430,20)
INSERT INTO BOOKS VALUES (002, 'KINH TE', 'NGUYEN B','KIM DONG', 'DFG',230,30)
INSERT INTO BOOKS VALUES (003, 'CHINH TRI', 'NGUYEN C','KIM DONG', 'ASD',120,40)
INSERT INTO BOOKS VALUES (004, 'TOAN HOC', 'NGUYEN D','KIM DONG', 'FGH', 200,50)
INSERT INTO BOOKS VALUES (005, 'NGHE THUAT', 'NGUYEN E','KIM DONG', 'ERT',100,70)



							--tao bang Customers--
CREATE TABLE CUSTOMERS(
	CustomerID int,
	CustomerName varchar(50),
	Address varchar(100),
	Phone varchar(12)
	CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES BOOKSOLD
)
--chen 5 ban ghi--
SELECT * FROM CUSTOMERS
INSERT INTO CUSTOMERS VALUES (100, 'TOM', 'VIETNAM', 123321)
INSERT INTO CUSTOMERS VALUES (101, 'HARLEY', 'AMERICA', 234432)
INSERT INTO CUSTOMERS VALUES (102, 'JOHN', 'ENGLAND', 345543)
INSERT INTO CUSTOMERS VALUES (104, 'ARMY', 'KOREA', 130613)
INSERT INTO CUSTOMERS VALUES (105, 'TINYTAN', 'KOREA', 567765)

--TAO 1 KHUNG NHIN CHUA DANH SACH CAC CUON SACH KEM SO SACH DA BAN DUOC--
CREATE VIEW V_books AS
SELECT bk.BookCode, bk.Title, bk.Price, bs.Amount*5 AS [TOTAL] 
FROM BOOKS bk
JOIN BOOKSOLD bs
ON bk.BookCode = bs.BookCode
GO

--TAO 1 KHUNG NHIN CHUA DANH SACH KHACH HANG KEM SO LUONG SACH KHACH DO DA MUA--
CREATE VIEW V_customer AS
SELECT cs.CustomerID, cs.CustomerName, cs.Address, bs.Amount 
FROM CUSTOMERS cs
JOIN BOOKSOLD bs
ON cs.CustomerID = bs.CustomerID
GO

--TAO 1 KHUNG NHIN CHUA DANH SACH KHACH HANG MUA THANG TRUOC KEM TEN SACH KHACH DO DA MUA--

--SELECT DATEOFMONTH ( '1-12-2019')
--SELECT cus.CustomerID, cus.CustomerName, cus.Address, bs.Date, bk.Title
--FROM CUSTOMERS cus
--JOIN BOOKS bk
--JOIN BOOKSOLD bs
--ON bs.CustomerID = cus.Customer
--ON bs.BookCode = bk.BookCode
--GO

--khach hang kem tien moi khach mua--
CREATE VIEW Customer_V AS
SELECT CustomerID, Price*Amount AS ['tien moi lan mua']
FROM BOOKSOLD