-----------------###### DW DimCountry Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimCountry_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimCountry') IS NOT NULL
	BEGIN
		DROP TABLE tmpDimCountry
	END
	CREATE TABLE tmpDimCountry (
		ID		INT NOT NULL PRIMARY KEY,
		[Name]	VARCHAR(255) 
	);
	TRUNCATE TABLE tmpDimCountry
	INSERT INTO tmpDimCountry(ID,[Name])
	SELECT ID,[Name] FROM [dimCountry]

	TRUNCATE TABLE LibraryDW.dbo.dimCountry

	INSERT INTO LibraryDW.dbo.dimCountry(ID,[Name])
	SELECT ISNULL(S.ID,D.ID),
		ISNULL(S.Name,D.Name)
	FROM [LibrarySA].[dbo].[Country] AS S FULL OUTER JOIN tmpDimCountry AS D ON S.ID=D.ID
	DROP TABLE tmpDimCountry
END
go

--EXEC DW_DimCountry_Second_SP



