USE AdventureWorks2016CTP3
--lay du lieu cua business tu 100 den 200--
SELECT * FROM Person.Person
WHERE BusinessEntityID >= 100 AND BusinessEntityID <= 200

--Lay ra du lieu cua bang Contact có ContactID trong khoang [100, 200]
SELECT * FROM Person.Person
WHERE BusinessEntityID BETWEEN 100 AND 200

--Lay ra nhung Contact có LastName ket thúc boi ký tu e
SELECT * FROM Person.Person
WHERE LastName LIKE '%e'

--Lấy ra những Contact có LastName bắt đầu bởi ký tự R hoặc A kết thúc bởi ký tự e
SELECT * FROM Person.Person
WHERE LastName LIKE '[RA]%e'

--Lấy ra những Contact có LastName có 4 ký tự bắt đầu bởi ký tự R hoặc A kết thúc bởi ký tự e
SELECT * FROM Person.Person
WHERE LastName LIKE '[RA]__e'

--DISTINCT loại bỏ các dữ liệu trùng lặp--
SELECT DISTINCT Title FROM Person.Person

--GROUP BY có thể sử dụng được với các hàm tập hợp--
SELECT Title, COUNT(*) [Title Number] FROM Person.Person
GROUP BY Title


