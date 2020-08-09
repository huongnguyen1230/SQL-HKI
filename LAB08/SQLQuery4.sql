IF EXISTS (SELECT * FROM sys.databases WHERE Name='RiverPlate')
DROP DATABASE RiverPlate
GO
CREATE DATABASE RiverPlate
GO
USE RiverPlate 
GO
--tao bang student--
CREATE TABLE Student(
	StudentNo int,
	StudentName varchar(50),
	StudentAddress varchar (100),
	PhoneNo int
	CONSTRAINT PK_StudentNo PRIMARY KEY (StudentNo)
)

--tao bang Department--
CREATE TABLE Department(
	DeptNo int,
	DeptName varchar (50),
	ManagerName char (30),
	CONSTRAINT PK_DeptNo PRIMARY KEY (DeptNo) 
)

--tao bang Assignment--
CREATE TABLE Assignment(
	AssignmentNo int,
	Description varchar(100),
	CONSTRAINT PK_AssignmentNo PRIMARY KEY (AssignmentNo)
)

--tao bang Works_Assign--
CREATE TABLE Works_Assign(
	JobID int,
	StudentNo int,
	AssignmentNo int,
	TotalHours int,
	JobDetails XML,
	CONSTRAINT PK_JobID PRIMARY KEY (JobID),
	CONSTRAINT FK_StudentNo FOREIGN KEY (StudentNo) REFERENCES Student,
	CONSTRAINT FK_AssignmentNo FOREIGN KEY (AssignmentNo) REFERENCES Assignment  
)

--Tao 1 CLUSTERED INDEX--
CREATE CLUSTERED INDEX IX_Student ON Student(StudentNo)
--Chinh sua va xay dung lai IX_Student--
ALTER INDEX IX_Student ON Student REBUILD WITH (FILLFACTOR = 100)
--tao 1 notclustered--
CREATE NONCLUSTERED INDEX IX_Dept ON Department(DeptNo, DeptName ,ManagerNo)

