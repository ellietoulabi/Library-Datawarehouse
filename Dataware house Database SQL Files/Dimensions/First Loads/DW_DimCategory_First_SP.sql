﻿-----------------###### DW DimCategoryFirst SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimCategory_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimCategory
	INSERT INTO LibraryDW.dbo.dimCategory
	SELECT ID,Name FROM LibrarySA.dbo.Category
END
go
