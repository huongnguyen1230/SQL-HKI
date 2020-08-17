  CREATE DATABASE Assignment02
GO
USE Assignment02

						--Tao bang Hang san pham--
CREATE TABLE HANG_SP(
	MaHang int,
	TenHang varchar (20),
	DiaChi varchar (20),
	DienThoai int 
	CONSTRAINT PK_MaHang PRIMARY KEY (MaHang)
)
	SELECT * FROM HANG_SP
	INSERT INTO HANG_SP VALUES (123, 'ASUS','USA', 987654)
	INSERT INTO HANG_SP VALUES (124, 'SAMSUNG','KOREA', 1234566)
	INSERT INTO HANG_SP VALUES (125, 'DELL','USA', 567800)
	INSERT INTO HANG_SP VALUES (126, 'NOKIA','USA', 0379765)

--hien thi hang san xuat--
	SELECT TenHang FROM HANG_SP


						--Tao bang SanPham--
CREATE TABLE SAN_PHAM(
	MaSP int,
	TenSP varchar (100),
	TenHang varchar (20),
	Description varchar(500),
	DonVi varchar (50),
	GiaSP money,
	SoLuong int,
	CONSTRAINT PK_MaSP PRIMARY KEY (MaSP)
)
	SELECT * FROM SAN_PHAM
	INSERT INTO SAN_PHAM VALUES (1, 'MAY TINH T450', 'ASUS','May Nhap Cu', ' CHIEC', 1000, 10)
	INSERT INTO SAN_PHAM VALUES (2, 'DIEN THOAI NOKIA5670','NOKIA', 'HOT', ' CHIEC', 200, 200)
	INSERT INTO SAN_PHAM VALUES (3, 'MAY IN SAMSUNG 450','SAMSUNG', 'May In Loai Binh', ' CHIEC', 100, 10)
--hien thi tat ca san pham--
	SELECT TenSP FROM SAN_PHAM

--CAU 5--
	--5.1, liet ke danh sach Hang theo alphabet--
	SELECT MaHang, TenHang 
	FROM HANG_SP
	ORDER BY TenHang
	--5.2 sap xep gia san pham theo thu tu giam dan-- 
	SELECT MaSP, TenSP, Description, GiaSP 
	FROM SAN_PHAM
	ORDER BY GiaSP DESC --order by la sap xep. ASC tang dan. DESC giam dan--
	--5.3 hien thi thong tin hang ASUS--
	SELECT DiaChi, DienThoai, MaHang FROM HANG_SP
	WHERE TenHang = 'ASUS'
	--5.4 hien thi san pham < 11--
	SELECT MaSP, TenSP, SoLuong FROM SAN_PHAM
	WHERE SoLuong < 11
	--5.5 hien thi san pham ASUS--
	SELECT TenSP, MaSP FROM SAN_PHAM
	WHERE TenHang = 'ASUS'

--CAU 6--
	--6.1, so hang san pham ma cua hang co--
	SELECT TenHang, COUNT (*) [SOHANG] FROM HANG_SP
	GROUP BY TenHang
	--6.2 so mat hang ma cua hang ban--
	SELECT TenSP, COUNT(*) [SANPHAM] FROM SAN_PHAM
	GROUP BY TenSP
	--6.3--
	SELECT TenSP, SoLuong, TenHang, SUM(SoLuong)  FROM SAN_PHAM
	GROUP BY TenSP, SoLuong, TenHang
	--6.4--

--CAU 7--
	--7.1--
	ALTER TABLE SAN_PHAM ADD CONSTRAINT GiaSP CHECK ( GiaSP >0)
	--7.2 --
	ALTER TABLE HANG_SP ADD CONSTRAINT DienThoai CHECK (DienThoai LIKE '[0-9]' )


--CAU 8--
	--8.A--
	CREATE INDEX TenSP ON SAN_PHAM(TenSP);
	CREATE INDEX Description ON SAN_PHAM(Description);
	--8.b.1--
	CREATE VIEW View_SanPham AS
	SELECT TenSP, MaSP, GiaSP FROM SAN_PHAM
	--8.B.2--
	CREATE VIEW View_SanPham_Hang AS
	SELECT MaSP, TenSP, TenHang 
	FROM SAN_PHAM 
