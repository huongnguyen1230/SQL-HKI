CREATE DATABASE LAB12
GO
USE LAB12

								--EMPLOYEE--
CREATE TABLE EMPLOYEE(
	EmployeeID int PRIMARY KEY,
	Name varchar (100),
	Tel char(11),
	Email varchar (30)
)
SELECT * FROM EMPLOYEE
INSERT INTO EMPLOYEE VALUES(001, 'NGUYEN A', 1234321, 'asd@gmail.com')
INSERT INTO EMPLOYEE VALUES(002, 'NGUYEN B', 1233211, 'asb@gmail.com')
INSERT INTO EMPLOYEE VALUES(003, 'NGUYEN C', 1276521, 'asA@gmail.com')
INSERT INTO EMPLOYEE VALUES(004, 'NGUYEN D', 1238961, 'asG@gmail.com')
INSERT INTO EMPLOYEE VALUES(005, 'NGUYEN E', 1212321, 'asO@gmail.com')
								
								--PROJECT--
CREATE TABLE PROJECT(
	ProjectID int PRIMARY KEY,
	ProjectName varchar(30),
	StartDate datetime,
	EndDate datetime,
	Period int,
	Cost money
)
SELECT * FROM PROJECT
INSERT INTO PROJECT VALUES (101, 'CHINH PHU DIEN TU', 8-01-2020, 9-1-2020, 1, 1000)
INSERT INTO PROJECT VALUES (102, 'DFG', 8-15-2020, 9-15-2020, 1, 1000)
INSERT INTO PROJECT VALUES (103, 'ABC', 8-01-2020, 10-1-2020, 2, 2000)
						
						--GROUP--
CREATE TABLE GR0UP(
	GroupID int PRIMARY KEY,
	GroupName varchar (30),
	LeaderID int,
	ProjectID int
	CONSTRAINT FK_PID FOREIGN KEY (ProjectID) REFERENCES PROJECT
)
SELECT * FROM GR0UP
INSERT INTO GR0UP VALUES(20201, 'PURPLE', 001, 101)
INSERT INTO GR0UP VALUES(20202, 'PINK', 002, 102)
INSERT INTO GR0UP VALUES(20203, 'GREEN', 003, 103)

								--GROUP DETAIL--
CREATE TABLE GroupDetail(
	GroupID int,
	EmployeeID int,
	Status char(20),
	CONSTRAINT FK_GI FOREIGN KEY (GroupID) REFERENCES GR0UP,
	CONSTRAINT FK_EI FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE,
)
SELECT * FROM GroupDetail
INSERT INTO GroupDetail VALUES (20201, 001, 'DANG LAM')
INSERT INTO GroupDetail VALUES (20202, 002, 'DANG LAM')
INSERT INTO GroupDetail VALUES (20203, 003, 'DA LAM')



--CAU 3--
	--3.a hien thi thong tin nhan vien--
		SELECT * FROM EMPLOYEE
	--3.b hien thi nhan vien dang lam du an CHINH PHU DIEN TU--
		SELECT Name FROM EMPLOYEE em
		JOIN GroupDetail gd
		ON em.EmployeeID = gd.EmployeeID
		JOIN GR0UP gr
		ON gr.GroupID = gd.GroupID
		JOIN PROJECT pr
		ON pr.ProjectID = gr.ProjectID
		WHERE ProjectName = 'CHINH PHU DIEN TU'
	--3.c thong ke nhan vien lam viec moi nhom--
		SELECT EmployeeID, COUNT(*)  [nhan vien moi nhom]
		FROM GroupDetail
		GROUP BY EmployeeID
	--3.d liet ke thong tin ca nha cua truong nhom--
	--3.e--
		SELECT gd.GroupID, gr.GroupName, em.Name, em.EmployeeID, PROJECT.EndDate
		FROM GroupDetail gd
		JOIN GR0UP gr
		ON gr.GroupID = gd.GroupID
		JOIN EMPLOYEE em
		ON gd.EmployeeID = em.EmployeeID
		JOIN PROJECT 
		ON PROJECT.ProjectID = gr.ProjectID
		WHERE EndDate < 12/10/2020
	--3.f--
	--3.g--
		SELECT Name, Tel, Email 
		FROM EMPLOYEE 
		WHERE EmployeeID IN(
		SELECT EmployeeID
		FROM GroupDetail 
		WHERE Status = 'DA LAM')
--CAU 4--
	--4.a ngay hoan thanh du an phai sau ngay bat dau--
		ALTER TABLE PROJECT 
		ADD CHECK (StartDate < EndDate)
	--4.b ten nhan vien khong duoc null--
		ALTER TABLE EMPLOYEE
		ADD CHECK (Name is NOT NULL)
	--4.c status chi nhan 1 trong 3 gia tri SAP LAM, DANG LAM, DA LAM--
	--4.d Gia du an phia >= 1000
		ALTER TABLE PROJECT
		ADD CHECK (Cost >= 1000)
	--4.e truong nhom phai la nhan vien--
		SELECT LeaderID , em.Name, gd.EmployeeID
		FROM GR0UP gr
		JOIN GroupDetail gd
		ON gr.GroupID = gd.GroupID
		JOIN EMPLOYEE em
		ON em.EmployeeID = gd.EmployeeID
	--4.f dien thoai chi duoc nhap so va phai bat dau bang so 0--
		--ALTER TABLE EMPOLYEE
--CAU 5--
	--5.a--
		CREATE PROCEDURE Cost_project
		AS
		SELECT Cost * 10/100 FROM PROJECT
		WHERE Cost < 2000
		
		EXECUTE Cost_project
	--5.b--
		CREATE PROCEDURE Status_GD
		AS
		SELECT Status FROM GroupDetail 
		WHERE Status = 'SAP LAM'

		EXECUTE Status_GD
	--5.C--
		CREATE PROCEDURE Info_Project_Done
		AS
		SELECT gd.EmployeeID, gd.GroupID, gr.LeaderID, gr.GroupName, 
		gr.ProjectID, pj.StartDate,pj.EndDate, pj.ProjectName
		FROM GroupDetail gd
		JOIN GR0UP gr
		ON gr.GroupID = gd.GroupID
		JOIN PROJECT pj
		ON
		pj.ProjectID = gr.ProjectID
		WHERE Status = 'DA LAM'
		
		EXECUTE Info_Project_Done
--CAU 6--
	--6.a--
		CREATE INDEX IX_GROUP 
		ON GroupDetail (GroupID, EmployeeID)
	--6.b--
		CREATE INDEX IX_project 
		ON PROJECT (ProjectName, StartDate, EndDate)
--CAU 7--
	--7.a-	
		CREATE VIEW V_GroupDetail
		AS
		SELECT EmployeeID, GroupID FROM GroupDetail
		WHERE Status = 'DANG LAM'
	--7.b--
		CREATE VIEW V_EMPLOYEE
		AS
		SELECT em.Name, gr.GroupName, pj.ProjectName, gd.Status
		FROM GroupDetail gd
		JOIN EMPLOYEE em
		ON em.EmployeeID = gd.EmployeeID
		JOIN GR0UP gr
		ON gr.GroupID = gd.GroupID
		JOIN PROJECT pj
		ON pj.ProjectID = gr.ProjectID
