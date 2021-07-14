-----------------###### DW DimEmployee Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimEmployee_Second_SP
AS
BEGIN


		CREATE TABLE [LibraryDW].[dbo].[saData](-----------------------data from sa
		[ID] [int] NULL,
		[Firstname] [varchar](255) NULL,
		[Lastname] [varchar](255) NULL,
		[NationalCode] [varchar](15) NULL,
		[Address] [text] NULL,
		[Phone] [varchar](20) NULL,
		[Hire_Date] [date] NULL,
		[Branch_ID] [int] NULL,
		[Branch_name] [varchar](255) NULL,
		[Pre_Position_ID] [int] NULL,
		[Pre_Position_Title] [varchar](255) NULL,
		[Effective_Date] [datetime] NULL,
		[Cur_Position_ID] [int] NULL,
		[Cur_Position_Title] [varchar](255) NULL,
		[Institute_ID] [int] NULL,
		[Institute_Name] [varchar](255) NULL,
		[Gender_ID] [int] NULL,
		[Gender_Name] [varchar](255) NULL,
		[Employee_No] [varchar](25) NULL,
		[YearOfPassing] [int] NULL,
		[HighestQualificationID] [int] NULL,
		[HighestQualificationName] [varchar](255) NULL,
		[MaritalStatusDesc] [varchar](255) NULL);

		CREATE TABLE [LibraryDW].[dbo].[result]( ---------------------------------results
		[ID] [int] NULL,
		[Firstname] [varchar](255) NULL,
		[Lastname] [varchar](255) NULL,
		[NationalCode] [varchar](15) NULL,
		[Address] [text] NULL,
		[Phone] [varchar](20) NULL,
		[Hire_Date] [date] NULL,
		[Branch_ID] [int] NULL,
		[Branch_name] [varchar](255) NULL,
		[Pre_Position_ID] [int] NULL,
		[Pre_Position_Title] [varchar](255) NULL,
		[Effective_Date] [datetime] NULL,
		[Cur_Position_ID] [int] NULL,
		[Cur_Position_Title] [varchar](255) NULL,
		[Institute_ID] [int] NULL,
		[Institute_Name] [varchar](255) NULL,
		[Gender_ID] [int] NULL,
		[Gender_Name] [varchar](255) NULL,
		[Employee_No] [varchar](25) NULL,
		[YearOfPassing] [int] NULL,
		[HighestQualificationID] [int] NULL,
		[HighestQualificationName] [varchar](255) NULL,
		[MaritalStatusDesc] [varchar](255) NULL);

		insert into [LibraryDW].[dbo].[saData](  [ID]
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
				from	   [LibrarySA].[dbo].[Employee] as E 
				inner join [LibraryDW].[dbo].[dimBranch] as B on  E.Branch_ID = B.ID
				inner join [LibraryDW].[dbo].[dimPosition] as P on  E.Position_ID=P.ID
				inner join [LibraryDW].[dbo].[dimInstitute] as I on E.Institute_ID=I.ID
				inner join [LibraryDW].[dbo].[dimGender] as G on E.Gender_ID=G.ID
				inner join [LibraryDW].[dbo].[dimQualification] as Q on E.HighestQualificationID=Q.ID
				inner join [LibrarySA].[dbo].[MaritalHelper] as M on E.MaritalStatus=M.[Key]




		insert into [LibraryDW].[dbo].[result](  [ID]
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
								select			case 
													when s.Employee_No is null then d.ID
													when d.Employee_No is null then s.ID
													else d.ID
												 end,
												 case 
													when s.Employee_No is null then d.Firstname
													when d.Employee_No is null then s.Firstname
													else d.Firstname
												 end,
												 case 
													when s.Employee_No is null then d.Lastname
													when d.Employee_No is null then s.Lastname
													else d.Lastname
												 end,
												 case 
													when s.Employee_No is null then d.NationalCode
													when d.Employee_No is null then s.NationalCode
													else d.NationalCode
												 end,
												 case 
													when s.Employee_No is null then d.Address
													when d.Employee_No is null then s.Address
													else d.Address
												 end,
												 case --SCD1
													when s.Employee_No is null then d.Phone
													when d.Employee_No is null then s.Phone
													else s.Phone 
												 end,
												 case 
													when s.Employee_No is null then d.Hire_Date
													when d.Employee_No is null then s.Hire_Date
													else d.Hire_Date
												 end,
												 case 
													when s.Employee_No is null then d.Branch_ID
													when d.Employee_No is null then s.Branch_ID
													else d.Branch_ID
												 end,
												 case 
													when s.Employee_No is null then d.Branch_name
													when d.Employee_No is null then s.Branch_name
													else d.Branch_name
												 end,
												 case --SCD3
													when s.Employee_No is null and d.Employee_No is not null then d.Pre_Position_ID
													when s.Employee_No is not null and d.Employee_No is null then s.Pre_Position_ID
													when s.Employee_No is not null and  d.Employee_No is not null and d.Cur_Position_ID=s.Cur_Position_ID then d.Pre_Position_ID
													when s.Employee_No is not null and  d.Employee_No is not null and d.Cur_Position_ID<>s.Cur_Position_ID then d.Cur_Position_ID
												 end,
												 case --SCD3
													when s.Employee_No is null and d.Employee_No is not null then d.Pre_Position_Title
													when s.Employee_No is not null and d.Employee_No is null then s.Pre_Position_Title
													when s.Employee_No is not null and  d.Employee_No is not null and d.Cur_Position_ID=s.Cur_Position_ID then d.Pre_Position_Title
													when s.Employee_No is not null and  d.Employee_No is not null and d.Cur_Position_ID<>s.Cur_Position_ID then d.Cur_Position_Title
												 end,
												 case --SCD3
													when s.Employee_No is null and d.Employee_No is not null then d.Effective_Date
													when s.Employee_No is not null and d.Employee_No is null then s.Effective_Date
													when s.Employee_No is not null and  d.Employee_No is not null and d.Cur_Position_ID=s.Cur_Position_ID then d.Effective_Date
													when s.Employee_No is not null and  d.Employee_No is not null and d.Cur_Position_ID<>s.Cur_Position_ID then GETDATE()
												 end,
												 case --SCD3
													when s.Employee_No is null and d.Employee_No is not null then d.Cur_Position_ID
													when s.Employee_No is not null and d.Employee_No is null then s.Cur_Position_ID
													when s.Employee_No is not null and  d.Employee_No is not null and d.Cur_Position_ID=s.Cur_Position_ID then d.Cur_Position_ID
													when s.Employee_No is not null and  d.Employee_No is not null and d.Cur_Position_ID<>s.Cur_Position_ID then s.Cur_Position_ID
												 end,
												 case --SCD3
													when s.Employee_No is null and d.Employee_No is not null then d.Cur_Position_Title
													when s.Employee_No is not null and d.Employee_No is null then s.Cur_Position_Title
													when s.Employee_No is not null and  d.Employee_No is not null and d.Cur_Position_ID=s.Cur_Position_ID then d.Cur_Position_Title
													when s.Employee_No is not null and  d.Employee_No is not null and d.Cur_Position_ID<>s.Cur_Position_ID then s.Cur_Position_Title
												 end,
												 case --SCD1
													when s.Employee_No is null then d.Institute_ID
													when d.Employee_No is null then s.Institute_ID
													else s.Institute_ID 
												 end,
												 case --SCD1
													when s.Employee_No is null then d.Institute_Name
													when d.Employee_No is null then s.Institute_Name
													else s.Institute_Name 
												 end,
												 case 
													when s.Employee_No is null then d.Gender_ID
													when d.Employee_No is null then s.Gender_ID
													else d.Gender_ID
												 end,
												 case 
													when s.Employee_No is null then d.Gender_Name
													when d.Employee_No is null then s.Gender_Name
													else d.Gender_Name
												 end,
												 case 
													when s.Employee_No is null then d.Employee_No
													when d.Employee_No is null then s.Employee_No
													else d.Employee_No
												 end,
												 case --SCD1
													when s.Employee_No is null then d.YearOfPassing
													when d.Employee_No is null then s.YearOfPassing
													else s.YearOfPassing 
												 end,
												 case --SCD1
													when s.Employee_No is null then d.HighestQualificationID
													when d.Employee_No is null then s.HighestQualificationID
													else s.HighestQualificationID 
												 end,
												 case --SCD1
													when s.Employee_No is null then d.HighestQualificationName
													when d.Employee_No is null then s.HighestQualificationName
													else s.HighestQualificationName 
												 end,
												 case --SCD1
													when s.Employee_No is null then d.MaritalStatusDesc
													when d.Employee_No is null then s.MaritalStatusDesc
													else s.MaritalStatusDesc 
												 end
								from [LibraryDW].[dbo].[saData] as s full join [LibraryDW].[dbo].[dimEmployee] as d on s.Employee_No=d.Employee_No


		truncate table [LibraryDW].[dbo].[dimEmployee];
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
										select		[ID]
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
													,[MaritalStatusDesc]
										from LibraryDW.dbo.result


										drop table LibraryDW.dbo.result
										drop table LibraryDW.dbo.saData


END
GO
