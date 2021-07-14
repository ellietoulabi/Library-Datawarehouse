﻿-----------------###### DW DimEditor First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimEditor_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimEditor
	INSERT INTO LibraryDW.dbo.dimEditor
	SELECT ID,Firstname,Lastname FROM LibrarySA.dbo.Editor
END
go

--EXEC DW_DimEditor_First_SP
