-----------------###### DW DimMember Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimMember_Second_SP
AS
BEGIN
	create table [LibraryDW].[dbo].[tmpTableDimMember] (
		id int ,
		fn varchar(255),
		ln varchar(255),
		nc varchar(15),
		ad varchar(500),
		ph varchar(20),
		rd date,
		bid int,
		bc int,
		bn varchar(255),
		rvd date,
		gid int,
		gn varchar(255),
		hqid int,
		hqn varchar(255)
	);

	declare @CurrDate date
	declare @StartDate date
	declare @MaxDate date

	set @StartDate = (select min(Registration_Date) from [LibraryDW].[dbo].[dimMember])
	set @MaxDate = (select max(Registration_Date) from [LibraryDW].[dbo].[dimMember])
	set @CurrDate = @StartDate;

	while @CurrDate <= @MaxDate
	begin
		insert into [LibraryDW].[dbo].[tmpTableDimMember](id,fn,ln,nc,ad,ph,rd,bid,bc,bn,rvd,gid,gn,hqid,hqn)
		select dwm.ID, dwm.Firstname, dwm.Lastname,dwm.NationalCode,
		isnull(sam.[Address],dwm.[Address]),
		isnull(sam.Phone,dwm.Phone),
		dwm.Registration_Date,
		dwm.Branch_ID,
		dwm.BranchCode,
		dwm.Branch_name,
		dwm.Registration_Valid_Date,
		dwm.Gender_ID,
		dwm.Gender_Name,
		dwm.HighestQualificationID,
		dwm.HighestQualificationName
		from [LibraryDW].[dbo].[dimMember] as dwm left join [LibrarySA].[dbo].[Member] as sam
		on dwm.NationalCode=sam.NationalCode
		where dwm.Registration_Date >= @CurrDate and dwm.Registration_Date < DATEADD(DAY,1,@CurrDate)
		order by dwm.ID

		set @CurrDate = DATEADD(DAY,1,@CurrDate)
	end

	set @StartDate = (select max(Registration_Date) from [LibraryDW].[dbo].[dimMember])
	set @MaxDate = (select max(Registration_Date) from [LibrarySA].[dbo].[Member])
	set @CurrDate = @StartDate;

	-- filling tmp table with new data that dimMember does't have
	while @CurrDate <= @MaxDate
	begin
		insert into [LibraryDW].[dbo].[tmpTableDimMember](id,fn,ln,nc,ad,ph,rd,bid,bc,bn,rvd,gid,gn,hqid,hqn)
		select sam.ID, sam.Firstname, sam.Lastname,sam.NationalCode,
		sam.[Address],
		sam.Phone,
		sam.Registration_Date,
		dwb.Branch_ID,
		dwb.BranchCode,
		dwb.Branch_Name,
		sam.Registration_Valid_Date,
		sam.Gender_ID,
		sam.Gender,
		sam.HighestQualificationID,
		sam.HighestQualificationName
		from ([LibraryDW].[dbo].[dimMember] as dwm right join [LibrarySA].[dbo].[Member] as sam
		on dwm.NationalCode=sam.NationalCode)
		join [LibraryDW].[dbo].[dimMember] as dwb
		on sam.Branch_Code = dwb.BranchCode
		where dwm.ID is null and sam.Registration_Date >= @CurrDate and sam.Registration_Date < DATEADD(DAY,1,@CurrDate)
		order by sam.ID

		set @CurrDate = DATEADD(DAY,1,@CurrDate)
	end
	
	
	truncate table [LibraryDW].[dbo].[dimMember];
	insert into [LibraryDW].[dbo].[dimMember](  [ID]
											   ,[Firstname]
											   ,[Lastname]
											   ,[NationalCode]
											   ,[Address]
											   ,[Phone]
											   ,[Registration_Date]
											   ,[Branch_ID]
											   ,[BranchCode]
											   ,[Branch_name]
											   ,[Registration_Valid_Date]
											   ,[Gender_ID]
											   ,[Gender_Name]
											   ,[HighestQualificationID]
											   ,[HighestQualificationName])
										select id,fn,ln,nc,ad,ph,rd,bid,bc,bn,rvd,gid,gn,hqid,hqn from [LibraryDW].[dbo].[tmpTableDimMember]
										order by id
	drop table [LibraryDW].[dbo].[tmpTableDimMember]
	

END
GO

