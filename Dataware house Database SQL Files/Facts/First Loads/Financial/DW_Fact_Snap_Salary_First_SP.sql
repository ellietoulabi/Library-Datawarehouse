-----------------###### DW Fact Snap Salary First SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Snap_Salary_First_SP
AS
BEGIN
	declare @curr_date date
	declare @start_date date
	declare @end_date date
	declare @sub_date date
	declare @tmp table
	(
		bid int,
		eid int,
		pid int,
		did int,
		m bigint,
		mw int,
		t bigint
	)

	set @start_date = Convert(date,
									CAST(
										(select min(DateID) from FinancialDataMart.transFactOverSalary) as varchar),
							  112)
	set @end_date = Convert(date,
									CAST(
										(select max(DateID) from FinancialDataMart.transFactOverSalary) as varchar),
							  112)
	
	set @curr_date = @start_date

	while @curr_date <= @end_date
	begin
		
		

		
		declare @did int;	
		set @did = (select TimeKey from dimDate where FullDateAlternateKey=DATEADD(DAY,-1,dateadd(yy, datediff(yy, 0, @curr_date) + 1, 0)));


		insert into @tmp
		select t.BranchID, t.EmployeeID, t.PositionID,@did,
		max(t.Amount),
		max(t.MonthsWorked),
		sum(t.Amount)
		from FinancialDataMart.transFactOverSalary as t join dimDate as d on t.DateID=d.TimeKey
		where d.FullDateAlternateKey >= @curr_date and d.FullDateAlternateKey < dateadd(yy, datediff(yy, 0, @curr_date) + 1, 0)
		group by t.BranchID, t.EmployeeID, t.PositionID;

		

		insert into @tmp
		select  d.Branch_ID, d.ID, d.Cur_Position_ID,@did,0,0,0
		from dimEmployee as d left join @tmp as t
		on d.ID=t.eid
		where t.eid is null

		
		if Convert(date, CAST(@did as varchar), 112) >= GETDATE()
		begin
			set @did = (select TimeKey from dimDate where FullDateAlternateKey=GETDATE())
		end

		insert into FinancialDataMart.snapshotFactOverSalary
		select bid,eid,pid,@did,m,
		case 
			when mw = 0 then 0
			else t/mw
		end,
		mw,t
		from @tmp
		
		delete @tmp
		set @curr_date = dateadd(yy, datediff(yy, 0, @curr_date) + 1, 0)
	end
	

END