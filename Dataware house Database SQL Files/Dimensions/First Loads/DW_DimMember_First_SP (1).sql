-----------------###### DW DimMember First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimMember_First_SP
AS
BEGIN
	declare @CurrDate date
	declare @StartDate date
	declare @MaxDate date

	set @StartDate = (select min(Registration_Date) from [LibrarySA].[dbo].[Member])
	set @MaxDate = (select max(Registration_Date) from [LibrarySA].[dbo].[Member])
	set @CurrDate = @StartDate;
	truncate table [LibraryDW].[dbo].[dimMember];
	while @CurrDate <= @MaxDate
	begin		
		insert into [LibraryDW].[dbo].[dimMember]
		select sam.ID,sam.Firstname,sam.Lastname,sam.NationalCode,sam.[Address],sam.Phone,sam.Registration_Date,
		dwb.ID,dwb.BranchCode ,dwb.[Name],sam.Registration_Valid_Date,sam.Gender_ID,sam.Gender, sam.HighestQualificationID,
		sam.HighestQualificationName
		from [LibrarySA].[dbo].[Member] as sam join [LibraryDW].[dbo].[dimBranch] as dwb
		on sam.Branch_Code = dwb.BranchCode
		where sam.Registration_Date >= @CurrDate and sam.Registration_Date < DATEADD(DAY,1,@CurrDate)
		
		set @CurrDate = DATEADD(DAY,1,@CurrDate)
	end
END
GO


