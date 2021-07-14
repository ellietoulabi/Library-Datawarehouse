-----------------###### DW DimResearchCategory Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimResearchCategory_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimResearchCategory') IS NOT NULL
	BEGIN
		DROP TABLE tmpDimResearchCategory
	END
	CREATE TABLE tmpDimResearchCategory (
		ID		INT NOT NULL PRIMARY KEY,
		[Name]	VARCHAR(255) 
	);
	TRUNCATE TABLE tmpDimResearchCategory
	INSERT INTO tmpDimResearchCategory(ID,[Name])
	SELECT ID,[Name] FROM [dimResearchCategory]

	TRUNCATE TABLE LibraryDW.dbo.dimResearchCategory

	INSERT INTO LibraryDW.dbo.dimResearchCategory(ID,[Name])
	SELECT ISNULL(S.ID,D.ID),
		ISNULL(S.Name,D.Name)
	FROM [LibrarySA].[dbo].[Research_Category] AS S FULL OUTER JOIN tmpDimResearchCategory AS D ON S.ID=D.ID
	DROP TABLE tmpDimResearchCategory
END
go