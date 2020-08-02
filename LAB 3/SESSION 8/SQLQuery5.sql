DECLARE @sunriseTime datetimeoffset = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime1 datetimeoffset(0) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime2 datetimeoffset(1) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime3 datetimeoffset(2) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime4 datetimeoffset(3) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime5 datetimeoffset(4) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime6 datetimeoffset(5) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime7 datetimeoffset(6) = '2009-09-08 06:59:11.1234567';
DECLARE @sunriseTime8 datetimeoffset(7) = '2009-09-08 06:59:11.1234567';

SELECT @sunriseTime;
SELECT @sunriseTime1;
SELECT @sunriseTime2;
SELECT @sunriseTime3;
SELECT @sunriseTime4;
SELECT @sunriseTime5;
SELECT @sunriseTime6;
SELECT @sunriseTime7;
SELECT @sunriseTime8;

DECLARE @location1 datetimeoffset(0)
SET @location1 = '2009-11-9 23:50:55 -1:00'
DECLARE @location2 datetimeoffset(0)
SET @location2 = '2009-11-9 22:50:55 +5:00'
SELECT DATEDIFF(HH, @location1, @location2)