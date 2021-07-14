-----------------###### DW Fact Tran BorrowedBooks Second SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Tran_BorrowedBooks_Second_SP
AS
BEGIN

CREATE TABLE [LibraryDW].[dbo].[newData](
	[BookID] [int] ,
	[BranchID] [int],
	[MemberID] [int]  ,
	[EmployeeID] [int]  ,
	[DateID] [int]  ,
	[TimeKey] [time],
	[CategoryID] [int]  ,
	[AuthorID] [int]  ,
	[AgeRangeID] [int]  ,
	[EditorID] [int]  ,
	[CountryID] [int]  ,
	[LanguageID] [int]  ,
	[TotalLendedCount] [int],
	[BookedCount] [int] ,
	[AvailableCount] [int] ,
	Modified_Date datetime,
	Borrowing_Date datetime,
	Return_Date datetime,
	Returned int,
	borrowed int
);

CREATE TABLE [LibraryDW].[dbo].[newData2](
	[BookID] [int] ,
	[BranchID] [int],
	[MemberID] [int]  ,
	[EmployeeID] [int]  ,
	[DateID] [int]  ,
	[TimeKey] [time],
	[CategoryID] [int]  ,
	[AuthorID] [int]  ,
	[AgeRangeID] [int]  ,
	[EditorID] [int]  ,
	[CountryID] [int]  ,
	[LanguageID] [int]  ,
	[TotalLendedCount] [int],
	[BookedCount] [int] ,
	[AvailableCount] [int] ,
	Modified_Date datetime,
	Borrowing_Date datetime,
	Return_Date datetime,
	Returned int,
	borrowed int
);


CREATE TABLE [LibraryDW].[dbo].[result](
	[BookID] [int] ,
	[BranchID] [int],
	[MemberID] [int]  ,
	[EmployeeID] [int]  ,
	[DateID] [int]  ,
	[TimeKey] [time],
	[CategoryID] [int]  ,
	[AuthorID] [int]  ,
	[AgeRangeID] [int]  ,
	[EditorID] [int]  ,
	[CountryID] [int]  ,
	[LanguageID] [int]  ,
	[TotalLendedCount] [int],
	[BookedCount] [int] ,
	[AvailableCount] [int]
);

CREATE TABLE [LibraryDW].[dbo].[recent](
	[BookID] [int] ,
	[BranchID] [int],
	[DateID] [int]  ,
	[TimeKey] [time],
	[TotalLendedCount] [int],
	[BookedCount] [int] 
);

