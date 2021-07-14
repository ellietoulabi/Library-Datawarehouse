-----------------###### DW DimBranch Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimBranch_Second_SP
AS
BEGIN
	IF OBJECT_ID('[LibraryDW].[dbo].[tmpBranch]') IS NOT NULL
		BEGIN
			drop table 	[LibraryDW].[dbo].[tmpBranch]
		END
		IF OBJECT_ID('[LibraryDW].[dbo].[tmpResult]') IS NOT NULL
		BEGIN
			drop table 	[LibraryDW].[dbo].[tmpResult]
		END
		IF OBJECT_ID('[LibraryDW].[dbo].[tmpCommen]') IS NOT NULL
		BEGIN
			drop table 	[LibraryDW].[dbo].[tmpCommen]
		END
		IF OBJECT_ID('[LibraryDW].[dbo].[tmpDim]') IS NOT NULL
		BEGIN
			drop table 	[LibraryDW].[dbo].[tmpDim]
		END
	
	
	

		CREATE TABLE [LibraryDW].[dbo].[tmpBranch](
			[ID] [int] NOT NULL,
			[Name] [varchar](200) NULL,
			[Address] nvarchar(500) NULL,
			[BranchCode] [int] NULL,
			[Phone] [varchar](20) NULL,
			[City_ID] [int] NULL,	
			[City_name] varchar(255),
			[Province_ID] [int] NULL,
			[Province_name]  varchar(255)
		);
		CREATE TABLE [LibraryDW].[dbo].[tmpDim](
			[ID] [int] NOT NULL,
			[Name] [varchar](200) NULL,
			[Address] nvarchar(500) NULL,
			[BranchCode] [int] NULL,
			[Phone] [varchar](20) NULL,
			[City_ID] [int] NULL,
			[City_name] varchar(255),
			[Province_ID] [int] NULL,
			[Province_name]  varchar(255)
		);
		CREATE TABLE [LibraryDW].[dbo].[tmpResult](
			[ID] [int] NOT NULL,
			[Name] [varchar](200) NULL,
			[Address] nvarchar(500) NULL,
			[BranchCode] [int] NULL,
			[Phone] [varchar](20) NULL,
			[City_ID] [int] NULL,
			[City_name] varchar(255),
			[Province_ID] [int] NULL,
			[Province_name]  varchar(255)
		);
		CREATE TABLE [LibraryDW].[dbo].[tmpCommen](
			[ID] [int] NOT NULL,
			[Name] [varchar](200) NULL,
			[Address] nvarchar(500) NULL,
			[BranchCode] [int] NULL,
			[Phone] [varchar](20) NULL,
			[City_ID] [int] NULL,
			[City_name] varchar(255),
			[Province_ID] [int] NULL,
			[Province_name]  varchar(255)
		);

	--dim data
	INSERT INTO [LibraryDW].[dbo].[tmpDim] (ID,BranchCode,Name,Address,Phone,City_ID,City_name,[Province_ID],[Province_name])
	SELECT   [ID]
			,[BranchCode]
			,[Name]
			,[Address]
			,[Phone]
			,[City_ID]
			,[City_name]
			,[Province_ID]
			,[Province_name]
		FROM [dbo].[dimBranch]
	--sa data
	INSERT INTO [LibraryDW].[dbo].[tmpBranch] ([ID],[BranchCode],[Name],[Address],[Phone],[City_ID],[City_name],[Province_ID],[Province_name])
	SELECT SB.[ID],SB.[BranchCode],SB.[Name],SB.[Address],SB.[Phone],SB.[City_ID],ISNULL(SC.[Name],'UNKNOWN'),SC.Province_ID,p.Name
	FROM [LibrarySA].[dbo].[Branch] AS SB Left join  [LibrarySA].[dbo].[City] as SC on SB.City_ID=SC.ID 
	left join [LibrarySA].dbo.[Province] as P on p.ID=SC.Province_ID

	-- new records
	INSERT INTO [LibraryDW].[dbo].[tmpResult] ([ID],[BranchCode],[Name],[Address],[Phone],[City_ID],[City_name],[Province_ID],[Province_name])
	SELECT [ID],[BranchCode],[Name],[Address],[Phone],[City_ID],[City_name],[Province_ID],[Province_name]
	FROM [LibraryDW].[dbo].[tmpBranch] AS SB 
	WHERE SB.BranchCode NOT IN (SELECT BranchCode FROM [LibraryDW].[dbo].[tmpDim])
	
	--deleted records
	INSERT INTO [LibraryDW].[dbo].[tmpResult] ([ID],[BranchCode],[Name],[Address],[Phone],[City_ID],[City_name],[Province_ID],[Province_name])
	SELECT [ID],[BranchCode],[Name],[Address],[Phone],[City_ID],[City_name],[Province_ID],[Province_name]
	FROM [LibraryDW].[dbo].[tmpDim] AS DB
	WHERE DB.BranchCode NOT IN (SELECT BranchCode FROM [LibraryDW].[dbo].[tmpBranch])

	-- find commens
	INSERT INTO [LibraryDW].[dbo].[tmpCommen] ([ID],[BranchCode],[Name],[Address],[Phone],[City_ID],[City_name],[Province_ID],[Province_name])
	SELECT TB.[ID],TB.[BranchCode],TB.[Name],TB.[Address],TB.[Phone],TB.[City_ID],TB.[City_name],[Province_ID],[Province_name]
	FROM [LibraryDW].[dbo].[tmpBranch] AS TB 
	WHERE [BranchCode] not in (select BranchCode from [tmpResult])

	--insert commens
	INSERT INTO [LibraryDW].[dbo].[tmpResult] ([ID],[BranchCode],[Name],[Address],[Phone],[City_ID],[City_name],[Province_ID],[Province_name])
	SELECT TB.[ID],TB.[BranchCode],TB.[Name],SB.[Address],SB.[Phone],TB.[City_ID],TB.[City_name],SB.[Province_ID],SB.[Province_name]
	FROM [LibraryDW].[dbo].[tmpCommen] AS SB INNER JOIN [LibraryDW].[dbo].[tmpDim] AS TB ON SB.BranchCode=TB.BranchCode
	

	TRUNCATE TABLE [LibraryDW].[dbo].[dimBranch];

	INSERT INTO [LibraryDW].[dbo].[dimBranch] ([ID],[BranchCode],[Name],[Address],[Phone],[City_ID],[City_name],[Province_ID],[Province_name])
	SELECT SB.[ID],SB.[BranchCode],SB.[Name],SB.[Address],SB.[Phone],SB.[City_ID],SB.[City_name],[Province_ID],[Province_name]
	FROM [LibraryDW].[dbo].[tmpResult] AS SB
	
	drop table 	[LibraryDW].[dbo].[tmpBranch]
	drop table 	[LibraryDW].[dbo].[tmpResult]
	drop table 	[LibraryDW].[dbo].[tmpCommen]
	drop table 	[LibraryDW].[dbo].[tmpDim]
END
GO

