IF EXISTS (SELECT * FROM sys.databases WHERE Name='Practice')
DROP DATABASE Practice
GO
CREATE DATABASE Practice
GO
USE Practice
GO
--tao bang Students--
CREATE TABLE Students(
	StudentID INT NOT NULL,
	StudentName varchar (40) NOT NULL,
	Birth DateTime,
	CONSTRAINT PK_STUDENTS PRIMARY KEY (StudentID)
)
--chen 5 bang ghi--
INSERT INTO Students VALUES (001, 'Huong', NULL)
INSERT INTO Students VALUES (002, 'Lan', NULL)
INSERT INTO Students VALUES (003, 'Hoa', NULL)
INSERT INTO Students VALUES (004, 'Mai', NULL)
INSERT INTO Students VALUES (005, 'Ngan', NULL)
GO
SELECT * FROM Students
GO
--update--
UPDATE Students SET StudentName = 'HUONG' WHERE StudentID = 001
SELECT * FROM dbo.Students WHERE StudentID = 001
--Delete--
DELETE FROM Students WHERE StudentName = 'Mai'
SELECT * FROM Students

							--tao bang Class--
CREATE TABLE Class(
	ClassID INT,
	ClassName varchar (10),
	CONSTRAINT PK_CLASS PRIMARY KEY (ClassID)
)
--chen 5 bang ghi--
INSERT INTO Class VALUES (1, 'T2004M')
INSERT INTO Class  VALUES (2, 'T2004E')
INSERT INTO Class  VALUES (3, 'T2004A')
INSERT INTO Class  VALUES (4, 'T2003M')
INSERT INTO Class  VALUES (5, 'T2003E')
GO
SELECT * FROM Class 
GO
--Update--
UPDATE Class SET ClassName = 't2004m' WHERE ClassName = 'T2004M'
SELECT * FROM dbo.Class WHERE ClassName = 'T2004M'
--delete-
DELETE FROM Class WHERE ClassName = 'T2004E';

						--tao  bang ClassDetails--
CREATE TABLE ClassDetails(
	StudentID INT NULL,
	StudentName varchar (100)  NULL,
	CLassID INT NULL,
	StartClass Date NOT NULL,
	EndClass Date NOT NULL,
	CONSTRAINT FK_STUDENTS FOREIGN KEY(StudentID) REFERENCES Students,
	CONSTRAINT FK_CLASS FOREIGN KEY (ClassID) REFERENCES Class
)
--chen bang ghi--
INSERT INTO dbo.ClassDetails VALUES (001,'Huong', 1, '10-04-2020', '10-04-2022')
GO
SELECT * FROM ClassDetails 
GO