CREATE TABLE [LibraryDW].[dbo].[todayStock](
	[BookID] [int] ,
	[BranchID] [int],
	[ISBN] [varchar](20),
	[cnt] [int]  ,
	
);

	truncate table [LibraryDW].[dbo].[todayStock];
	insert into [LibraryDW].[dbo].[todayStock] (BookID,BranchID,ISBN,cnt)
	select v.Book_ID,v.Branch_ID,db.ISBN,count(v.Book_ID)as cnt
	from [LibrarySA].[dbo].[Book] as b inner join  [LibrarySA].[dbo].[Book_Volume] as v  on b.ID=v.Book_ID left join [LibraryDW].[dbo].[dimBook] as db on b.ISBN=db.ISBN
	group by v.Book_ID,db.ISBN,v.Branch_ID



	DECLARE @start datetime;
	DECLARE @end   datetime;
	DECLARE @startHour time;
	DECLARE @endHour   time;
	SET @start = (SELECT ISNULL(MAX(lastDate),'2009-03-21 00:00:00.000') FROM [LibraryDW].[LendingsDataMart].[LendingTranFact_MaxDate]);
	SET @end   = (SELECT ISNULL(CONVERT(date,MAX(Modified_Date)),'2009-03-21 00:00:00.000') FROM [LibrarySA].[dbo].[Borrowed_Books]);
	SET @startHour = CONVERT(time,@start)
	SET @endHour   = CONVERT(time,@end)


	WHILE @start < @end
	BEGIN

			truncate table [LibraryDW].[dbo].[result];
			truncate table [LibraryDW].[dbo].[recent];
			truncate table [LibraryDW].[dbo].[newData];
		    truncate table [LibraryDW].[dbo].[newData2];



			--most recent detail recorded for a book existing in a branch in fact
			with a as (
				select tb.BookID,tb.BranchID,tb.DateID,tb.TimeKey,TotalLendedCount,BookedCount,
				ROW_NUMBER() over (partition by tb.BookID,tb.BranchID order by tb.DateID desc,tb.TimeKey desc )as rown
				from [LibraryDW].[LendingsDataMart].[transactionFactOverBorrowedBooks] as tb
			),
			b as (
				select tb.BookID,tb.BranchID,tb.DateID,tb.TimeKey,TotalLendedCount,BookedCount
				from a as tb 
				where rown = 1
			)
			insert into [LibraryDW].[dbo].[recent] (BookID,BranchID,DateID,TimeKey,TotalLendedCount,BookedCount)
			select BookID,BranchID,DateID,TimeKey,TotalLendedCount,BookedCount 
			from b

			--prepare data for @start day to enter fact
			insert into [LibraryDW].[dbo].[newData](    [BookID],
														[BranchID],
														[MemberID],
														[EmployeeID],
														[DateID],
														[TimeKey],
														[CategoryID],
														[AgeRangeID],
														[EditorID],
														[LanguageID],
														[TotalLendedCount],
														[BookedCount],
														[AvailableCount],
														Modified_Date,
														Borrowing_Date,
														Return_Date,
														Returned,
														borrowed)
										  select		db.[ID],
														br.[ID],
														m.[ID],
														e.[ID],
														d.[TimeKey],
														t.[TimeKey] ,
														db.[Category_ID],
														db.[Age_Range_ID],
														db.[Editor_ID],
														db.[Language_ID],
														0,
														0,
														0,
														bb.Modified_Date, 
														bb.Borrowing_Date,
														bb.Returned_Date,
														case when bb.Returned_Date is null then 0 else 1 end ,
														case when bb.Returned_Date is not null then 0 else 1 end 
										 from			[LibrarySA].[dbo].[Borrowed_Books] as bb
										 inner join 	[LibrarySA].[dbo].[Book_Volume] as bv on bb.BookV_ID=bv.ID
										 inner join     [LibraryDW].[dbo].[dimBook] as db on bv.Book_ID=db.Id
										 inner join		[LibraryDW].[dbo].[dimEmployee] as e on bb.Employee_ID=e.ID
										 inner join     [LibraryDW].[dbo].[dimMember] as m on bb.Member_ID=m.ID										
										 inner join     [LibraryDW].[dbo].[dimBranch] as br on bv.Branch_ID=br.ID
										 inner join     [LibraryDW].[dbo].[dimDate] as d on convert(date,bb.Modified_Date) = d.FullDateAlternateKey
										 inner join     [LibraryDW].[dbo].[dimTime] as t on t.TimeKey=convert(time,bb.Modified_Date)
										where bb.Modified_Date >= @start and bb.Modified_Date < DATEADD(day,1,@start)




			insert into [LibraryDW].[dbo].[newData2] (  [BookID],
														[BranchID],
														[MemberID],
														[EmployeeID],
														[DateID],
														[TimeKey],
														[CategoryID],
														[AgeRangeID],
														[EditorID],
														[LanguageID],
														[TotalLendedCount],
														[BookedCount],
														[AvailableCount],
														Modified_Date,
														Borrowing_Date,
														Return_Date,
														Returned,
														borrowed)
										 select			[BookID],
														[BranchID],
														[MemberID],
														[EmployeeID],
														[DateID],
														[TimeKey],
														[CategoryID],
														[AgeRangeID],
														[EditorID],
														[LanguageID],
														[TotalLendedCount],
														[BookedCount],
														[AvailableCount],
														Modified_Date,
														Borrowing_Date,
														Return_Date,
														sum(Returned) over (partition by BookID,BranchID,DateID order by DateID,TimeKey rows between unbounded preceding and current row),
														sum(borrowed) over (partition by BookID,BranchID,DateID order by DateID,TimeKey rows between unbounded preceding and current row)
										from [LibraryDW].[dbo].[newData]

			--calculate measures for data

			--recent newData2  [todayStock]
			insert into [LibraryDW].[dbo].[result] (BookID,BranchID,MemberID,EmployeeID,DateID,TimeKey,CategoryID,AgeRangeID,EditorID,CountryID,LanguageID,TotalLendedCount,BookedCount,AvailableCount)
			select nd.BookID as BookID,nd.BranchID,nd.MemberID,nd.EmployeeID,nd.DateID,nd.TimeKey,nd.CategoryID,nd.AgeRangeID,nd.EditorID,nd.CountryID,nd.LanguageID,
			case 
				when  r.BookID is not null then r.TotalLendedCount+nd.borrowed
				when  r.BookID is null     then nd.borrowed
			end as TotalLendedCount,
			case 
				when  r.BookID is not null then r.BookedCount+(nd.borrowed-nd.Returned)
				when  r.BookID is null     then (nd.borrowed-nd.Returned)
			end as BookedCount,
			case 
				when  r.BookID is not null then ts.cnt-(r.BookedCount+(nd.borrowed-nd.Returned))
				when  r.BookID is null     then ts.cnt-(nd.borrowed-nd.Returned)
			end as AvailableCount
			from       [LibraryDW].[dbo].[newData2] as nd 
			left join  [LibraryDW].[dbo].[todayStock] as ts on nd.BookID=ts.BookID and nd.BranchID=ts.BranchID
			left join  [LibraryDW].[dbo].[recent] as r on nd.BookID=r.BookID and nd.BranchID=r.BranchID



			insert into [LibraryDW].[LendingsDataMart].[transactionFactOverBorrowedBooks](BookID,BranchID,MemberID,EmployeeID,DateID,TimeKey,CategoryID,AgeRangeID,EditorID,CountryID,LanguageID,TotalLendedCount,BookedCount,AvailableCount)
			select BookID,BranchID,MemberID,EmployeeID,DateID,TimeKey,CategoryID,AgeRangeID,EditorID,CountryID,LanguageID,TotalLendedCount,BookedCount,AvailableCount
			from [LibraryDW].[dbo].[result]

			
			insert into [LibraryDW].[LendingsDataMart].[LendingTranFact_MaxDate](lastDate) 
			select max(Modified_Date) from [LibraryDW].[dbo].[newData]
				
 		SET @start = DATEADD(day,1,@start);

		END

			drop table [LibraryDW].[dbo].[result];
			drop table [LibraryDW].[dbo].[recent];
			drop table [LibraryDW].[dbo].[newData];
		    drop table [LibraryDW].[dbo].[newData2];
		    drop table [LibraryDW].[dbo].[todayStock];
	
END
GO

--exec DW_Fact_Tran_BorrowedBooks_First_SP

--select * from [LibraryDW].[LendingsDataMart].[transactionFactOverBorrowedBooks]