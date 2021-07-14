-----------------###### DW Fact Tran Salary Second SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Tran_Salary_Second_SP
AS
BEGIN

CREATE TABLE [LibraryDW].[dbo].[newData](
	[BranchID] int,
	[EmployeeID] int,
	[PositionID] int,
	[Date] datetime,
	[Amount] int
);

CREATE TABLE [LibraryDW].[dbo].[newData2](
	[BranchID] int,
	[EmployeeID] int,
	[PositionID] int,
	[DateID] int,
	[Amount] int
);

CREATE TABLE [LibraryDW].[dbo].[result](
	[BranchID] int,
	[EmployeeID] int,
	[PositionID] int,
	[DateID] int,
	[Amount] int,
	[AvgAmount] int,
	[MonthsWorked] int
);


CREATE TABLE [LibraryDW].[dbo].[recent](
	[BranchID] int,
	[EmployeeID] int,
	[PositionID] int,
	[DateID] int,
	[Amount] int,
	[AvgAmount] int,
	[MonthsWorked] int
);


	DECLARE @start datetime;
	DECLARE @end   datetime;
	SET @start = (SELECT ISNULL(MAX(lastDate),'2009-03-21 00:00:00.000') FROM [LibraryDW].[FinancialDataMart].[FinancialTranFact_MaxDate]);
	SET @end   = (SELECT ISNULL(MAX(Date),'2009-03-21 00:00:00.000') FROM [LibrarySA].[dbo].[Salary]);



	WHILE @start < @end
	BEGIN

			truncate table [LibraryDW].[dbo].[result];
			truncate table [LibraryDW].[dbo].[recent];
			truncate table [LibraryDW].[dbo].[newData];
		    truncate table [LibraryDW].[dbo].[newData2];



			--most recent detail recorded for an employee existing in fact
			with a as (
				select ts.BranchID,ts.EmployeeID,ts.PositionID,ts.DateID,ts.Amount,ts.AvgAmount,ts.MonthsWorked,
				ROW_NUMBER() over (partition by ts.EmployeeID order by ts.DateID desc)as rown
				from [LibraryDW].[FinancialDataMart].[transFactOverSalary] as ts
			),
			b as (
				select  ts.BranchID,ts.EmployeeID,ts.PositionID,ts.DateID,ts.Amount,ts.AvgAmount,ts.MonthsWorked
				from a as ts
				where rown = 1
			)
			insert into [LibraryDW].[dbo].[recent] ( BranchID,EmployeeID,PositionID,DateID,Amount,AvgAmount,MonthsWorked)
			select  BranchID,EmployeeID,PositionID,DateID,Amount,AvgAmount,MonthsWorked
			from b


			--prepare data for @start day to enter fact
			insert into [LibraryDW].[dbo].[newData](    [BranchID]  ,
														[EmployeeID]  ,
														[PositionID]  ,
														[Date] ,
														[Amount])
										  select		de.[Branch_ID]  ,
														de.[ID]  ,
														de.[Cur_Position_ID]  ,
														ss.[Date] ,
														ss.[Salary] 
										 from			[LibrarySA].[dbo].[Salary] as ss
										 inner join 	[LibrarySA].[dbo].[Employee] as se on ss.Employee_ID=se.ID
										 inner join		[LibraryDW].[dbo].[dimEmployee] as de on se.Employee_No = de.Employee_No
										 where Date >@start and Date <= DATEADD(month,1,@start)

			insert into [LibraryDW].[dbo].[newData2](   [BranchID]  ,
														[EmployeeID]  ,
														[PositionID]  ,
														[DateID] ,
														[Amount])
										  select		ss.[BranchID]  ,
														ss.[EmployeeID]  ,
														ss.[PositionID]  ,
														d.[TimeKey] ,
														ss.[Amount] 
										 from			[LibraryDW].[dbo].[newData] as ss
										 inner join     [LibraryDW].[dbo].[dimDate] as d on convert(date,ss.Date) = d.FullDateAlternateKey
							
									



	
			--calculate measures for data
			insert into [LibraryDW].[dbo].[result](BranchID,EmployeeID,PositionID,DateID,Amount,AvgAmount,MonthsWorked)
			select n.BranchID,n.EmployeeID,n.PositionID,n.DateID,n.Amount,
			case
				when r.EmployeeID is null then n.Amount
				else ROUND(((r.AvgAmount * r.MonthsWorked)+n.Amount)/(r.MonthsWorked + 1),0)
			end,
			case
				when r.EmployeeID is null then 1
				else r.MonthsWorked + 1
			end
			from [LibraryDW].[dbo].[newData2] as n 
			left join  [LibraryDW].[dbo].[recent] as r on n.EmployeeID=r.EmployeeID 



			insert into [LibraryDW].[FinancialDataMart].[transFactOverSalary](BranchID,EmployeeID,PositionID,DateID,Amount,AvgAmount,MonthsWorked)
			select BranchID,EmployeeID,PositionID,DateID,Amount,AvgAmount,MonthsWorked
			from [LibraryDW].[dbo].[result]

			
			insert into  [LibraryDW].[FinancialDataMart].[FinancialTranFact_MaxDate](lastDate) 
			select max(Date) from [LibraryDW].[dbo].[newData]
				
 		SET @start = DATEADD(month,1,@start);

		END

			drop table [LibraryDW].[dbo].[result];
			drop table [LibraryDW].[dbo].[recent];
			drop table [LibraryDW].[dbo].[newData];
		    drop table [LibraryDW].[dbo].[newData2];
	
END
GO

--exec DW_Fact_Tran_Salary_Second_SP

--select * from [LibraryDW].[FinancialDataMart].[transFactOverSalary]  where EmployeeID=20
--order by MonthsWorked


----			select * from [LibraryOP].[dbo].[Salary] where Employee_ID=20

		
--		select * from [LibraryDW].[FinancialDataMart].[transFactOverSalary]  where EmployeeID=20


--		select * from  [LibraryDW].[FinancialDataMart].[FinancialTranFact_MaxDate]
--where  EmployeeID=20
--order by MonthsWorked

--insert into LibrarySA.dbo.Salary (Employee_ID,Salary,Date,ID) values(20,20,'2014-01-21 23:00:00',58001)
--select max(ID) from LibrarySA.dbo.Salary