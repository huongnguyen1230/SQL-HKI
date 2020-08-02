--bien Declare cua lieu du lieu int
DECLARE @age int = 40

--bien Declare cua lieu du lieu decimal
DECLARE @taxPercent decimal = 0.75

--bien Declare cua lieu du lieu money
DECLARE @amount money = 50000
DECLARE @bonus money = @amount*.10

--bien Declare cua lieu du lieu date
DECLARE @userDate date = '09-30-2009'
DECLARE @currentDate date = GETDATE()
SELECT @age, @taxPercent, @amount, @bonus, @userDate, @currentDate