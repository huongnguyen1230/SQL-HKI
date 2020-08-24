
--1.--
	IF EXISTS (SELECT * FROM sys.databases WHERE Name='MyBlog')
	DROP DATABASE MyBlog
	GO
	CREATE DATABASE MyBlog
	GO
	USE MyBlog
	GO

--2.--
--tao bang users--
	CREATE TABLE USERS(
	UserID int IDENTITY,
	UserName varchar(20),
	Password varchar(30),
	Email varchar (30) UNIQUE,
	Address nvarchar (200),
	CONSTRAINT PK_ID PRIMARY KEY (UserID) 
)
--tao bang Post--
	CREATE TABLE POSTS(
	PostID int IDENTITY,
	Title nvarchar (200),
	Content nvarchar(100),
	Tag nvarchar(100),
	Status bit,
	CreateTime datetime,
	UpdateTime datetime,
	UserID int,
	CONSTRAINT PK_PostID PRIMARY KEY (PostID),
	CONSTRAINT FK_UserID FOREIGN KEY (UserID) REFERENCES USERS

)
--tao bang comments--
	CREATE TABLE COMMENTS(
	CommentID int IDENTITY,
	Content nvarchar(200),
	Status bit,
	CreateTime datetime,
	Author nvarchar (30),
	Email  nvarchar(50) NOT NULL,
	PostID int,
	CONSTRAINT PK_CmID PRIMARY KEY (CommentID),
	CONSTRAINT FK_PostID FOREIGN KEY (PostID) REFERENCES POSTS
)

--3.--
	ALTER TABLE POSTS 
		ADD CONSTRAINT ck_Email CHECK ( ck_Email LIKE '%@%')
	
	ALTER TABLE COMMENTS
		ADD CONSTRAINT ck_EmailComment CHECK (ck_EmailComment LIKE '%@%') 
--4.--
	CREATE UNIQUE Clustered INDEX IX_UserName
	ON USERS(UserName)
--5.--
	SELECT * FROM USERS
	INSERT INTO USERS VALUES ( 'NGUYEN A', '@12345', 'nguyena@gmail.com', 'HaNoi')
	INSERT INTO USERS VALUES ( 'NGUYEN B', '@54321', 'nguyenB@gmail.com', 'HaNoi')
	INSERT INTO USERS VALUES ( 'NGUYEN A', '@67895', 'nguyenC@gmail.com', 'HaNoi')

	SELECT * FROM POSTS 
	INSERT INTO POSTS VALUES ('XA HOI', 'WELCOME TO MY WORLD', 'Social', 1,CURRENT_TIMESTAMP, NULL, 1) 
	INSERT INTO POSTS VALUES ('AN NINH', 'WELCOME TO MY WORLD', 'Entertaiment', 0,CURRENT_TIMESTAMP, NULL, 2) 
	INSERT INTO POSTS VALUES ('AM NHAC', 'WELCOME TO MY WORLD', 'Entertaiment', 1,CURRENT_TIMESTAMP, NULL, 3) 

	SELECT * FROM COMMENTS
	INSERT INTO COMMENTS VALUES ('Good', 1, CURRENT_TIMESTAMP, 'NGUYEN A', 'nguyena@gmail.com',1)
	INSERT INTO COMMENTS VALUES ('Good', 0, CURRENT_TIMESTAMP, 'NGUYEN B', 'nguyenB@gmail.com',2)
	INSERT INTO COMMENTS VALUES ('Awesome', 1, CURRENT_TIMESTAMP, 'NGUYEN C', 'abc@gmail.com',3)
--6.--
  SELECT * FROM POSTS
  WHERE Tag = 'Social'
--7.--
	SELECT * FROM COMMENTS 
	WHERE Email = 'abc@gmail.com'
--8.--
	SELECT CommentID FROM COMMENTS
	GROUP BY CUBE (CommentID)
--9.--
	CREATE VIEW V_NewPost AS
	SELECT Title, us.UserName, CreateTime FROM POSTS
	JOIN USERS us
	ON us.UserID = POSTS.UserID
 