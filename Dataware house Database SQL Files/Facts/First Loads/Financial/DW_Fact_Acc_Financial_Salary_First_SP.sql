-----------------###### DW Fact Acc Financial Salary First SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Acc_Financial_Salary_First_SP 
AS
	TRUNCATE TABLE [FinancialDataMart].accFactOverSalary 
	INSERT INTO [FinancialDataMart].accFactOverSalary
	SELECT BranchID,EmployeeID,PositionID,Max(MaxPaid) AS MaxPaid,(SUM(TotalPaid)/SUM(MonthsWorked)) AS AvgPaid,SUM(MonthsWorked) MonthsWorked,SUM(TotalPaid) TotalPaid
	FROM [FinancialDataMart].snapshotFactOverSalary
	GROUP BY BranchID,EmployeeID,PositionID

--EXEC DW_Fact_Acc_Financial_Salary_First_SP 


