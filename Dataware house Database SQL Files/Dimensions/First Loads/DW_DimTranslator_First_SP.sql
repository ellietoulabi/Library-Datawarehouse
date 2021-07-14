﻿-----------------###### DW DimTranslator First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimTranslator_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimTranslator
	INSERT INTO LibraryDW.dbo.dimTranslator
	SELECT ID,Firstname,Lastname FROM LibrarySA.dbo.Translator
END
go