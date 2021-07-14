﻿-----------------###### DW DimEditor Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimEditor_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimEditor') IS NOT NULL
	BEGIN
		DROP TABLE tmpDimEditor
	END
	CREATE TABLE tmpDimEditor(
		ID			INT NOT NULL PRIMARY KEY,
		Firstname	VARCHAR(255),
		Lastname	VARCHAR(255)
	);
	TRUNCATE TABLE tmpDimEditor
	INSERT INTO tmpDimEditor(ID,Firstname,Lastname)
	SELECT ID,Firstname,Lastname FROM [dimEditor]

	TRUNCATE TABLE LibraryDW.dbo.dimEditor

	INSERT INTO LibraryDW.dbo.dimEditor(ID,Firstname,Lastname)
	SELECT ISNULL(S.ID,D.ID),
		ISNULL(S.Firstname,D.Firstname),
		ISNULL(S.Lastname,D.Lastname)
	FROM [LibrarySA].[dbo].[Editor] AS S FULL OUTER JOIN tmpDimEditor AS D ON S.ID=D.ID
	DROP TABLE tmpDimEditor
END
go

--EXEC DW_DimEditor_Second_SP

