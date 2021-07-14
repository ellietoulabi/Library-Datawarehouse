-----------------###### DW Fact Tran Research First SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Tran_Research_First_SP
AS
BEGIN
	TRUNCATE TABLE [LibraryDW].[CulturalDataMart].[transactionFactOverResearch];
	CREATE TABLE [LibraryDW].[dbo].[tranTmp](
		[ResearchID] [int] ,
		[ResearchCategoryID] [int] ,
		[ResearchTypeID] [int] ,
		[BranchID] [int],
		[Date] [datetime],
		--[numOfParticipants] [int] ,
		[Cost] [bigint]
	);
	CREATE TABLE [LibraryDW].[dbo].[tranTmp2](
		[ResearchID] [int] ,
		[ResearchCategoryID] [int] ,
		[ResearchTypeID] [int] ,
		[BranchID] [int],
		[Date] [datetime],
		--[numOfParticipants] [int] ,
		[Cost] [bigint] 
	);
	CREATE TABLE [LibraryDW].[dbo].[tranTmp3](
		[ResearchID] [int] ,
		[ResearchCategoryID] [int] ,
		[ResearchTypeID] [int] ,
		[BranchID] [int],
		[DateID] [int],
		--[numOfParticipants] [int] ,
		[Cost] [bigint] 
		
	);

	DECLARE @start date;
	DECLARE @end   date;
	SET @start = (SELECT ISNULL(MIN(PayDate),'2009-03-21 00:00:00.000') FROM [LibrarySA].[dbo].[Research_Payments]);
	SET @end   = (SELECT ISNULL(CONVERT(date,MAX(PayDate)),'2009-03-21 00:00:00.000') FROM [LibrarySA].[dbo].[Research_Payments]);

	WHILE @start <= @end
	BEGIN
		TRUNCATE TABLE [LibraryDW].[dbo].[tranTmp];
		TRUNCATE TABLE [LibraryDW].[dbo].[tranTmp2];

		INSERT INTO [LibraryDW].[dbo].[tranTmp2]
				   ([ResearchID],
					[ResearchCategoryID],
					[ResearchTypeID],
					[BranchID],
					[Date],
					--[numOfParticipants],
					[Cost])
			 SELECT DISTINCT T.[Research_ID]
				   ,R.[Category_ID]
				   ,R.[Research_Type_ID]
				   ,R.[Branch_ID]
				   ,T.[PayDate]
				   --,0
				   ,T.[Payment]
			 FROM  [LibrarySA].[dbo].[Research_Payments] AS T inner join [LibraryDW].[dbo].[dimResearch] as R on T.Research_ID=R.ID
			 WHERE CONVERT(date,T.PayDate)>= @start and CONVERT(date,T.PayDate) < DATEADD(day,1,@start)

		INSERT INTO [LibraryDW].[dbo].[tranTmp]
				   ([ResearchID],
					[ResearchCategoryID],
					[ResearchTypeID],
					[BranchID],
					[Date],
					--[numOfParticipants],
					[Cost])
			 SELECT DISTINCT T.[ResearchID]
				   ,T.[ResearchCategoryID]
				   ,T.[ResearchTypeID]
				   ,T.[BranchID]
				   ,T.[Date]
				   --,ISNULL(COUNT(D.Member_ID)OVER(Partition by T.ResearchID Order by T.ResearchID),0)
				   ,T.[Cost]
			 FROM  [LibraryDW].[dbo].[tranTmp2] AS T LEFT JOIN [LibrarySA].[dbo].[Research_Member] AS D ON T.[ResearchID]=D.Research_ID
		
		 
			INSERT INTO [LibraryDW].[dbo].[tranTmp3]
				   ([ResearchID],
					[ResearchCategoryID],
					[ResearchTypeID],
					[BranchID],
					[DateID],
					--[numOfParticipants],
					[Cost])
			 SELECT T.[ResearchID]
				   ,T.[ResearchCategoryID]
				   ,T.[ResearchTypeID]
				   ,T.[BranchID]
				   ,D.[TimeKey]
				   --,T.[numOfParticipants]
				   ,T.[Cost]
			 FROM  [LibraryDW].[dbo].[tranTmp] AS T INNER JOIN [LibraryDW].[dbo].[dimDate] AS D ON CONVERT(DATE,T.Date) = D.FullDateAlternateKey
			
			SET @start = DATEADD(day,1,@start);

		END



		INSERT INTO [LibraryDW].[CulturalDataMart].[transactionFactOverResearch]
				   ([ResearchID],
					[ResearchCategoryID],
					[ResearchTypeID],
					[BranchID],
					[DateID],
					--[numOfParticipants],
					[Payment])
			 SELECT T.[ResearchID],
					T.[ResearchCategoryID],
					T.[ResearchTypeID],
					T.[BranchID],
					T.[DateID],
					--T.[numOfParticipants],
					T.[Cost]
			 FROM  [LibraryDW].[dbo].[tranTmp3] AS T

		DROP TABLE [LibraryDW].[dbo].[tranTmp];
		DROP TABLE [LibraryDW].[dbo].[tranTmp2];
		DROP TABLE [LibraryDW].[dbo].[tranTmp3];
END
GO

