-----------------###### DW DimCategory Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimCategory_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimCategory') IS NOT NULL
	BEGIN
		DROP TABLE tmpDimCategory
	END
	CREATE TABLE tmpDimCategory (
		ID		INT NOT NULL PRIMARY KEY,
		[Name]	VARCHAR(255) 
	);
	TRUNCATE TABLE tmpDimCategory
	INSERT INTO tmpDimCategory(ID,[Name])
	SELECT ID,[Name] FROM [dimCategory]

	TRUNCATE TABLE LibraryDW.dbo.dimCategory

	INSERT INTO LibraryDW.dbo.dimCategory(ID,[Name])
	SELECT ISNULL(S.ID,D.ID),
		ISNULL(S.Name,D.Name)
	FROM [LibrarySA].[dbo].[Category] AS S FULL OUTER JOIN tmpDimCategory AS D ON S.ID=D.ID
	DROP TABLE tmpDimCategory
END
go

--EXEC DW_DimCategory_Second_SP

