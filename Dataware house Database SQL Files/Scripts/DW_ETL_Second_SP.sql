-----------------###### DW ETL Second SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_ETL_Second_SP
AS
BEGIN
	
	--- Dimentions ---

	EXEC DW_DimBranch_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Branch Second Done', 
								'ETL second for dimBranch was successfull',
								'H',
								'D',
								GETDATE()
								)

	EXEC DW_DimInstitute_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Institute Second Done', 
								'ETL second for dimInstitute was successfull',
								'H',
								'D',
								 GETDATE()
								)

	EXEC DW_DimQualification_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Qualification Second Done', 
								'ETL second for dimQualification was successfull',
								'H',
								'D',
								 GETDATE()
								)

	EXEC DW_DimMember_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Member Second Done', 
								'ETL second for dimMember was successfull',
								'M',
								'D',
								GETDATE()
								)

	EXEC DW_DimResearchCategory_Second_SP
	INSERT INTO ETL_LOGS VALUES ('RCat Second Done', 
								'ETL second for dimResearchCategory was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimResearchType_Second_SP
	INSERT INTO ETL_LOGS VALUES ('RType Second Done', 
								'ETL second for dimResearchType was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimResearch_Second_SP
	INSERT INTO ETL_LOGS VALUES ('RType Second Done', 
								'ETL Second for dimResearch was successfull',
								'L',
								'D',
								GETDATE()
								)
	
	EXEC DW_DimAgeRange_Second_SP
	INSERT INTO ETL_LOGS VALUES ('AgeRange Second Done', 
								'ETL Second for dimAgeRange was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimCountry_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Country Second Done', 
								'ETL Second for dimCountry was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimAuthor_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Author Second Done', 
								'ETL Second for dimAuthor was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimEditor_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Editor Second Done', 
								'ETL Second for dimEditor was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimLanguage_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Language Second Done', 
								'ETL Second for dimLanguage was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimTranslator_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Translator Second Done', 
								'ETL Second for dimTranslator was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimCategory_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Category Second Done', 
								'ETL Second for dimCategory was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimBook_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Book Second Done', 
								'ETL Second for dimBook was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimPosition_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Position Second Done', 
								'ETL Second for dimPosition was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimEventCategory_Second_SP
	INSERT INTO ETL_LOGS VALUES ('EventCategory Second Done', 
								'ETL Second for dimEventCategory was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimSuplier_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Suplier Second Done', 
								'ETL Second for dimSuplier was successfull',
								'L',
								'D',
								GETDATE()
								)

	EXEC DW_DimEmployee_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Employee Second Done', 
								'ETL Second for dimEmployee was successfull',
								'L',
								'D',
								GETDATE()
								)	

	EXEC DW_DimType_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Type Second Done', 
								'ETL Second for dimType was successfull',
								'L',
								'D',
								GETDATE()
								)

	--- Facts ---
	---Cultural--
	EXEC DW_Fact_Tran_Research_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Tran Research Second Done', 
								'ETL Second for transactionFactOverResearch was successfull',
								'H',
								'F',
								GETDATE()
								)
	
	EXEC DW_Fact_Snap_Research_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Snap Research Second Done', 
								'ETL Second for snapFactOverResearch was successfull',
								'H',
								'F',
								GETDATE()
								)

	EXEC DW_Fact_Acc_Research_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Acc Research Second Done', 
								'ETL Second for accFactOverResearch was successfull',
								'H',
								'F',
								GETDATE()
								)
	---- Lendings -----
	EXEC DW_Fact_Tran_BorrowedBooks_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Tran Borrowed Books Second Done', 
								'ETL Second for transactionFactOverBorrowedBooks was successfull',
								'H',
								'F',
								GETDATE()
								)
	
	EXEC DW_Fact_Snap_Lendings_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Snap Borrowed Books Second Done', 
								'ETL Second for snapFactOverBorrowedBooks was successfull',
								'H',
								'F',
								GETDATE()
								)

	EXEC DW_Fact_Acc_Lendings_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Acc BorrowedBooks Second Done', 
								'ETL Second for accFactOverBorrowedBooks was successfull',
								'H',
								'F',
								GETDATE()
								)

	EXEC DW_Fact_Factless_AuthorBook_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Factless AuthorBook Second Done', 
								'ETL second for factless_authorBook was successfull',
								'M',
								'F',
								GETDATE()
								)

	------ Finance -----
	EXEC DW_Fact_Tran_Salary_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Tran Salary Second Done', 
								'ETL Second for transactionFactOverSalary was successfull',
								'H',
								'F',
								GETDATE()
								)
	
	EXEC DW_Fact_Snap_Salary_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Snap Salary Second Done', 
								'ETL Second for snapFactOverSalary was successfull',
								'H',
								'F',
								GETDATE()
								)

	EXEC DW_Fact_Acc_Financial_Salary_Second_SP
	INSERT INTO ETL_LOGS VALUES ('Fact Acc Salary Second Done', 
								'ETL Second for accFactOverSalary was successfull',
								'H',
								'F',
								GETDATE()
								)

END
GO