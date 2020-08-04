IF EXISTS (SELECT * FROM sys.databases WHERE Name='Example5')
DROP DATABASE Example5
GO
CREATE DATABASE Example5
GO
USE Example5
GO
--tao bang lop hoc--
CREATE TABLE LopHoc(
	MaLopHoc INT PRIMARY KEY IDENTITY,
	TenLopHoc VARCHAR(10)
)
GO
--tao bang sinh vien co khoa ngoai la cot MaLopHoc, noi voi bang LopHoc--
CREATE TABLE SinhVien(
	MaSV int PRIMARY KEY,
	TenSV varchar(40),
	MaLopHoc int,
	CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
GO
--tao bang SanPham voi mot cot NULL, mot cot NOT NULL
CREATE TABLE SanPham(
	MaSP int NOT NULL,
	TenSP varchar(40) NULL
)
--tao bang voi thuoc tinh default cho cot price
CREATE TABLE StoreProduct(
	ProductID int NOT NULL, 
	Name varchar(40) NOT NULL,
	Price money NOT NULL DEFAULT (100)
)
--thu kiem tra xem gia tri default co duoc su dung hay khong
INSERT INTO StoreProduct (ProductID, Name) VALUES (111, 'Rivets')
GO
SELECT * FROM StoreProduct
GO
--Tao bang ContactPhone voi thuoc tinh INDENTITY
CREATE TABLE ContactPhone (
Person_ID int IDENTITY(500,1) NOT NULL,
MobileNumber bigint NOT NULL
)
GO
--tao cot nhan dang duy nhat tong the--
CREATE TABLE CellularPhone(
	Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
	PersonName varchar(60) NOT NULL
)
--chen mot record vao
INSERT INTO CellularPhone (PersonName) VALUES ('William Smith')
GO
--kiem tra gia tri cua cot Person_ID tu dong sinh
SELECT * FROM CellularPhone
GO
--Tao bang ContactPhone voi cot MobileNumber co thuoc tinh UNIQUE
CREATE TABLE ContactPhone(
	Person_ID int PRIMARY KEY,
	MobileNumber bigint UNIQUE,
	ServiceProvider varchar(30),
	LandlineNumber bigint UNIQUE
)
--chen 2 ban ghi co gia tri giong nhau o cot MobileNumber va
--LanlieNumber de quan sat loi
INSERT INTO ContactPhone values (101, 983345674, 'Hutch', NULL)
INSERT INTO ContactPhone values (102, 983345674, 'Alex', NULL)
GO
--Tao bang PhoneExpense co mot CHECT o cot Amount
CREATE TABLE PhoneExpenses (
	Expense_ID int PRIMARY KEY,
	MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone (MobileNumber),
	Amount bigint CHECK (Amount >0)
)
GO
--chinh sua cot trong bang
ALTER TABLE ContactPhone
	ALTER COLUMN ServiceProvider varchar(45)
GO
--xoa cot trong bang
ALTER TABLE ContactPhone
	DROP COLUMN ServiceProvider
GO
--them mot rang buoc vao bang
ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharges >0)
GO
--Xoa mot rang buoc
ALTER TABLE Person.ContactPhone
	DROP CONSTRAINT CHK_RC