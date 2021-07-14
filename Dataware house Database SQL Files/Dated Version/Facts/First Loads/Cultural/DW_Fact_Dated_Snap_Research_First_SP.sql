-----------------###### DW Fact Dated Snap Research First SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Dated_Snap_Research_First_SP @end date
AS 
BEGIN
	declare @curr_date date
	declare @start_date date
	declare @end_date date
	declare @sub_date date
	declare @tmp table
	(
		rid int,
		rcid int,
		bid int,
		t bigint,
		m bigint
	)

	set @start_date = Convert(date,
									CAST(
										(select min(DateID) from CulturalDataMart.transactionFactOverResearch) as varchar),
							  112)
	set @end_date = @end
	
	set @curr_date = @start_date

	while @curr_date <= @end_date
	begin
		
		set @sub_date = @curr_date

		while @sub_date < (DATEADD(DAY,1,EOMONTH(@curr_date)))
		begin
			insert into @tmp
			select t.ResearchID, t.ResearchCategoryID, t.BranchID,
			sum(t.Payment),
			max(t.Payment)
			from CulturalDataMart.transactionFactOverResearch as t join dimDate as d on t.DateID=d.TimeKey
			where d.FullDateAlternateKey >= @sub_date and d.FullDateAlternateKey < DATEADD(DAY,1,@sub_date)
			group by t.ResearchID, t.ResearchCategoryID, t.BranchID

			set @sub_date = DATEADD(DAY,1,@sub_date);
		end

		insert into @tmp
		select ID,Category_ID,Branch_ID,0,0
		from dimResearch where ID not in (select rid from @tmp)

		declare @did int;
		
		set @did = (select TimeKey from dimDate where FullDateAlternateKey=EOMONTH(@curr_date));

		if Convert(date, CAST(@did as varchar), 112) >= GETDATE()
		begin
			set @did = (select TimeKey from dimDate where FullDateAlternateKey=GETDATE())
		end

		insert into CulturalDataMart.snapshotFactOverResearch
		select t.rid, t.rcid, t.bid, @did, 
		sum(t.t),
		max(t.m)
		from @tmp as t
		group by t.rid,t.rcid,t.bid
		
		delete @tmp
		set @curr_date = DATEADD(DAY,1,EOMONTH(@curr_date))
	end
	

END