﻿-----------------###### DW DimLanguageFirst SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimLanguage_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimLanguage
	INSERT INTO LibraryDW.dbo.dimLanguage
	SELECT ID,Name,Abbreviation FROM LibrarySA.dbo.Language
END
go
