DECLARE @bookingTime datetime2 = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime1 datetime2(0) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime2 datetime2(1) = '2009-09-08 11:59:11.1234567';
DECLARE @bookingTime3 datetime2(2) = '2009-09-08 11:59:11.1234567';

SELECT @bookingTime;
SELECT @bookingTime1;
SELECT @bookingTime2;
SELECT @bookingTime3;