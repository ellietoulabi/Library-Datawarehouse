-----------------###### DW DimEventCategory Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimEventCategory_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimEventCategory') IS NOT NULL
	BEGIN
		DROP TABLE tmpDimEventCategory
	END
	CREATE TABLE tmpDimEventCategory (
		ID		INT NOT NULL PRIMARY KEY,
		[Name]	VARCHAR(255) 
	);
	TRUNCATE TABLE tmpDimEventCategory
	INSERT INTO tmpDimEventCategory(ID,[Name])
	SELECT ID,[Name] FROM [dimEventCategory]

	TRUNCATE TABLE LibraryDW.dbo.dimEventCategory

	INSERT INTO LibraryDW.dbo.dimEventCategory(ID,[Name])
	SELECT ISNULL(S.ID,D.ID),
		ISNULL(S.Name,D.Name)
	FROM [LibrarySA].[dbo].[Event_Category] AS S FULL OUTER JOIN tmpDimEventCategory AS D ON S.ID=D.ID
	DROP TABLE tmpDimEventCategory
END
go

--EXEC DW_DimEventCategory_Second_SP



