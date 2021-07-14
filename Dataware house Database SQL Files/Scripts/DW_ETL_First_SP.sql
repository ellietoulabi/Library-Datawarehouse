-----------------###### DW ETL First SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_ETL_First_SP
AS
BEGIN
	
	--- Dimentions ---

	EXEC DW_DimBranch_First_SP
	INSERT INTO ETL_LOGS VALUES ('Branch First Done', 
								'ETL first for dimBranch was successfull',
								'H',
								'D',
								 GETDATE()
								)

	EXEC DW_DimDate_First_SP
	INSERT INTO ETL_LOGS VALUES ('Date First Done', 
								'ETL first for dimDate was successfull',
								'H',
								'D',
								GETDATE()
								)

	EXEC DW_DimTime_First_SP
	INSERT INTO ETL_LOGS VALUES ('Time First Done', 
								'ETL first for dimTime was successfull',
								'H',
								'D',
								GETDATE()
								)

	EXEC DW_DimInstitute_First_SP
	INSERT INTO ETL_LOGS VALUES ('Institute First Done', 
								'ETL first for dimInstitute was successfull',
								'H',
								'D',
								 GETDATE()
								)

	EXEC DW_DimQualification_First_SP
	INSERT INTO ETL_LOGS VALUES ('Qualification First Done', 
								'ETL first for dimQualification was successfull',
								'H',
								'D',
								 GETDATE()
								)

	EXEC DW_DimMember_First_SP
	INSERT INTO ETL_LOGS VALUES ('Member First Done', 
								'ETL first for dimMember was successfull',
								'M',
								'D',
								GETDATE()
								)

	EXEC DW_DimResearchCategory_First_SP
	INSERT INTO ETL_LOGS VALUES ('RCat First Done', 
								'ETL first for dimResearchCategory was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimResearchType_First_SP
	INSERT INTO ETL_LOGS VALUES ('RType First Done', 
								'ETL first for dimResearchType was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimResearch_First_SP
	INSERT INTO ETL_LOGS VALUES ('RType First Done', 
								'ETL first for dimResearch was successfull',
								'L',
								'D',
								GETDATE()
								)
	
	EXEC DW_DimAgeRange_First_SP
	INSERT INTO ETL_LOGS VALUES ('AgeRange First Done', 
								'ETL first for dimAgeRange was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimCountry_First_SP
	INSERT INTO ETL_LOGS VALUES ('Country First Done', 
								'ETL first for dimCountry was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimAuthor_First_SP
	INSERT INTO ETL_LOGS VALUES ('Author First Done', 
								'ETL first for dimAuthor was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimEditor_First_SP
	INSERT INTO ETL_LOGS VALUES ('Editor First Done', 
								'ETL first for dimEditor was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimLanguage_First_SP
	INSERT INTO ETL_LOGS VALUES ('Language First Done', 
								'ETL first for dimLanguage was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimTranslator_First_SP
	INSERT INTO ETL_LOGS VALUES ('Translator First Done', 
								'ETL first for dimTranslator was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimCategory_First_SP
	INSERT INTO ETL_LOGS VALUES ('Category First Done', 
								'ETL first for dimCategory was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimBook_First_SP
	INSERT INTO ETL_LOGS VALUES ('Book First Done', 
								'ETL first for dimBook was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimPosition_First_SP
	INSERT INTO ETL_LOGS VALUES ('Position First Done', 
								'ETL first for dimPosition was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimEventCategory_First_SP
	INSERT INTO ETL_LOGS VALUES ('EventCategory First Done', 
								'ETL first for dimEventCategory was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimSuplier_First_SP
	INSERT INTO ETL_LOGS VALUES ('Suplier First Done', 
								'ETL first for dimSuplier was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimEmployee_First_SP
	INSERT INTO ETL_LOGS VALUES ('Employee First Done', 
								'ETL first for dimEmployee was successfull',
								'L',
								'D',
								GETDATE()
								)	

	EXEC DW_DimType_First_SP
	INSERT INTO ETL_LOGS VALUES ('Type First Done', 
								'ETL first for dimType was successfull',
								'L',
								'D',
								GETDATE()
								)

	--- Facts ---
	---Cultural--
	EXEC DW_Fact_Tran_Research_First_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Tran Research First Done', 
								'ETL first for transactionFactOverResearch was successfull',
								'H',
								'F',
								GETDATE()
								)
	
	EXEC DW_Fact_Snap_Research_First_SP
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
	
	EXEC DW_Fact_Snap_Lendings_First_SP
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

	EXEC DW_Fact_Factless_AuthorBook_First_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Factless AuthorBook First Done', 
								'ETL first for factless_authorBook was successfull',
								'M',
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
	
	EXEC DW_Fact_Snap_Salary_First_SP
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

