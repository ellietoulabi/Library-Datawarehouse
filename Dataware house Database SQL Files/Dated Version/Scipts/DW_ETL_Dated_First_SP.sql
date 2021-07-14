-----------------###### DW ETL Dated First SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_ETL_Dated_First_SP @cdate date,@fdate date,@ldate date
AS
BEGIN
	
	--- Facts ---
	---Cultural--
	EXEC DW_Fact_Tran_Research_First_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Tran Research First Done', 
								'ETL first for transactionFactOverResearch was successfull',
								'H',
								'F',
								GETDATE()
								)
	
	EXEC DW_Fact_Dated_Snap_Research_First_SP @end  = @cdate
	INSERT INTO ETL_LOGS VALUES ('Fact Snap Research First Done', 
								'ETL first for snapFactOverResearch was successfull',
								'H',
								'F',
								GETDATE()
								)

	EXEC DW_Fact_Acc_Research_First_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Acc Research First Done', 
								'ETL first for accFactOverResearch was successfull',
								'H',
								'F',
								GETDATE()
								)
	---- Lendings -----
	EXEC DW_Fact_Tran_BorrowedBooks_First_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Tran Borrowed Books First Done', 
								'ETL first for transactionFactOverBorrowedBooks was successfull',
								'H',
								'F',
								GETDATE()
								)
	
	EXEC DW_Fact_Dated_Snap_Lendings_First_SP @end=@ldate
	INSERT INTO ETL_LOGS VALUES ('Fact Snap Borrowed Books First Done', 
								'ETL first for snapFactOverBorrowedBooks was successfull',
								'H',
								'F',
								GETDATE()
								)

	EXEC DW_Fact_Acc_Lendings_First_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Acc BorrowedBooks First Done', 
								'ETL first for accFactOverBorrowedBooks was successfull',
								'H',
								'F',
								GETDATE()
								)

	------ Finance -----
	EXEC DW_Fact_Tran_Salary_First_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Tran Salary First Done', 
								'ETL first for transactionFactOverSalary was successfull',
								'H',
								'F',
								GETDATE()
								)
	
	EXEC DW_Fact_Dated_Snap_Salary_First_SP @end=@fdate
	INSERT INTO ETL_LOGS VALUES ('Fact Snap Salary First Done', 
								'ETL first for snapFactOverSalary was successfull',
								'H',
								'F',
								GETDATE()
								)

	EXEC DW_Fact_Acc_Financial_Salary_First_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Acc Salary First Done', 
								'ETL first for accFactOverSalary was successfull',
								'H',
								'F',
								GETDATE()
								)

END
GO

