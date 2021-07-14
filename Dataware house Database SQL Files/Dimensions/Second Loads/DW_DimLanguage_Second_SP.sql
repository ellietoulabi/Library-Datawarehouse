-----------------###### DW DimLanguageSecond SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimLanguage_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimLanguage') IS NOT NULL
	BEGIN
		DROP TABLE tmpDimLanguage
	END
	CREATE TABLE tmpDimLanguage
	(
		ID INT NOT NULL PRIMARY KEY,
		[Name] VARCHAR(255),
		Abbreviation VARCHAR(25)
	);
	TRUNCATE TABLE tmpDimLanguage
	INSERT INTO tmpDimLanguage(ID,Name,Abbreviation)
	SELECT ID,Name,Abbreviation FROM [dimLanguage]

	TRUNCATE TABLE LibraryDW.dbo.dimLanguage

	INSERT INTO LibraryDW.dbo.dimLanguage(ID,Name,Abbreviation)
	SELECT ISNULL(S.ID,D.ID),
		ISNULL(S.Name,D.Name),
		ISNULL(S.abbreviation,D.Abbreviation)
	FROM [LibrarySA].[dbo].[Language] AS S FULL OUTER JOIN tmpDimLanguage AS D ON S.ID=D.ID
	DROP TABLE tmpDimLanguage
END
go

--EXEC DW_DimLanguage_Second_SP
