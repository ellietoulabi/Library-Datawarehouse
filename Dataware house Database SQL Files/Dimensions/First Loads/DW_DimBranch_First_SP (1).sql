-----------------###### DW DimBranch First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimBranch_First_SP
AS
BEGIN
	TRUNCATE TABLE [LibraryDW].[dbo].[dimBranch];
	INSERT INTO [dbo].[dimBranch]
			   ([ID]
			   ,[BranchCode]
			   ,[Name]
			   ,[Address]
			   ,[Phone]
			   ,[City_ID]
			   ,[City_name]
			   ,[Province_ID]
			   ,[Province_name])
		 SELECT B.ID,B.BranchCode,B.Name,B.Address,B.Phone,B.City_ID,C.Name,C.Province_ID,P.Name
		 FROM [LibrarySA].[dbo].[Branch] as B inner join [LibrarySA].[dbo].[City] as C on B.City_ID=C.ID 
		 inner join [LibrarySA].[dbo].[Province] as  P on C.Province_ID=P.ID
END
GO

