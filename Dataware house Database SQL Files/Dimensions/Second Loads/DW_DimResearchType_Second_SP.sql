-----------------###### DW DimResearchType Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimResearchType_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimResearchType') IS NOT NULL
	BEGIN
		DROP TABLE tmpDimResearchCategory
	END
	CREATE TABLE tmpDimResearchType (
		ID		INT NOT NULL PRIMARY KEY,
		[Name]	VARCHAR(255) 
	);
	TRUNCATE TABLE tmpDimResearchType
	INSERT INTO tmpDimResearchType(ID,[Name])
	SELECT ID,[Name] FROM [dimResearchType]

	TRUNCATE TABLE LibraryDW.dbo.dimResearchCategory

	INSERT INTO LibraryDW.dbo.dimResearchCategory(ID,[Name])
	SELECT ISNULL(S.ID,D.ID),
		ISNULL(S.Name,D.Name)
	FROM [LibrarySA].[dbo].[Research_Type] AS S FULL OUTER JOIN tmpDimResearchType AS D ON S.ID=D.ID
	DROP TABLE tmpDimResearchType
END
go