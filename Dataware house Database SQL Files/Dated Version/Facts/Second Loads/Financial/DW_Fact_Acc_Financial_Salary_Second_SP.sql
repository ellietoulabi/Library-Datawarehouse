-----------------###### DW Fact Acc Financial Salary Second SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Acc_Financial_Salary_Second_SP 
AS
	TRUNCATE TABLE [FinancialDataMart].accFactOverSalary 
	INSERT INTO [FinancialDataMart].accFactOverSalary
	SELECT BranchID,EmployeeID,PositionID,Max(MaxPaid) AS MaxPaid,(SUM(TotalPaid)/SUM(MonthsWorked)) AS AvgPaid,SUM(MonthsWorked) MonthsWorked,SUM(TotalPaid) TotalPaid
	FROM [FinancialDataMart].snapshotFactOverSalary
	GROUP BY BranchID,EmployeeID,PositionID

--EXEC DW_Fact_Acc_Financial_Salary_Second_SP 


