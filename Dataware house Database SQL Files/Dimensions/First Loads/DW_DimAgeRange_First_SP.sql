﻿-----------------###### DW DimAgeRange First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimAgeRange_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimAge_Range
	INSERT INTO LibraryDW.dbo.dimAge_Range
	SELECT ID,Title,Description FROM LibrarySA.dbo.Age_Range
END
go

--EXEC DW_DimAgeRange_First_SP
