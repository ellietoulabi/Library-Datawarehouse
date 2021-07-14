-----------------###### DW DimResearchType First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimResearchType_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimResearchType
	INSERT INTO LibraryDW.dbo.dimResearchType
	SELECT ID,Name FROM LibrarySA.dbo.Research_Type
END
go