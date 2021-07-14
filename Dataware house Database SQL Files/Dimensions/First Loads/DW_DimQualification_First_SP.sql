﻿-----------------###### DW DimQualification First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimQualification_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimQualification
	INSERT INTO LibraryDW.dbo.dimQualification
	SELECT ID,Name FROM LibrarySA.dbo.Qualification
END
go
