-----------------###### DW DimTranslator Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimTranslator_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimTranslator') IS NOT NULL
	BEGIN
		DROP TABLE tmpDimTranslator
	END
	CREATE TABLE tmpDimTranslator(
		ID			INT NOT NULL PRIMARY KEY,
		Firstname	VARCHAR(255),
		Lastname	VARCHAR(255)
	);
	TRUNCATE TABLE tmpDimTranslator
	INSERT INTO tmpDimTranslator(ID,Firstname,Lastname)
	SELECT ID,Firstname,Lastname FROM [dimTranslator]

	TRUNCATE TABLE LibraryDW.dbo.dimTranslator

	INSERT INTO LibraryDW.dbo.dimTranslator(ID,Firstname,Lastname)
	SELECT ISNULL(S.ID,D.ID),
		ISNULL(S.Firstname,D.Firstname),
		ISNULL(S.Lastname,D.Lastname)
	FROM [LibrarySA].[dbo].[Translator] AS S FULL OUTER JOIN tmpDimTranslator AS D ON S.ID=D.ID
	DROP TABLE tmpDimTranslator
END
go

--EXEC DW_DimTranslator_Second_SP