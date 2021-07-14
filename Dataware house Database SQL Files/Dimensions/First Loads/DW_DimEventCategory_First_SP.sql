-----------------###### DW DimEventCategory First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimEventCategory_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimEventCategory
	INSERT INTO LibraryDW.dbo.dimEventCategory
	SELECT ID,Name FROM LibrarySA.dbo.Event_Category
END
go

--EXEC DW_DimEventCategory_First_SP
