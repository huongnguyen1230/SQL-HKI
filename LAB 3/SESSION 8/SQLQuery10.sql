SELECT CONVERT(varbinary(6),'aptech')
SELECT CONVERT(varchar(18), 0x617074656368, 0) AS 'Style 0'
SELECT CONVERT(varchar(18), 0x617074656368, 1) AS 'Style 1'
SELECT CONVERT(varchar(18), 0x617074656368, 2) AS 'Style 2'
--datepart()--
SELECT DATEPART(YEAR, '2007-06-01 12:10:30.1234567');
SELECT DATEPART(QUARTER, '2007-06-01 12:10:30.1234567');
SELECT DATEPART(MONTH, '2007-06-01 12:10:30.1234567');
SELECT DATEPART(DAYOFYEAR, '2007-06-01 12:10:30.1234567');
SELECT DATEPART(DAY, '2007-06-01 12:10:30.1234567');
SELECT DATEPART(WEEK, '2007-06-01 12:10:30.1234567');
--datename()--
SELECT DATENAME(DAY, '2007-06-01 12:10:30.1234567');
SELECT DATENAME(WEEK, '2007-06-01 12:10:30.1234567');
SELECT DATENAME(WEEKDAY, '2007-06-01 12:10:30.1234567');
SELECT DATENAME(HOUR, '2007-06-01 12:10:30.1234567');
SELECT DATENAME(MINUTE, '2007-06-01 12:10:30.1234567');
SELECT DATENAME(SECOND, '2007-06-01 12:10:30.1234567');
SELECT DATENAME(MILLISECOND, '2007-06-01 12:10:30.1234567');
SELECT DATENAME(MICROSECOND, '2007-06-01 12:10:30.1234567');
SELECT DATENAME(NANOSECOND, '2007-06-01 12:10:30.1234567');
SELECT DATENAME(TZOFFSET, '2007-06-01 12:10:30.1234567');
SELECT DATENAME(ISO_WEEK, '2007-06-01 12:10:30.1234567');