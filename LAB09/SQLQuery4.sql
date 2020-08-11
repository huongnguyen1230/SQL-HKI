USE LAB09

				--tao bang CLASS--
CREATE TABLE CLASS(
	ClassCode varchar (10),
	HeadTeacher varchar (10),
	Room varchar (30),
	TimeSlot char,
	CloseDate datetime
	CONSTRAINT PK_CC PRIMARY KEY (ClassCode)
)
--chen5 ban ghi--
SELECT * FROM CLASS
INSERT INTO CLASS VALUES ('T2004', 'Mr.TOM', 'Class01', 'G', 30-12-2022)
INSERT INTO CLASS VALUES ('T2005', 'Mr.TOM', 'Class02', 'A', 30-12-2022)
INSERT INTO CLASS VALUES ('T2003', 'Mr.TOM', 'Class03', 'G', 30-12-2022)
INSERT INTO CLASS VALUES ('T2002', 'Mr.TOM', 'Class04', 'E', 30-12-2022)
INSERT INTO CLASS VALUES ('T2006', 'Mr.TOM', 'Class05', 'E', 30-12-2022)


				--tao bang STUDENT--
CREATE TABLE STUDENT (
	RollNo varchar (10),
	ClassCode varchar(10),
	FullName varchar(30),
	Male bit ,
	BirthDate datetime,
	Address varchar(30) NULL,
	Province char(2),
	Email varchar(30)
	CONSTRAINT PK_RN PRIMARY KEY (RollNo)
	CONSTRAINT FK_ClassCode FOREIGN KEY (ClassCode) REFERENCES CLASS
)
--chen 5 ban ghi--
SELECT * FROM STUDENT
INSERT INTO STUDENT VALUES ('A001', 'T2004', 'NGUYEN VAN A', 1, 1-1-1997,null,'HN', 'abc@gmail')
INSERT INTO STUDENT VALUES ('A002', 'T2005', 'NGUYEN THI B', 0, 11-11-1999,null, 'HP', 'cbv@gmail')
INSERT INTO STUDENT VALUES ('A003', 'T2003', 'NGUYEN VAN C', 1, 23-1-2001,null, 'HD', 'fgh@gmail')
INSERT INTO STUDENT VALUES ('A004', 'T2002', 'HOANG THI A', 0, 4-2-1999,null, 'TB', 'asd@gmail')
INSERT INTO STUDENT VALUES ('A005', 'T2006', 'PHAM VAN B', 0, 6-7-1995,null, 'NA', 'qwe@gmail')

				--tao bang SUBJECT--
CREATE TABLE SUBJECT (
	SubjectCode varchar(10),
	SubjectName varchar(40),
	WTest bit,
	PTest bit,
	WTest_per int,
	PTest_per int
	CONSTRAINT PK_SC PRIMARY KEY (SubjectCode)
)
--chen ban ghi--
SELECT * FROM SUBJECT
INSERT INTO SUBJECT VALUES ('A01', 'C PROGRAM', 1,1,40,60)
INSERT INTO SUBJECT VALUES ('A02', 'JAVASCRIPT',1,1,40,60)
INSERT INTO SUBJECT VALUES ('A03', 'SQL',1,1,40,60)
INSERT INTO SUBJECT VALUES ('A04', 'HTML',1,1,40,60)
INSERT INTO SUBJECT VALUES ('A05', 'CSS',1,1,40,60)


				--tao bang MARK--
CREATE TABLE MARK(
	RollNo varchar (10),
	SubjectCode varchar(10),
	WMark float,
	PMark float,
	Mark float
	CONSTRAINT FK_RollNo FOREIGN KEY (RollNo) REFERENCES STUDENT,
	CONSTRAINT FK_SubjectCode FOREIGN KEY (SubjectCode) REFERENCES SUBJECT
)
--chen ban ghi--
SELECT * FROM MARK
INSERT INTO MARK VALUES ('A001', 'A01',60,60,60)
INSERT INTO MARK VALUES ('A002', 'A02',40,70,55)
INSERT INTO MARK VALUES ('A003', 'A03',70,80,75)
INSERT INTO MARK VALUES ('A004', 'A04',70,90,80)
INSERT INTO MARK VALUES ('A005', 'A05',80,60,70)

--create view--
CREATE VIEW V_student AS
SELECT st.RollNo, mk.WMArk, mk.PMark 
FROM STUDENT st
JOIN MARK mk
ON st.RollNo = mk.RollNo
GO
--CREATE VIEW--
CREATE VIEW TRUOT_MON AS
SELECT RollNo, WMark, PMark FROM MARK
WHERE WMark < 40 OR PMark < 60

--4--
CREATE VIEW V_SlotTime AS
SELECT TimeSlot FROM CLASS
WHERE TimeSlot = 'G'

--5--
CREATE VIEW HeadTeacher_V AS
SELECT HeadTeacher, Roll FROM CLASS
