-----------------###### DW DimTime First SP ######---------------
USE LibraryDW
go
CREATE OR ALTER PROCEDURE DW_DimTime_First_SP
AS
BEGIN
	declare @count int
	declare @start time
	set @start = '00:00:00'
	set @count = 0
	while @count < 86400
	begin
		insert into [LibraryDW].[dbo].[dimTime]
		values (
		@start,
		DATEPART(HOUR,@start),
		DATEPART(MINUTE,@start),
		DATEPART(SECOND,@start)
		)
		set @start = DATEADD(SECOND,1,@start)
		set @count = @count + 1
	end
END