CREATE DATABASE Assignment01
GO
USE Assignment01

					--tao bang KHACH HANG--
CREATE TABLE KhachHang(
	MaKH varchar(10) NOT NULL,
	TenKH varchar(50) NOT NULL,
	DiaChi varchar(100),
	SoDT int
	CONSTRAINT PK_MaKH PRIMARY KEY (MaKH)
)
SELECT * FROM KhachHang
INSERT INTO KhachHang VALUES ('A001', 'NGUYEN VAN AN', '111 Nguyen Trai, Thanh Xuan, HN', 12344321)
INSERT INTO KhachHang VALUES ('D002', 'NGUYEN VAN B', '112 Nguyen Trai, Thanh Xuan, HN', 45677654)
INSERT INTO KhachHang VALUES ('C002', 'NGUYEN VAN C', '112 Nguyen Trai, Thanh Xuan, HN', 45677654)


					--tao bang San Pham--
CREATE TABLE SanPham(
	MaSP varchar(10) NOT NULL,
	TenSP varchar(50) NOT NULL,
	GiaSP money, --hien tai--
	DonVi varchar (10),
	MoTa varchar (100),
	SoLuong int --so luong trong kho--
	CONSTRAINT PK_MaSP PRIMARY KEY (MaSP)
)
SELECT * FROM SanPham
INSERT INTO SanPham VALUES ('A01', 'MAY TINH T450', 700, 'chiec', 'May moi nhap', 100 )
INSERT INTO SanPham VALUES ('A02', 'DIEN THOAI NOKIA 5670', 100,'chiec','Hot', 100 )
INSERT INTO SanPham VALUES ('A03', 'MAY IN SAMSUNG450', 100, 'chiec', 'Dang e',100)


					--tao bang Don dat hang--
CREATE TABLE DonDatHang(
	MaDH int NOT NULL,
	MaKH varchar(10),
	NgayDatHang datetime,
	Tongtien money,
	CONSTRAINT PK_MaDH PRIMARY KEY (MaDH),
	CONSTRAINT FK_MaKH FOREIGN KEY (MaKH) REFERENCES KhachHang,
)
SELECT * FROM DonDatHang
INSERT INTO DonDatHang VALUES (123, 'A001', 30-12-2020, 1500)
INSERT INTO DonDatHang VALUES (124, 'A002', 30-12-2020, 2000)



					--tao bang Don hang chi tiet--
CREATE TABLE DonHangChiTiet(
	MaDH int,
	MaKH varchar (10),
	MaSp varchar (10),
	GiaBan int,--tai thoi diem mua--
	Soluong int, --so luong khach mua--
	NgayMua datetime,
	CONSTRAINT fk_MS FOREIGN KEY (MaSP) REFERENCES SanPham
)
SELECT*FROM DonHangChiTiet
INSERT INTO DonHangChiTiet VALUES (123, 'A001', 'A01',1000, 1, 30-12-2020)
INSERT INTO DonHangChiTiet VALUES (123, 'A001', 'A02',200, 2, 30-12-2020)
INSERT INTO DonHangChiTiet VALUES (123, 'A001', 'A03',100, 1, 30-12-2020)
				--CAU 4--
--4.a, liet ke danh sach khach hang da mua--
SELECT * FROM KhachHang

--4.b, liet ke danh sach san pham--
SELECT * FROM SanPham

--4.C, liet ke cac don dat hang--
SELECT * FROM DonDatHang

				--CAU 5--
--5.1, liet ke danh sach khach hang theo alphabet--
SELECT MaKH, TenKH 
FROM KhachHang
ORDER BY TenKH
--5.2 sap xep gia san pham theo thu tu giam dan-- 
SELECT MaSP, TenSP, Mota, GiaSP 
FROM SanPham
ORDER BY GiaSP DESC --order by la sap xep. ASC tang dan. DESC giam dan--
--5.3 liet ke san pham Nguyen Van An da mua--
SELECT kh.MaKH, sp.MaSP, sp.TenSP, kh.TenKH 
FROM DonHangChiTiet
JOIN SanPham sp
ON sp.MaSP = DonHangChiTiet.MaSp
JOIN KhachHang kh
ON kh.MaKH = DonHangChiTiet.MaKH
WHERE TenKH = 'NGUYEN VAN AN'
			--CAU 6--
--6.1, so khach hang da mua hang--
SELECT TenKH, COUNT(*) [sokhachhang] FROM KhachHang
GROUP BY TenKH
--6.2 so san pham da ban--
SELECT sp.MaSP, sp.TenSP, DonHangChiTiet.SoLuong, COUNT (*) [so mat hang da ban]
FROM SanPham sp
JOIN DonHangChiTiet 
ON sp.MaSP = DonHangChiTiet.MaSp
--6.3, tong tien tung don hang--

				--CAU 7--
--7.1, Thay doi gia tien la duong (>0)--
ALTER TABLE SanPham ADD CONSTRAINT MaSP CHECK ( GiaSP >0)
--7.2, Thay doi ngay dat nho hon hien tai--
ALTER TABLE DonDatHang ADD CONSTRAINT NgayDH CHECK ( NgayDatHang < GETDATE())
--7.3, them ngay xuat hien  san pham tren thi truong--

				--CAU 8--
--8.1, dat chi muc index cho Ten hang va Nguoi dat hang de taang toc truy van du lieu--
CREATE INDEX TenKH ON KhachHang(TenKH);
CREATE INDEX TenSP ON SanPham(TenSP);

--8.2.a, create VIEW--
		CREATE VIEW View_KhachHang AS
		SELECT TenKH, DiaChi, SoDT FROM KhachHang
--8.2.b--
		CREATE VIEW View_SanPham AS
		SELECT TenSP, GiaSP FROM SanPham
--8.2.c--
		CREATE VIEW View_KhachHang_SanPham AS
		SELECT kh.TenKH, kh.SoDT, sp.TenSP, sp.SoLuong, DonHangChiTiet.NgayMua 
		FROM DonHangChiTiet
		JOIN SanPham sp
		ON sp.MaSP = DonHangChiTiet.MaSp
		JOIN KhachHang kh
		ON kh.MaKH = DonHangChiTiet.MaKH
--8.3.a, Store Procedure--