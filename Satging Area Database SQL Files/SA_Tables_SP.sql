Use LibrarySA
GO
CREATE OR ALTER PROCEDURE SA_Tables_SP
AS
BEGIN
	CREATE TABLE [LibrarySA].[dbo].City(
		ID INT,
		Name VARCHAR(255),
		Province_ID INT
	);

	CREATE TABLE [LibrarySA].[dbo].[Branch](
		[ID] [int] NOT NULL,
		[Name] [varchar](255) NULL,
		[Address] [nvarchar](500) NULL,
		[BranchCode] [int] NULL,
		[Phone] [varchar](20) NULL,
		[City_ID] [int] NULL
	
	);

	CREATE TABLE [LibrarySA].[dbo].[Province](
		[ID] [int] NULL,
		[Name] [varchar](255) NULL
	);

	CREATE TABLE [LibrarySA].[dbo].[Research_Category]
	(
		ID INT,
		[Name] VARCHAR(200) 
	);

	CREATE TABLE [LibrarySA].[dbo].[Research_Type]
	(
		ID int	NOT NULL,
		Name varchar(200)
	);

	create table [LibrarySA].[dbo].[Research]
	(
		ID int,
		Title varchar(200),
		[Description] varchar(500),
		Cost bigint,
		[StartDate] datetime,
		[EndDate] datetime,
		DocumentURL varchar(200),
		Branch_ID int,
		Category_ID int,
		Research_Type_ID int,
		Research_State_ID int,
		Supervisor_ID int
	);
	create table Research_Payments
	(
		ID int,
		Research_ID int,
		Payment bigint,
		PayDate datetime
	);

	CREATE TABLE [LibrarySA].[dbo].[Research_Member](
		[Research_ID] [int] ,
		[Member_ID] [int] 
	);
	CREATE TABLE [LibrarySA].[dbo].[Member](
		[ID] [int] NULL,
		[Firstname] [varchar](255) NULL,
		[Lastname] [varchar](255) NULL,
		[NationalCode] [varchar](20) NULL,
		[Address] [varchar](500) NULL,
		[Phone] [varchar](20) NULL,
		[Registration_Date] [date] NULL,
		[Branch_Code] [int] NULL,
		[Branch_ID] [int] NULL,
		[Branch_Name] [varchar](255) NULL,
		[Registration_Valid_Date] [date] NULL,
		[Gender_ID] [int] NULL,
		[Gender] [varchar](200) NULL,
		[HighestQualificationID] [int] NULL,
		[HighestQualificationName] [varchar](200) NULL

	);

	CREATE TABLE [LibrarySA].[dbo].[MaritalHelper](
		[Key] [int],
		[Name] [varchar](200)
	);
	create table [LibrarySA].[dbo].[Gender]
	(
		ID int,
		Name varchar(200)
	);
	create table [LibrarySA].[dbo].[Institute]
	(
		ID int,
		Name varchar(200)
	);
	create table [LibrarySA].[dbo].[Qualification]
	(
		ID int,
		Name varchar(200)
	);

	create table [LibrarySA].[dbo].[Research_State]
	(
		ID int,
		Name varchar(200)
	);
	create table [LibrarySA].[dbo].[Country]
	(
		ID int,
		Name varchar(200)
	);
	create table [LibrarySA].[dbo].[PhysicalType]
	(
		ID int,
		[Name] varchar(200)
	);
	create table [LibrarySA].[dbo].[BookSize]
	(
		ID int,
		[Name] varchar(200)
	);
	create table [LibrarySA].[dbo].[Author]
	(
		ID int,
		Firstname varchar(200),
		Lastname varchar(200),
		Country_ID int,
		Gender_ID int,
		BirthYear int,
		DeathYear int,
		Style varchar(300)
	);
	create table [LibrarySA].[dbo].[Category]
	(
		ID int,
		Name varchar(200) 
	);
	create table [LibrarySA].[dbo].[Age_Range]
	(
		ID int,
		Title varchar(200),
		Description varchar(500)
	);
	create table [LibrarySA].[dbo].[Translator]
	(
		ID int,
		Firstname varchar(200),
		Lastname varchar(200)
	);
	create table [LibrarySA].[dbo].[Language]
	(
		ID int,
		[Name] varchar(200),
		Abbreviation varchar(20)
	);
	create table [LibrarySA].[dbo].[Suplier]
	(
		ID int,
		[Name] varchar(200),
		Phone varchar(20),
		[Address] varchar(500),
		City_ID int,
		City_Name varchar(200)
	);
	create table [LibrarySA].[dbo].[Publisher]
	(
		ID int,
		[Name] varchar(200),
		Phone varchar(20),
		[Address] varchar(500), 
		City_ID int
	);
	create table [LibrarySA].[dbo].[Editor]
	(
		ID int,
		Firstname varchar(200),
		Lastname varchar(200)
	);
	create table [LibrarySA].[dbo].[Budget]
	(
		ID int,
		Amount bigint,
		[Date] datetime,
		Branch_ID int
	);
	create table [LibrarySA].[dbo].[Event_Category]
	(
		ID int,
		[Name] varchar(200) 
	);

	create table [LibrarySA].[dbo].[Event]
	(
		ID int,
		Title varchar(200),
		[Description] varchar(500),
		Cost bigint,
		[Date] datetime,
		Branch_ID int,
		Category_ID int
	);
	create table [LibrarySA].[dbo].[Position]
	(
		ID int,
		Title varchar(200),
		Salary bigint
	);
	create table [LibrarySA].[dbo].[Employee]
	(
		ID int,
		Firstname varchar(200),
		Lastname varchar(200),
		NationalCode varchar(10),
		[Address] varchar(500),
		Phone varchar(20),
		Hire_Date date,
		Branch_ID int,
		Position_ID int,
		Institute_ID int,
		Gender_ID int,
		Employee_No varchar(20),
		YearOfPassing int,
		HighestQualificationID int,
		MaritalStatus bit
	);
	create table [LibrarySA].[dbo].[Salary]
	(
		ID int,
		Salary bigint,
		[Date] datetime,
		Employee_ID int
	);
	create table [LibrarySA].[dbo].[MembershipPay]
	(
		ID int,
		Member_ID int,
		Amount bigint,
		[Date] datetime
	);
	create table [LibrarySA].[dbo].[Book]
	(
		ID int,
		ISBN varchar(20),
		Title varchar(200),
		[Description] varchar(500),
		[Year] int,
		Publisher_ID int,
		Category_ID int,
		Age_Range_ID int,
		Translator_ID int,
		Editor_ID int,
		Language_ID int,
		RepublicationNo int,
		NumOfPages int,
		NumOfEditions int,
		NumOfCopiesPrinted int
	);
	create table [LibrarySA].[dbo].[Author_Book]
	(
		Author_ID int not null,
		Book_ID int not null
	);
	create table [LibrarySA].[dbo].[Book_Volume]
	(
		ID int,
		[Location] varchar(20),
		Book_ID int,
		Branch_ID int,
		Price bigint,
		PhysicalType_ID int,
		BookSize_ID int,
		[Year] int,
		NoCopiesPrinted int,
		EditionNo int,
		RepublicationNo int

	);
	create table [LibrarySA].[dbo].[Borrowed_Books]
	(
		ID int,
		Borrowing_Date datetime,
		Due_Date date,
		Returned_Date datetime,
		Member_ID int,
		Employee_ID int,
		BookV_ID int,
		Modified_Date datetime NULL
	);
	create table [LibrarySA].[dbo].[Fine_Paid]
	(
		ID int,
		Payment bigint,
		[date] datetime,
		Borrowed_ID int
	);
	create table [LibrarySA].[dbo].[BuyHeader]
	(
		ID int,
		BooksPay bigint,
		TransportPay bigint,
		Total_Due bigint,
		Branch_ID int,
		Employee_ID int,
		Suplier_ID int,
		[Date] datetime
	);
	create table [LibrarySA].[dbo].[BuyDetail]
	(
		ID int,
		Header_ID int,
		ISBN varchar(100),
		Cost bigint,
		Number int
	);
	create table [LibrarySA].[dbo].[BookBranch]
	(
		Book_ID int,
		Branch_ID int
	);

	create table [LibrarySA].[dbo].[TypeHelper]
	(
		TypeKey INT,
		Name	VARCHAR(255),
		subTypeKey	INT,
		subType_name VARCHAR(255)
	);
END
go
