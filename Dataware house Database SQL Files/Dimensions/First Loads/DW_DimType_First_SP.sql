﻿-----------------###### DW DimType First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimType_First_SP
AS
BEGIN
	truncate table dimType;

	insert into dimType
	select TypeKey,Name,subTypeKey,subType_name
	from [LibrarySA].[dbo].[TypeHelper]

END
go
