﻿-----------------###### DW DimPosition First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimPosition_First_SP
AS
BEGIN
	declare @tmp table (
		sid int identity(1,1),
		id int,
		t varchar(255),
		s bigint,
		sd datetime,
		ed datetime,
		cf bit
	)

	insert into @tmp
	select 
	case
		when ps.ID is null then pw.ID
		when pw.ID is null then ps.ID
		else pw.ID
	end,
	case
		when ps.Title is null then pw.Title
		when pw.Title is null then ps.Title
		else pw.Title
	end,
	case 
		when ps.Salary is not null and pw.Salary is NUll then ps.Salary
		when ps.Salary is null and pw.Salary is not null then pw.Salary
		when ps.Salary = pw.Salary and pw.Current_Flag = 1 then pw.Salary
		when ps.Salary = pw.Salary and pw.Current_Flag = 0  then pw.Salary
		else pw.Salary
	end,
	case
		when ps.ID is null and pw.ID is not null then pw.Start_Date
		when ps.ID is not null and pw.ID is null then DATEADD(SECOND,1,GETDATE())
		else pw.Start_Date
	end as sd,
	case 
		when ps.ID is null and pw.ID is not null then pw.End_Date
		when ps.ID is not null and pw.ID is null then NULL
		when ps.Salary <> pw.Salary and pw.Current_Flag = 1 then GETDATE()
		when ps.ID is not null and pw.ID is not null then pw.End_Date
	end as ed,
	case 
		when ps.Salary = pw.Salary and pw.End_Date is  NULL then 1
		when ps.Salary = pw.Salary and pw.End_Date is NOT  NULL then 0
		when ps.Salary <> pw.Salary and pw.End_Date is NULL then 0
		when ps.Salary <> pw.Salary and pw.End_Date is not null then 0
		when ps.Salary is not null and pw.Salary is null then 1
		when ps.Salary is null and pw.Salary is not null then pw.Current_Flag
	end
	from LibrarySA.dbo.Position as ps full join LibraryDW.dbo.dimPosition as pw
	on ps.ID=pw.ID

	insert into @tmp
	select sp.ID,sp.Title,sp.Salary,GETDATE(),NULL,1 
	from LibraryDW.dbo.dimPosition as dp right join LibrarySA.dbo.Position as sp
	on dp.ID=sp.ID
	where dp.End_Date is null and dp.Salary <> sp.Salary

	truncate table LibraryDW.dbo.dimPosition 
	
	insert into LibraryDW.dbo.dimPosition 
	select id,t,s,sd,ed,cf from @tmp
	order by sid

	delete @tmp

END
go
