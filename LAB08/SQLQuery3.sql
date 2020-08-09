IF EXISTS (SELECT * FROM sys.databases WHERE Name='Aptech')
DROP DATABASE Aptech
GO
CREATE DATABASE Aptech
GO
USE Aptech
GO

CREATE TABLE Classes(
	ClassName char (6),
	Teacher varchar (30),
	TimeSlot varchar(30),
	Class INT,
	Lab int
)
--tao 1 unique, clustered
CREATE CLUSTERED INDEX MyClusteredIndex ON Classes(ClassName) WITH (PAD_INDEX = ON, FillFactor = 70, Ignore_Dup_Key = ON)
CREATE UNIQUE INDEX UQ_ClassName ON Classes(ClassName)
--tao 1 nonclustered--
CREATE NONCLUSTERED INDEX TeacherIndex ON Classes(Teacher)
--xoa chi muc TeacherIndex--
DROP INDEX TeacherIndex ON Classes
--tao composite index ten ClassLabIndex tren 2 truong Lab va Class
CREATE INDEX ClassLabIndex ON Classes(Lab, Class)
