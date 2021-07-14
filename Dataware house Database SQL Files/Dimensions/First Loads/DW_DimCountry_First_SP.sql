﻿-----------------###### DW DimCountryFirst SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimCountry_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimCountry
	INSERT INTO LibraryDW.dbo.dimCountry
	SELECT ID,Name FROM LibrarySA.dbo.Country
END
go