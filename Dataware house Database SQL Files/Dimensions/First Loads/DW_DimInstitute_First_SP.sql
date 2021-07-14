﻿-----------------###### DW DimInstitute First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimInstitute_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimInstitute
	INSERT INTO LibraryDW.dbo.dimInstitute
	SELECT ID,Name FROM LibrarySA.dbo.Institute
END
go
