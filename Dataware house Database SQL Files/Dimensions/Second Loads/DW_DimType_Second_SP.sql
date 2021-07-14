﻿-----------------###### DW DimType Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimType_Second_SP
AS
BEGIN
	truncate table dimType;

	insert into dimType
	select TypeKey,Name,subTypeKey,subType_name
	from [LibrarySA].[dbo].[TypeHelper]

END
go
