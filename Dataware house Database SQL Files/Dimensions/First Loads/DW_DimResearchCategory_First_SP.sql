-----------------###### DW DimResearchCategory First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimResearchCategory_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimResearchCategory
	INSERT INTO LibraryDW.dbo.dimResearchCategory
	SELECT ID,Name FROM LibrarySA.dbo.Research_Category
END
go