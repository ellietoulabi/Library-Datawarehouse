-----------------###### DW Fact Snap Lendings Second SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Snap_Lendings_Second_SP
AS
BEGIN
	declare @curr_date date
	declare @start_date date
	declare @end_date date
	declare @sub_date date
	declare @tmp table
	(
		boid int,
		brid int,
		tot int,
		tod int,
		bed int,
		av int
	)
	


	set @start_date = Convert(date,
									CAST(
										(select max(DateID) from LendingsDataMart.snapshotFactOverBorrowedBooks) as varchar),
							  112)
	set @end_date = Convert(date,
									CAST(
										(select max(DateID) from LendingsDataMart.transactionFactOverBorrowedBooks) as varchar),
							  112)
	set @curr_date = @start_date

	while @curr_date <= @end_date
	begin
		
		with dtmp as (
			select t.BookID as boid, t.BranchID as bid,
			t.TotalLendedCount as tot,
			count(*) over (partition by t.BookID, t.BranchID) as cnt,
			t.BookedCount as boo,
			t.AvailableCount as av,
			row_number() over (partition by t.BookID, t.BranchID order by t.TimeKey desc) as rn
			from LendingsDataMart.transactionFactOverBorrowedBooks as t
			join dimDate as d on t.DateID=d.TimeKey
			where d.FullDateAlternateKey >= @curr_date and d.FullDateAlternateKey < DATEADD(DAY,1,@curr_date)
		)
		insert into @tmp
		select boid, bid, tot, cnt, boo, av
		from dtmp
		where rn = 1

		declare @did int;	
		set @did = (select TimeKey from dimDate where FullDateAlternateKey=@curr_date);

		
		insert into @tmp 
		select bb.Book_ID,bb.Branch_ID,
		isnull(
				(select top 1 TotalLendedCount from LendingsDataMart.transactionFactOverBorrowedBooks 
					where Book_ID=bb.Book_ID and Branch_ID=bb.Branch_ID and DateID < @did order by DateID desc,TimeKey desc),
				0
			  ),
		0,
		isnull(
				(select top 1 BookedCount from LendingsDataMart.transactionFactOverBorrowedBooks 
					where Book_ID=bb.Book_ID and Branch_ID=bb.Branch_ID and DateID < @did order by DateID desc,TimeKey desc),
				0
			  ),
		isnull(
				(select top 1 AvailableCount from LendingsDataMart.transactionFactOverBorrowedBooks 
					where Book_ID=bb.Book_ID and Branch_ID=bb.Branch_ID and DateID < @did order by DateID desc,TimeKey desc),
				(select count(*) from [LibrarySA].[dbo].[Book_Volume]
					where Book_ID=bb.Book_ID and Branch_ID=bb.Branch_ID)
			  )
		from [LibrarySA].[dbo].[BookBranch] as bb
		left join @tmp as t on bb.Book_ID=t.boid and bb.Branch_ID=t.brid
		where t.boid is null

		insert into LendingsDataMart.snapshotFactOverBorrowedBooks
		select boid, brid, @did, tot, tod, bed,av
		from @tmp

		delete @tmp

		set @curr_date = DATEADD(DAY,1,@curr_date)
	end



END