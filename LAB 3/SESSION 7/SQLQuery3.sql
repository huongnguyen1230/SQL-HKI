USE AdventureWorks2016CTP3

CREATE TABLE Batch(
	BatchNo nvarchar(5) ,
	Subject nvarchar (25) ,
	SubjDesc nvarchar (25),
	StartDt DateTime,
	EndDt DateTime,
	Hours int
);
INSERT INTO Batch values
('A01', 'Java', 'Database', 12-01-2006, 03-15-2006, 96);
INSERT INTO Batch values
('A02', 'Oracle', 'Forms', 08-25-2006, 11-02-2006, 55);
INSERT INTO Batch values
('A03', 'SQL Server 2005', 'Queries', 05-15-2006, 06-06-2006, 46);
INSERT INTO Batch values
('A04', 'Net', 'WinForms', 06-20-2005, 08-16-2005, 48);
INSERT INTO Batch values
('A05', 'JSF & Struts', 'CustomControls', 09-07-2005, 10-18-2005, 120);

SELECT * FROM Batch
SELECT DATEDIFF (month, StartDt, EndDt) FROM Batch
SELECT BatchNo, [2005] Y2005, [2006] Y2006 from
(SELECT YEAR(StartDt) StartYear, BatchNo, Hours FROM Batch)pft
PIVOT
(
SUM(Hours)
FOR StartYear in ([2005], [2006])
)pst
GO