﻿-----------------###### DW DimAge_Range Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimAgeRange_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimAge_Range') IS NOT NULL
	BEGIN
		DROP TABLE LibraryDW.dbo.tmpDimAge_Range
	END
	CREATE TABLE tmpDimAge_Range (
		ID			INT NOT NULL PRIMARY KEY,
		Title		VARCHAR(255),
		Description VARCHAR(500)
	);
	TRUNCATE TABLE tmpDimAge_Range
	INSERT INTO tmpDimAge_Range(ID,Title,Description)
	SELECT ID,Title,Description FROM [dimAge_Range]

	TRUNCATE TABLE LibraryDW.dbo.dimAge_Range

	INSERT INTO LibraryDW.dbo.dimAge_Range(ID,Title,Description)
	SELECT ISNULL(S.ID,D.ID),
		ISNULL(S.Title,D.Title),
		ISNULL(S.Description,D.Description)
	FROM [LibrarySA].[dbo].[Age_Range] AS S FULL OUTER JOIN tmpDimAge_Range AS D ON S.ID=D.ID
	DROP TABLE tmpDimAge_Range
END
go