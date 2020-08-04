IF EXISTS (SELECT * FROM sys.databases WHERE Name='BookLibrary')
DROP DATABASE BookLibrary
GO
CREATE DATABASE BookLibrary
GO
USE BookLibrary
GO
--tao bang BOOK
CREATE TABLE Book(
	BookCode  INT ,
	BookTitle varchar (100)  NULL,
	Author varchar(50)  NOT NULL, 
	Edition INT, 
	BookPrice MONEY,
	Copies INT,
	CONSTRAINT PK_BOOK PRIMARY KEY (BookCode)
)
--chen du lieu
SELECT * FROM Book
INSERT INTO Book VALUES (1, 'HELLO', 'AB',10,50,100)
INSERT INTO Book VALUES (2, 'Good Morning', 'CD',10,50,100)

--tao bang MEMBER--
CREATE TABLE Member(
	MemberCode INT,
	Name varchar(50) NOT NULL,
	Address varchar (100) NOT NULL,
	PhoneNumber int UNIQUE,--Bo sung them Rang buoc duy nhat cho PhoneNumber cua bang Member
	CONSTRAINT PK_MEMBER PRIMARY KEY (MemberCode)
)
--chen du lieu--
SELECT * FROM Member
INSERT INTO Member VALUES (001, 'HUONG','HAI DUONG', 123432)
INSERT INTO Member VALUES (002, 'HELLO', 'HA NOI',1050100)

--tao bang IssueDetails--
CREATE TABLE IssueDetails(
	BookCode int NOT NULL,--Bo sung them Rang buoc NOT NULL cho Bookcode, membercode trong ID
	MemberCode int NOT NULL,
	IssueDate datetime,
	ReturnDate datetime,
	CONSTRAINT FK_BOOK FOREIGN KEY(BookCode) REFERENCES Book,
	CONSTRAINT FK_MEMBER FOREIGN KEY (MemberCode) REFERENCES Member,
)

--xoa bo cac rang buoc Khoa ngoai bang ID--
ALTER TABLE IssueDetails
	DROP CONSTRAINT FK_BOOK
ALTER TABLE IssueDetails
	DROP CONSTRAINT FK_MEMBER
--xoa Rang buoc Khoa chinh bang Member va Book
ALTER TABLE Book
	DROP CONSTRAINT PK_BOOK
ALTER TABLE Member
	DROP CONSTRAINT PK_MEMBER
--Bo sung them Rang buoc Gia ban sach >0,<200

