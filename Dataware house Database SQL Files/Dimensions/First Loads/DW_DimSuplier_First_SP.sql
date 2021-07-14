﻿﻿-----------------###### DW DimSuplier First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimSuplier_First_SP
AS
BEGIN
	declare @tmp table
	(
		id int,
		n varchar(200),
		p varchar(20),
		a varchar(500),
		cid int,
		cn varchar(200)
	);

	insert into @tmp
	select 
	d.ID,
	d.Name,
	isnull(s.Phone,d.Phone),
	isnull(s.Address,d.Address),
	d.City_ID,
	d.City_name
	from dimSuplier as d left join LibrarySA.dbo.Suplier as s
	on d.ID=s.ID
		
	insert into @tmp
	select ID,Name,Phone,Address,City_ID,City_Name
	from LibrarySA.dbo.Suplier
	where ID not in (select ID from dimSuplier)

	truncate table dimSuplier

	insert into dimSuplier
	select id,n,p,a,cid,cn from @tmp
END
go