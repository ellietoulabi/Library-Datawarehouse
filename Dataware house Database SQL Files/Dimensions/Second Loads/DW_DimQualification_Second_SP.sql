﻿-----------------###### DW DimQualification Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimQualification_Second_SP
AS
BEGIN
	declare @tmp table (
		id int,
		name varchar(255)
	)
	insert into @tmp
	select ID,Name from LibraryDW.dbo.dimQualification

	insert into @tmp
	select q.ID,q.Name from LibraryDW.dbo.dimQualification as d
	left join LibrarySA.dbo.Qualification as q
	on d.ID=q.ID
	where d.ID is null

	TRUNCATE TABLE LibraryDW.dbo.dimQualification
	INSERT INTO LibraryDW.dbo.dimQualification
	SELECT ID,Name FROM @tmp

	delete @tmp
END
go
