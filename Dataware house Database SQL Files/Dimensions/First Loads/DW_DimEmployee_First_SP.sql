-----------------###### DW DimEmployee First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimEmployee_First_SP
AS
BEGIN
	declare @CurrDate date
	declare @StartDate date
	declare @MaxDate date

	set @StartDate = (select min(Hire_Date) from [LibrarySA].[dbo].[Employee])
	set @MaxDate = (select max(Hire_Date) from [LibrarySA].[dbo].[Employee])
	set @CurrDate = @StartDate;
	truncate table [LibraryDW].[dbo].[dimEmployee];
	while @CurrDate <= @MaxDate
	begin		
		insert into [LibraryDW].[dbo].[dimEmployee]([ID]
												   ,[Firstname]
												   ,[Lastname]
												   ,[NationalCode]
												   ,[Address]
												   ,[Phone]
												   ,[Hire_Date]
												   ,[Branch_ID]
												   ,[Branch_name]
												   ,[Pre_Position_ID]
												   ,[Pre_Position_Title]
												   ,[Effective_Date]
												   ,[Cur_Position_ID]
												   ,[Cur_Position_Title]
												   ,[Institute_ID]
												   ,[Institute_Name]
												   ,[Gender_ID]
												   ,[Gender_Name]
												   ,[Employee_No]
												   ,[YearOfPassing]
												   ,[HighestQualificationID]
												   ,[HighestQualificationName]
												   ,[MaritalStatusDesc])
						select E.ID,E.Firstname,E.Lastname,E.NationalCode,E.[Address],E.Phone,E.Hire_Date,
						B.ID,B.[Name],NULL,NULL,E.Hire_Date,E.Position_ID,P.Title,E.Institute_ID,I.Name,E.Gender_ID,G.Name,E.Employee_No,E.YearOfPassing, E.HighestQualificationID,
						Q.Name,M.Name
						from [LibrarySA].[dbo].[Employee] as E 
						inner join [LibrarySA].[dbo].[Branch] as B on  E.Branch_ID = B.ID
						inner join [LibrarySA].[dbo].[Position] as P on  E.Position_ID=P.ID
						inner join [LibrarySA].[dbo].[Institute] as I on E.Institute_ID=I.ID
						inner join [LibrarySA].[dbo].[Gender] as G on E.Gender_ID=G.ID
						inner join [LibrarySA].[dbo].[Qualification] as Q on E.HighestQualificationID=Q.ID
						inner join [LibrarySA].[dbo].[MaritalHelper] as M on E.MaritalStatus=M.[Key]
						where E.Hire_Date >= @CurrDate and E.Hire_Date < DATEADD(DAY,1,@CurrDate)
		
		set @CurrDate = DATEADD(DAY,1,@CurrDate)
	end
END
GO


