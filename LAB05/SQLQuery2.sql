IF EXISTS (SELECT * FROM sys.databases WHERE Name='PHAN3')
DROP DATABASE PHAN3
GO
CREATE DATABASE PHAN3
GO
USE PHAN3
GO

						--TAO BANG PHONG BAN-
CREATE TABLE PhongBan (
	MaPB varchar (7),
	TenPB nvarchar (50)
	CONSTRAINT PK_MaPB PRIMARY KEY (MaPB)
)
--chen du lieu--
SELECT *  FROM PhongBan
INSERT INTO PhongBan VALUES ( 001, 'Phong1')
INSERT INTO PhongBan VALUES ( 002, 'Phong2')
INSERT INTO PhongBan VALUES ( 003, 'Phong3')
INSERT INTO PhongBan VALUES ( 004, 'Phong4')
INSERT INTO PhongBan VALUES ( 005, 'Phong5')



						--TAO BANG NHAN VIEN--
CREATE TABLE NhanVien(
	MaNV varchar (7),
	TenNV nvarchar (50),
	NgaySinh Datetime,
	SoCMND char (9),
	GioiTinh char (1),
	DiaChi nvarchar (100),
	NgayVaoLam Datetime,
	MaPB varchar (7)
	CONSTRAINT FK_PHONGBAN FOREIGN KEY (MaPB) REFERENCES PhongBan  
)
--chen du lieu--
SELECT *  FROM NhanVien
INSERT INTO NhanVien VALUES (1, 'TOM', 01-1-2001, 12345679,'M', 'HA NOI', 30-12-2020, 001)
INSERT INTO NhanVien VALUES (2, 'HARLEY', 1-2-2001, 98765432, 'F', 'HA NOI', 30-12-2020, 002)
INSERT INTO NhanVien VALUES (3, 'JOHN',1-3-2001,4567899, 'M', 'HA NOI', 30-12-2020, 003 )
INSERT INTO NhanVien VALUES (4, 'KEVIN',1-4-2001,12387649, 'M', 'HAI DUONG',30-12-2020,004)
INSERT INTO NhanVien VALUES (5, 'LINDA', 1-5-2001, 01236778, 'F', 'HAI DUONG',30-12-2020,005)
--hien thi nhan vien gioi tinh F--
SELECT TenNV FROM NhanVien WHERE GioiTinh = 'F'
--hien thi CMND tan cung la 9--
SELECT * FROM NhanVien WHERE SoCMND LIKE '%9'
--liet ke ten nhan vien bat dau la N--
SELECT * FROM NhanVien WHERE TenNV LIKE '[N]'

						--TAO BANG LUONGDA--
CREATE TABLE LuongDA(
	MaDA varchar (8),
	MaNV varchar (7),
	NgayNhan DateTime NOT NULL,
	SoTien Money,
	CONSTRAINT PK_MaDA PRIMARY KEY (MaDA),
	CONSTRAINT FK_MaNV FOREIGN KEY (MaNV) REFERENCES PhongBan
)
--chen du lieu--
SELECT *  FROM LuongDA
INSERT INTO LuongDA VALUES ( 001,1, 1-9-2020, 1000)
INSERT INTO LuongDA VALUES ( 002,2, 1-9-2020,3000)
INSERT INTO LuongDA VALUES ( 003,3,1-9-2020,2000)
INSERT INTO LuongDA VALUES ( 004,4,1-9-2020,8000)
INSERT INTO LuongDA VALUES ( 005,5,1-9-2020,4000)
--Xoa du an co ma DXD02--
SELECT * FROM LuongDA
DELETE FROM LuongDA WHERE MaDA = 'DXD02'

--Hien thi tat ca du an, moi du an mot dong--
SELECT MaDA AS 'TAT CA DU AN' FROM LuongDA
--Hien thi tong luong cua tung nhan vien--
SELECT MaDA, MaNV,NgayNhan, SUM(SoTien)
FROM LuongDA
GROUP BY  MaDA, MaNV,NgayNhan
--Xoa nhan vien co muc luong 2000000--
SELECT MaNV FROM LuongDA
DELETE FROM LuongDA WHERE SoTien='2000000'
--xoa nhan vien khong co MaNV trong bang LuongDA--
DELETE FROM NhanVien WHERE MaNV not in (SELECT MaNV FROM LuongDA );