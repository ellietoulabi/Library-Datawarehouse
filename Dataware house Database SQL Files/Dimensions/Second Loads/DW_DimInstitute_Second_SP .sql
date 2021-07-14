﻿-----------------###### DW DimInstitute Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimInstitute_Second_SP
AS
BEGIN
	declare @tmp table (
		id int,
		name varchar(255)
	)
	insert into @tmp
	select ID,Name from LibraryDW.dbo.dimInstitute

	insert into @tmp
	select q.ID,q.Name from LibraryDW.dbo.dimInstitute as d
	left join LibrarySA.dbo.Institute as q
	on d.ID=q.ID
	where d.ID is null

	TRUNCATE TABLE LibraryDW.dbo.dimInstitute
	INSERT INTO LibraryDW.dbo.dimInstitute
	SELECT ID,Name FROM @tmp

	delete @tmp
END
go
