-----------------###### DW Fact Acc Lendings Second SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Acc_Lendings_Second_SP 
AS
	DECLARE @maxDate INT
	SET @maxDate=(SELECT Max(DateID) FROM [LendingsDataMart].snapshotFactOverBorrowedBooks)

	TRUNCATE TABLE [LendingsDataMart].accFactOverBorrowedBooks 

	INSERT INTO [LendingsDataMart].accFactOverBorrowedBooks (
														BookID,
														BranchID,
														TotalLendedCount,
														BookedCount,
														AvailableCount)
	SELECT BookId,BranchID,TotalLendedCount,BookedCount,AvailableCount
	FROM [LibraryDW].[LendingsDataMart].snapshotFactOverBorrowedBooks
	WHERE DateID=@maxDate

--exec DW_Fact_Acc_Lendings_Second_SP 

