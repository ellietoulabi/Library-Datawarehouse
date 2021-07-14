-----------------###### DW Tables Procedure ######---------------
USE LibraryDW
go
	--create schema CulturalDataMart;
	--create schema FinancialDataMart;
	--create schema LendingsDataMart;
CREATE OR ALTER PROCEDURE DW_Tables_SP
AS
BEGIN

	-- Logs
	CREATE TABLE [LibraryDW].[dbo].[ETL_LOGS](
		[ID] [bigint] PRIMARY KEY IDENTITY(1,1),
		[Title] [varchar](200),
		[Description] [varchar](500),
		[Level] [varchar](1) CHECK ([Level] in ('H','M','L')) DEFAULT 'L',
		[Target] [varchar](1) CHECK ([Target] in ('F','D')),
		[LogTime] [datetime] DEFAULT GETDATE()
	);

	
	CREATE TABLE dimBranch (
		ID			INT NOT NULL PRIMARY KEY,
		BranchCode	INT,
		[Name]		VARCHAR(255),
		[Address]	VARCHAR(500),
		Phone		VARCHAR(20),
		City_ID		INT,
		City_name	VARCHAR(255),
		Province_ID	INT,
		Province_name VARCHAR(255)
	);

	CREATE TABLE dimDate (
		TimeKey					    INT NOT NULL PRIMARY KEY,
		FullDateAlternateKey		DATE,
		PersianFullDateAlternateKey NVARCHAR(20),
		DayNumberOfWeek				INT,
		PersianDayNumberOfWeek		INT,
		EnglishDayNameOfWeek		VARCHAR(255),
		PersianDayNameOfWeek		NVARCHAR(255),
		DayNumberOfMonth			INT,
		PersianDayNumberOfMonth		INT,
		DayNumberOfYear				INT,
		PersianDayNumberOfYear		INT,
		WeekNumberOfYear			INT,
		PersianWeekNumberOfYear		INT,
		EnglishMonthName			VARCHAR(255),
		PersianMonthName			NVARCHAR(255),
		MonthNumberOfYear			INT,
		PersianMonthNumberOfYear	INT,
		CalendarQuarter				INT,
		PersianCalendarQuarter		INT,
		CalendarYear				INT,
		PersianCalendarYear			INT,
		CalendarSemester			INT,
		PersianCalendarSemester		INT
	);

	create table dimTime
	(
		[TimeKey] time primary key,
		[Hour] int,
		[Minute] int,
		[Second] int
	)

	CREATE TABLE dimResearchCategory (
		ID		INT NOT NULL PRIMARY KEY,
		[Name]	VARCHAR(255) 
	);

	CREATE TABLE dimResearchType
	(
		ID INT NOT NULL PRIMARY KEY,
		Name VARCHAR(255)
	);

	CREATE TABLE dimEventCategory (
		ID		INT NOT NULL PRIMARY KEY,
		[Name]	VARCHAR(255) 
	);

	CREATE TABLE dimMember (
		ID					INT NOT NULL PRIMARY KEY,
		Firstname			VARCHAR(255),
		Lastname			VARCHAR(255), 
		NationalCode		VARCHAR(15),
		[Address]			VARCHAR(500),
		Phone				VARCHAR(20), --SCD1
		Registration_Date	DATE,
		Branch_ID			INT,
		BranchCode			INT,
		Branch_name			VARCHAR(255),
		Registration_Valid_Date date,
		Gender_ID			INT,
		Gender_Name			VARCHAR(255),
		HighestQualificationID INT,
		HighestQualificationName	VARCHAR(255)
	);

	CREATE TABLE dimGender
	(
		ID INT NOT NULL PRIMARY KEY,
		Name VARCHAR(255)
	);
	CREATE TABLE dimInstitute
	(
		ID INT NOT NULL PRIMARY KEY,
		Name VARCHAR(255)
	);
	CREATE TABLE dimQualification
	(
		ID INT NOT NULL PRIMARY KEY,
		Name VARCHAR(255)
	);

	CREATE TABLE dimCountry (
		ID		INT NOT NULL PRIMARY KEY,
		Name	VARCHAR(255)
	);

	CREATE TABLE dimAuthor (
		ID			INT NOT NULL PRIMARY KEY,
		Firstname	VARCHAR(255),
		Lastname	VARCHAR(255),
		Country_ID	INT,
		Country_name VARCHAR(255),
		Gender_ID	INT,
		Gender_Name VARCHAR(255),
		BirthYear	INT,
		DeathYear	INT,
		Style		VARCHAR(350)
	);

	CREATE TABLE dimCategory (
		ID		INT NOT NULL PRIMARY KEY,
		Name	VARCHAR(255) 
	);

	CREATE TABLE dimAge_Range (
		ID			INT NOT NULL PRIMARY KEY,
		Title		VARCHAR(255),
		Description TEXT
	);

	CREATE TABLE dimTranslator (
		ID			INT NOT NULL PRIMARY KEY,
		Firstname	VARCHAR(255),
		Lastname	VARCHAR(255)
	);

	CREATE TABLE dimPublisher (
		ID			INT NOT NULL PRIMARY KEY,
		[Name]		VARCHAR(255),
		Phone		VARCHAR(20), --SCD1
		[Address]	TEXT, 
		City_ID		INT,
		City_name	VARCHAR(255)
	);

	CREATE TABLE dimEditor(
		ID			INT NOT NULL PRIMARY KEY,
		Firstname	VARCHAR(255),
		Lastname	VARCHAR(255)
	);

	CREATE TABLE dimPosition ( 
		Sur_id			INT IDENTITY(1,1) PRIMARY KEY,
		ID				INT,
		Title			VARCHAR(255),
		Salary			BIGINT, --SCD2
		Start_Date		DATETIME DEFAULT '2000-01-01 00:00:00',
		End_Date		DATETIME DEFAULT NULL,
		Current_Flag	BIT DEFAULT 1
	);

	CREATE TABLE dimEmployee (
		Sur_id				INT IDENTITY(1,1) PRIMARY KEY, --Surrogate key
		ID					INT,
		Firstname			VARCHAR(255),
		Lastname			VARCHAR(255),
		NationalCode		VARCHAR(15),
		[Address]			TEXT,
		Phone				VARCHAR(20),
		Hire_Date			DATE,
		Branch_ID			INT,
		Branch_name			VARCHAR(255),
		Pre_Position_ID		INT, --SCD3
		Pre_Position_Title	VARCHAR(255),
		Effective_Date		DATETIME DEFAULT '2000-01-01 00:00:00',
		Cur_Position_ID		INT,
		Cur_Position_Title	VARCHAR(255),
		Institute_ID		INT,
		Institute_Name		VARCHAR(255),
		Gender_ID			INT,
		Gender_Name			VARCHAR(255),
		Employee_No			VARCHAR(25),
		YearOfPassing		INT,
		HighestQualificationID INT,
		HighestQualificationName	VARCHAR(255),
		MaritalStatusDesc	VARCHAR(255)
	);


	CREATE TABLE dimLanguage
	(
		ID INT NOT NULL PRIMARY KEY,
		[Name] VARCHAR(255),
		Abbreviation VARCHAR(25)
	);

	CREATE TABLE dimSuplier
	(
		ID INT NOT NULL PRIMARY KEY,
		[Name] VARCHAR(255),
		Phone VARCHAR(20),
		[Address] VARCHAR(500),
		City_ID INT,
		City_name	VARCHAR(255)
	);

	CREATE TABLE dimBook (
		ID					INT NOT NULL PRIMARY KEY,
		ISBN				VARCHAR(20),
		Title				VARCHAR(255),
		[Description]		TEXT,
		[Year]				INT,
		Publisher_ID		INT,
		Publisher_name		VARCHAR(255),
		Category_ID			INT,
		Category_name		VARCHAR(255),
		Age_Range_ID		INT,
		Age_Range_name		VARCHAR(255),
		Age_Range_Desc		TEXT,
		Translator_ID		INT,
		Translator_fname	VARCHAR(255),
		Translator_lname	VARCHAR(255),
		Editor_ID			INT,
		Editor_fname		VARCHAR(255),
		Editor_lname		VARCHAR(255),
		Language_ID			INT,
		Language_Name		VARCHAR(255),
		Language_Abbreviation	VARCHAR(25),
		RepublicationNo		INT,	--SCD1
		NumOfEditions		INT,	--SCD1
	);


	CREATE TABLE dimType (
		TypeKey INT ,
		Name	VARCHAR(255),
		subTypeKey	INT NOT NULL PRIMARY KEY,
		subType_name VARCHAR(255)
	);

	CREATE TABLE dimResearch (
	ID				INT NOT NULL PRIMARY KEY,
	Title			VARCHAR(255),
	[Description]	VARCHAR(500),
	Cost			BIGINT,
	StartDate		DATETIME,
	[EndDate]		DATETIME,
	DocumentURL		VARCHAR(255),
	Branch_ID		INT,
	Branch_name		VARCHAR(255),
	Category_ID		INT,
	Category_name	VARCHAR(255),
	Research_Type_ID INT,
	Research_Type_name VARCHAR(255),
	Research_State_ID INT,
	Research_State_name	VARCHAR(255),
	Supervisor_ID int,
	Supervisor_firstName VARCHAR(255),
	Supervisor_lastName VARCHAR(255)
);


	--- Begin Cultural Data Mart ---

	CREATE TABLE CulturalDataMart.transactionFactOverResearch (
		ResearchID			INT	NOT NULL,
		ResearchCategoryID	INT	NOT NULL,
		ResearchTypeID		INT	NOT NULL,
		BranchID			INT	NOT NULL,
		DateID				INT	NOT NULL,
		Payment				BIGINT
		--FOREIGN KEY (ResearchID) REFERENCES dimResearch(ID),
		--FOREIGN KEY (ResearchCategoryID) REFERENCES dimResearchCategory(ID),
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (ResearchTypeID) REFERENCES  dimResearchType(ID),
		--FOREIGN KEY (DateID) REFERENCES dimDate(TimeKey),
	);

	CREATE TABLE CulturalDataMart.snapshotFactOverResearch (
		ResearchID					INT	NOT NULL,
		ResearchCategoryID			INT	NOT NULL,
		BranchID					INT	NOT NULL,
		DateID						INT	NOT NULL,
		totalCostPaid				BIGINT,
		maxCostPaidFor1Research		BIGINT
		--FOREIGN KEY (ResearchID) REFERENCES dimResearch(ID),
		--FOREIGN KEY (ResearchCategoryID) REFERENCES dimResearchCategory(ID),
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (DateID) REFERENCES dimDate(TimeKey)
	);


	CREATE TABLE CulturalDataMart.accFactOverResearch (
		ResearchID				INT	NOT NULL,
		BranchID				INT NOT NULL,
		ResearchCategoryID		INT	NOT NULL,
		overallCostPaid			BIGINT,
		remainedBudget			BIGINT,
		estimatedBudget			BIGINT
		--FOREIGN KEY (ResearchID) REFERENCES dimResearch(ID),
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID)
	);

	CREATE TABLE [CulturalDataMart].transactionFactOverEvent (
		EventID				INT	NOT NULL,
		EventCategoryID		INT	NOT NULL,
		BranchID			INT	NOT NULL,
		DateID				INT	NOT NULL,
		[Date]				DATETIME,
		Cost				BIGINT,
		Title				VARCHAR(255),
		[Description]		VARCHAR(550)
		--FOREIGN KEY (EventCategoryID) REFERENCES dimEventCategory(ID),
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (DateID) REFERENCES dimDate(TimeKey)
	);


	CREATE TABLE [CulturalDataMart].snapshotFactOverEvent_Cat (
		EventCategoryID				INT	NOT NULL,
		BranchID					INT	NOT NULL,
		DateID						INT	NOT NULL,
		numOfEvents					INT,
		totalCostPaid				BIGINT,
		maxCostPaidFor1Event		BIGINT,
		--FOREIGN KEY (EventCategoryID) REFERENCES dimEventCategory(ID),
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (DateID) REFERENCES dimDate(TimeKey)
	);


	CREATE TABLE [CulturalDataMart].accFactOverEvent_Cat (
		EventCategoryID		INT NOT NULL,
		BranchID			INT NOT NULL,
		overallNumOfEvents	INT,
		overallCostPaid			BIGINT,
		--FOREIGN KEY (EventCategoryID) REFERENCES dimEventCategory(ID),
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID)
	);
	--- End Cultural Data Mart ---

	--- Begin Financial Data Mart ---
	CREATE TABLE [FinancialDataMart].transactionFactOverFinance (
		DateID		INT NOT NULL,
		BranchID	INT	NOT NULL,
		SubTypeKey		INT NOT NULL,
		Amount		BIGINT,
		LeftBudget	BIGINT,
		NumberOfExpenses	INT,
		NumberOfIncoems		INT,
		MeanExpenses		BIGINT,
		MeanIncome			BIGINT,
		MaxExpense			BIGINT,
		MaxIncome			BIGINT
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (DateID) REFERENCES dimDate(TimeKey),
		--FOREIGN KEY (SubTypeKey) REFERENCES dimSubType(SubTypeKey)
	);

	CREATE TABLE [FinancialDataMart].snapshotFactOverFinance(
		DateID		INT NOT NULL,
		BranchID	INT	NOT NULL,
		SubTypeKey		INT NOT NULL,
		LeftBudget	BIGINT,
		SumExpense	BIGINT,
		SumIncome	BIGINT,
		NumberOfIncomes	INT,
		NumberOfExpenses	INT
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (DateID) REFERENCES dimDate(TimeKey),
		--FOREIGN KEY (SubTypeKey) REFERENCES dimSubType(SubTypeKey)
	);

	CREATE TABLE [FinancialDataMart].accFactOverFinance (
		BranchID	INT	NOT NULL,
		SubTypeKey		INT NOT NULL,
		LeftBudget	BIGINT,
		SumExpense	BIGINT,
		SumIncome	BIGINT,
		NumberOfIncomes INT,
		NumberOfExpenses INT
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (SubTypeKey) REFERENCES dimSubType(SubTypeKey)
	);

	CREATE TABLE [FinancialDataMart].transFactOverSalary (
		BranchID INT NOT NULL,
		EmployeeID INT NOT NULL,
		PositionID INT NOT NULL,
		DateID INT NOT NULL,
		Amount BIGINT,
		AvgAmount BIGINT,
		MonthsWorked int
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (EmployeeID) REFERENCES dimEmployee(ID),
		--FOREIGN KEY (PositionID) REFERENCES dimPosition(ID)
		--FOREIGN KEY (DateID) REFERENCES dimDate(TimeKey)
	);
	CREATE TABLE [FinancialDataMart].snapshotFactOverSalary (
		BranchID INT NOT NULL,
		EmployeeID INT NOT NULL,
		PositionID INT NOT NULL,
		DateID INT NOT NULL,
		MaxPaid BIGINT,
		AvgPaid BIGINT,
		MonthsWorked INT,
		TotalPaid BIGINT
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (EmployeeID) REFERENCES dimEmployee(ID),
		--FOREIGN KEY (PositionID) REFERENCES dimPosition(ID)
		--FOREIGN KEY (DateID) REFERENCES dimDate(TimeKey)
	);

	CREATE TABLE [FinancialDataMart].accFactOverSalary (
		BranchID INT NOT NULL,
		EmployeeID INT NOT NULL,
		PositionID INT NOT NULL,
		MaxPaid BIGINT,
		AvgPaid BIGINT,
		MonthsWorked INT,
		TotalPaid BIGINT
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (EmployeeID) REFERENCES dimEmployee(ID),
		--FOREIGN KEY (PositionID) REFERENCES dimPosition(ID)
	);
	--- End Financial Data Mart ---

	--- Begin Lendings Data Mart ---
	CREATE TABLE [LendingsDataMart].factless_book_author (
		BookID		INT NOT NULL,
		AuthorID	INT NOT NULL
		--FOREIGN KEY (BookID) REFERENCES dimBook(ID),
		--FOREIGN KEY (AuthorID) REFERENCES dimAuthor(ID)
	);

	CREATE TABLE [LendingsDataMart].transactionFactOverBorrowedBooks (
		BookID		INT NOT NULL,
		BranchID	INT NOT NULL,
		MemberID	INT NOT NULL,
		EmployeeID	INT NOT NULL,
		DateID		INT NOT NULL,
		TimeKey		TIME NOT NULL,
		CategoryID  INT NOT NULL,
		AgeRangeID	INT	NOT NULL,
		EditorID	INT NOT NULL,
		LanguageID	INT	NOT NULL,
		--TypeOfTransactID INT NOT NULL,
		TotalLendedCount	INT,
		BookedCount	INT,
		AvailableCount INT,
		--FOREIGN KEY (BookID) REFERENCES dimBook(ID),
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (EmployeeID) REFERENCES dimEmployee(Sur_id),
		--FOREIGN KEY (MemberID) REFERENCES dimMember(ID),
		--FOREIGN KEY (DateID) REFERENCES dimDate(TimeKey)
		--FOREIGN KEY (CategoryID) REFERENCES dimCategory(ID),
		--FOREIGN KEY (AuthorID) REFERENCES dimAuthor(ID),
		--FOREIGN KEY (AgeRangeID) REFERENCES dimAge_Range(ID),
		--FOREIGN KEY (EditorID) REFERENCES dimEditor(ID),
		--FOREIGN KEY (LanguageID) REFERENCES dimLanguage(ID),

	);

	CREATE TABLE [LendingsDataMart].snapshotFactOverBorrowedBooks (
		BookID		INT NOT NULL,
		BranchID	INT NOT NULL,
		DateID		INT NOT NULL,
		TotalLendedCount	INT,
		TodayLendedCount	INT,
		BookedCount	INT,
		AvailableCount INT
		--FOREIGN KEY (BookID) REFERENCES dimBook(ID),
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
		--FOREIGN KEY (DateID) REFERENCES dimDate(TimeKey)
	);

	CREATE TABLE [LendingsDataMart].accFactOverBorrowedBooks (
		BookID		INT NOT NULL,
		BranchID	INT NOT NULL,
		TotalLendedCount	INT,
		BookedCount	INT,
		AvailableCount INT
		--FOREIGN KEY (BookID) REFERENCES dimBook(ID),
		--FOREIGN KEY (BranchID) REFERENCES dimBranch(ID),
	);
	--- End Lendings Data Mart ---

	Create table [LibraryDW].[LendingsDataMart].[LendingTranFact_MaxDate](
	lastDate datetime
	);
	Create table [LibraryDW].[FinancialDataMart].[FinancialTranFact_MaxDate](
	lastDate datetime
	);

END