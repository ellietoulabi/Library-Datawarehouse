-----------------###### SA Load Procedure ######---------------
USE LibrarySA
go
CREATE OR ALTER PROCEDURE SA_Load_SP
as
begin

	--------------Start Gender--------------
	truncate table [LibrarySA].[dbo].[Gender]

	insert into [LibrarySA].[dbo].[Gender] (ID,Name)
	select G.ID,G.Name
	from [LibraryOP].[dbo].[Gender] as G
	--------------End Gender----------------
	

	--------------start Age_Range--------------
	truncate table [LibrarySA].[dbo].[Age_Range]
	INSERT INTO [LibrarySA].[dbo].[Age_Range]
			   ([ID]
			   ,[Title]
			   ,[Description])
		 select ID,Title,Description
		 from [LibraryOP].[dbo].[Age_Range]
	--------------end Age_Range--------------


	--------------start Language--------------
	truncate table [LibrarySA].[dbo].[Language]

	INSERT INTO [LibrarySA].[dbo].[Language]
			   ([ID]
			   ,[Name]
			   ,[Abbreviation])
		 select ID,Name,Abbreviation
		 from [LibraryOP].[dbo].[Language]
	--------------end Language--------------


	--------------start PhysicalType--------------
	truncate table [LibrarySA].[dbo].[PhysicalType]

	INSERT INTO [LibrarySA].[dbo].[PhysicalType]
			   ([ID]
			   ,[Name])
		 select ID,Name
		 from [LibraryOP].[dbo].[PhysicalType]
	--------------end PhysicalType--------------


	--------------start Institute-----------
	truncate table [LibrarySA].[dbo].[Institute]

	insert into [LibrarySA].[dbo].[Institute] (ID,Name)
	select G.ID,G.Name
	from [LibraryOP].[dbo].[Institute] as G
	--------------end Institute--------------


	--------------start Qualification--------
	truncate table [LibrarySA].[dbo].[Qualification]

	insert into [LibrarySA].[dbo].[Qualification] (ID,Name)
	select G.ID,G.Name
	from [LibraryOP].[dbo].[Qualification] as G
	--------------end Qualification----------


	--------------start Position-------------
	truncate table [LibrarySA].[dbo].[Position]

	insert into [LibrarySA].[dbo].[Position] (ID,Title,Salary)
	select G.ID,G.Title,G.Salary
	from [LibraryOP].[dbo].[Position] as G
	--------------end Position---------------


	--------------Begin Branch---------------
	TRUNCATE TABLE [LibrarySA].[dbo].[Branch]
	INSERT INTO [LibrarySA].[dbo].[Branch]
			   ([BranchCode]
			   ,[Name]
			   ,[Address]
			   ,[ID]
			   ,[Phone]
			   ,[City_ID])
		 SELECT DISTINCT  ob.[BranchCode]
			   ,ob.[Name]
			   ,ob.[Address]
			   ,ob.[ID]
			   ,ob.[Phone]
			   ,ob.[City_ID]
		 FROM   [LibraryOP].[dbo].[Branch] as ob
	--------------End Branch--------------


	--------------Begin City--------------
	TRUNCATE TABLE [LibrarySA].[dbo].[City]
	INSERT INTO [LibrarySA].[dbo].[City]
			   ([ID]
			   ,[Name]
			   ,[Province_ID])
		 SELECT DISTINCT c.[ID]
			   ,c.[Name]
			   ,c.[Province_ID]
		 FROM   [LibraryOP].[dbo].[City] as c 
	--------------End City----------------
	

	--------------Begin Province-----------
	TRUNCATE TABLE [LibrarySA].[dbo].[Province]
	INSERT INTO [LibrarySA].[dbo].[Province]
			   ([ID]
			   ,[Name])
		 SELECT DISTINCT [ID]
			   ,[Name]
		 FROM   [LibraryOP].[dbo].[Province]
	--------------End Province--------------


	--------------Begin Research_Member-----
	TRUNCATE TABLE [LibrarySA].[dbo].[Research_Member]
	INSERT INTO [LibrarySA].[dbo].[Research_Member]
				([Research_ID]
				,[Member_ID])
			SELECT [Research_ID]
				,[Member_ID]
			FROM [LibraryOP].[dbo].[Research_Member] 
	--------------End Research_Member------


	--------------Begin Research_Category---
	TRUNCATE TABLE [LibrarySA].[dbo].[Research_Category]
	INSERT INTO [LibrarySA].[dbo].[Research_Category]([ID],[Name])
	SELECT [ID],[Name] 
	FROM [LibraryOP].[dbo].[Research_Category] 
	--------------End Research_Category----


	--------------Begin Research_Category ----
	TRUNCATE TABLE [LibrarySA].[dbo].[Research_State]
	INSERT INTO [LibrarySA].[dbo].[Research_State]([ID],[Name])
	SELECT [ID],[Name] 
	FROM [LibraryOP].[dbo].[Research_State] 
	--------------End Research_Category ----


	--------------Begin Research_Type ----
	TRUNCATE TABLE [LibrarySA].[dbo].[Research_Type]
	INSERT INTO [LibrarySA].[dbo].[Research_Type]([ID],[Name])
	SELECT [ID],[Name] 
	FROM [LibraryOP].[dbo].[Research_Type]  
	--------------End Research_Type ----


	--------------Start MaritalHelper ----
	TRUNCATE TABLE [LibrarySA].[dbo].[MaritalHelper]
	INSERT INTO [LibrarySA].[dbo].[MaritalHelper]
	VALUES (0, 'Single'),(1, 'Married')
	--------------End MaritalHelper ----
	

	--------------Start Member--------------
	declare @StartDate date
	declare @EndDate date
	declare @CurrDate date

	truncate table [LibrarySA].[dbo].[Member];
	insert into [LibrarySA].[dbo].[Member]
		select opm.ID, opm.Firstname,opm.Lastname,opm.NationalCode,opm.[Address],opm.Phone,opm.Registration_Date,
		opb.BranchCode,opb.ID,opb.[Name],opm.Registration_Valid_Date, opm.Gender_ID,g.[Name],
		q.ID,q.[Name]
		from [LibraryOP].[dbo].[Member] as opm 
		join [LibraryOP].[dbo].[Branch] as opb on opm.Branch_ID=opb.ID
		join [LibraryOP].[dbo].[Gender] as g on opm.Gender_ID=g.ID
		join [LibraryOP].[dbo].[Qualification] as q on opm.HighestQualificationID=q.ID	

	--set @StartDate = ISNULL( 
	--						(select DATEADD(DAY,1,max(Registration_Date)) from [LibrarySA].[dbo].[Member]),
	--						(select min(Registration_Date) from [LibraryOP].[dbo].[Member]) 
	--				 )
	--set @EndDate = (select max(Registration_Date) from [LibraryOP].[dbo].[Member] )
	--set @CurrDate = @StartDate

	--while @CurrDate <= @EndDate
	--begin
	--	insert into [LibrarySA].[dbo].[Member]
	--	select opm.ID, opm.Firstname,opm.Lastname,opm.NationalCode,opm.[Address],opm.Phone,opm.Registration_Date,
	--	opb.BranchCode,opb.ID,opb.[Name],opm.Registration_Valid_Date, opm.Gender_ID,g.[Name],
	--	q.ID,q.[Name]
	--	from [LibraryOP].[dbo].[Member] as opm 
	--	join [LibraryOP].[dbo].[Branch] as opb on opm.Branch_ID=opb.ID
	--	join [LibraryOP].[dbo].[Gender] as g on opm.Gender_ID=g.ID
	--	join [LibraryOP].[dbo].[Qualification] as q on opm.HighestQualificationID=q.ID	
	--	where opm.Registration_Date >= @CurrDate and opm.Registration_Date < DATEADD(DAY,1,@CurrDate)

	--	set @CurrDate = DATEADD(DAY,1,@CurrDate)
	--end
	--------------End Member--------------


	--------------Start Research--------------
	SET @startdate = (select min(StartDate) from [LibraryOP].[dbo].[Research] );
	SET @enddate = (SELECT MAX(StartDate) FROM [LibraryOP].[dbo].[Research]);
	truncate table  [LibrarySA].[dbo].[Research];
	WHILE @startdate <= @enddate
	BEGIN
		INSERT INTO [LibrarySA].[dbo].[Research]
				   ([ID]
				   ,[Title]
				   ,[Description]
				   ,[Cost]
				   ,[StartDate]
				   ,[EndDate]
				   ,[DocumentURL]
				   ,[Branch_ID]
				   ,[Category_ID]
				   ,[Research_Type_ID]
				   ,[Research_State_ID]
				   ,[Supervisor_ID])
				SELECT
					opr.[ID]
				   ,opr.[Title]
				   ,opr.[Description]
				   ,opr.[Cost]
				   ,opr.[StartDate]
				   ,opr.[EndDate]
				   ,opr.[DocumentURL]
				   ,opr.[Branch_ID]
				   ,opr.[Category_ID]
				   ,opr.[Research_Type_ID]
				   ,opr.[Research_State_ID]
				   ,opr.[Supervisor_ID]
			 FROM [LibraryOP].[dbo].[Research]  AS opr
			 WHERE opr.StartDate>=@startdate and opr.StartDate < DATEADD(day,1,@startdate)
		SET @startdate = DATEADD(day,1,@startdate);
	END
	--------------end Research--------------


	--------------Start Research Payment----
	SET @startdate = (SELECT ISNULL(MAX(PayDate),(select min(PayDate) from [LibraryOP].[dbo].[Research_Payments] )) FROM [LibrarySA].[dbo].[Research_Payments]);
	SET @enddate = (SELECT MAX(PayDate) FROM [LibraryOP].[dbo].[Research_Payments]);
	WHILE @startdate <= @enddate
	BEGIN
		INSERT INTO [LibrarySA].[dbo].[Research_Payments]
			   ([ID]
			   ,[Research_ID]
			   ,[Payment]
			   ,[PayDate])
		 select rp.[ID]
			   ,rp.[Research_ID]
			   ,rp.[Payment]
			   ,rp.[PayDate]
		 from [LibraryOP].[dbo].[Research_Payments] as rp
	     WHERE rp.PayDate>=@startdate and rp.PayDate < DATEADD(day,1,@startdate)
		SET @startdate = DATEADD(day,1,@startdate);
	END
	--------------end Research Payment----


	--------------start Employee----
	truncate table [LibrarySA].[dbo].[Employee]
	INSERT INTO [LibrarySA].[dbo].[Employee]
			   ([ID]
			   ,[Firstname]
			   ,[Lastname]
			   ,[NationalCode]
			   ,[Address]
			   ,[Phone]
			   ,[Hire_Date]
			   ,[Branch_ID]
			   ,[Position_ID]
			   ,[Institute_ID]
			   ,[Gender_ID]
			   ,[Employee_No]
			   ,[YearOfPassing]
			   ,[HighestQualificationID]
			   ,[MaritalStatus])
			SELECT E.ID
				  ,E.Firstname
				  ,E.Lastname
				  ,E.NationalCode
				  ,E.Address
				  ,E.Phone
				  ,E.Hire_Date
				  ,E.Branch_ID
				  ,E.Position_ID
				  ,E.Institute_ID
				  ,E.Gender_ID
				  ,E.Employee_No
				  ,E.YearOfPassing
				  ,E.HighestQualificationID
				  ,E.MaritalStatus
			FROM [LibraryOP].[dbo].[Employee] as E 
	--------------end Employee--------------


	--------------start translator----------
	truncate table [LibrarySA].[dbo].[Translator]

	INSERT INTO [LibrarySA].[dbo].[Translator]
			   ([ID]
			   ,[Firstname]
			   ,[Lastname])
		select ID,Firstname,Lastname
		from [LibraryOP].[dbo].[Translator]
	--------------end translator-------------


	--------------start editor----------
	truncate table [LibrarySA].[dbo].[Editor]

	INSERT INTO [LibrarySA].[dbo].[Editor]
			   ([ID]
			   ,[Firstname]
			   ,[Lastname])
		select ID,Firstname,Lastname
		from [LibraryOP].[dbo].[Editor]
	--------------end editor-------------


	--------------start publisher----------
	truncate table [LibrarySA].[dbo].[Publisher]

	INSERT INTO [LibrarySA].[dbo].[Publisher]
			   ([ID]
			   ,[Name]
			   ,[Phone]
			   ,[Address]
			   ,[City_ID])
		select ID,Name,Phone,Address,City_ID
		from [LibraryOP].[dbo].[Publisher]
	--------------end publisher-------------


	--------------start author----------
	truncate table [LibrarySA].[dbo].[Author]

	INSERT INTO [LibrarySA].[dbo].[Author]
			   ([ID]
			   ,[Firstname]
			   ,[Lastname]
			   ,[Country_ID]
			   ,[Gender_ID]
			   ,[BirthYear]
			   ,[DeathYear]
			   ,[Style])
		 select [ID]
			   ,[Firstname]
			   ,[Lastname]
			   ,[Country_ID]
			   ,[Gender_ID]
			   ,[BirthYear]
			   ,[DeathYear]
			   ,[Style]
		 from [LibraryOP].[dbo].[Author]
	--------------end author-------------


	--------------start author_book----------
	truncate table [LibrarySA].[dbo].[Author_Book]

	INSERT INTO [LibrarySA].[dbo].[Author_Book]
			   ([Author_ID]
			   ,[Book_ID])
		 select [Author_ID]
			   ,[Book_ID]
		 from [LibraryOP].[dbo].[Author_Book]
	--------------end author-------------


	--------------Start Borrowed_Book----
	--declare @StartDate date
	--declare @EndDate date
	--declare @CurrDate date
	update [LibrarySA].[dbo].[Borrowed_Books]
	set Modified_Date=OB.Modified_Date , Returned_Date = OB.Returned_Date
	FROM  [LibrarySA].[dbo].[Borrowed_Books] as SB inner join [LibraryOP].[dbo].[Borrowed_Books] as OB on SB.ID=OB.ID and OB.Modified_Date>SB.Modified_Date

	SET @startdate = (SELECT ISNULL(MAX(Borrowing_Date),(select min(Borrowing_Date) from [LibraryOP].[dbo].[Borrowed_Books] )) FROM [LibrarySA].[dbo].[Borrowed_Books]);
	SET @enddate = (SELECT MAX(Borrowing_Date) FROM [LibraryOP].[dbo].[Borrowed_Books]);
	WHILE @startdate <= @enddate
	BEGIN

		INSERT INTO [LibrarySA].[dbo].[Borrowed_Books]
				   ([ID]
				   ,[Borrowing_Date]
				   ,[Due_Date]
				   ,[Returned_Date]
				   ,[Member_ID]
				   ,[Employee_ID]
				   ,[BookV_ID]
				   ,[Modified_Date])
			select [ID]
				   ,[Borrowing_Date]
				   ,[Due_Date]
				   ,[Returned_Date]
				   ,[Member_ID]
				   ,[Employee_ID]
				   ,[BookV_ID]
				   ,[Modified_Date]
			from [LibraryOP].[dbo].[Borrowed_Books]
	        WHERE Borrowing_Date>=@startdate and Borrowing_Date < DATEADD(day,1,@startdate)

		SET @startdate = DATEADD(day,1,@startdate);
	END

	--------------end Borrowed_Book----



	-------------start salary----------

	--declare @StartDate date
	--declare @EndDate date
	--declare @CurrDate date
	
	SET @startdate = (SELECT ISNULL(MAX(Date),(select min(Date) from [LibraryOP].[dbo].[Salary] )) FROM [LibrarySA].[dbo].[Salary]);
	SET @enddate = (SELECT MAX(Date) FROM [LibraryOP].[dbo].[Salary]);
	WHILE @startdate <= @enddate
	BEGIN

		INSERT INTO [LibrarySA].[dbo].[Salary]
				   ([ID]
				   ,[Salary]
				   ,[Date]
				   ,[Employee_ID])
			select  [ID]
				   ,[Salary]
				   ,[Date]
				   ,[Employee_ID]
			from [LibraryOP].[dbo].[Salary]
	        WHERE Date>=@startdate and Date < DATEADD(month,1,@startdate)

		SET @startdate = DATEADD(month,1,@startdate);
	END


	------------end  salary------------

	------------start  BookBranch------

	insert into [LibrarySA].[dbo].[BookBranch]
	select distinct bv.Book_ID,bv.Branch_ID
	from [LibraryOP].[dbo].[Book_Volume] as bv join [LibrarySA].[dbo].[Branch] as b
	on bv.Branch_ID=b.ID
	full join [LibrarySA].[dbo].[BookBranch] as bb
	on bb.Book_ID=bv.Book_ID and bb.Branch_ID=bv.Branch_ID
	where bb.Book_ID is null
	------------end  BookBranch--------

	------------start  Book------------
	truncate table [LibrarySA].[dbo].[Book]

	insert into [LibrarySA].[dbo].[Book]
	select [ID], [ISBN]
      ,[Title]
      ,[Description]
      ,[Year]
      ,[Publisher_ID]
      ,[Category_ID]
      ,[Age_Range_ID]
      ,[Translator_ID]
      ,[Editor_ID]
      ,[Language_ID]
      ,[RepublicationNo]
      ,[NumOfPages]
      ,[NumOfEditions]
      ,[NumOfCopiesPrinted]
  FROM [LibraryOP].[dbo].[Book]
	------------end  Book--------------

	------------start  BookSize--------
	truncate table [LibrarySA].[dbo].[BookSize]

	insert into [LibrarySA].[dbo].[BookSize]
	select ID, Name from [LibraryOP].[dbo].[BookSize]
	------------end  BookSize----------


	----------start  Book_Volume-------
	truncate table [LibrarySA].[dbo].[Book_Volume]

	insert into [LibrarySA].[dbo].[Book_Volume]
	select ID,Location,Book_ID,Branch_ID,Price,PhysicalType_ID,
	BookSize_ID,Year,NoCopiesPrinted,EditionNo,RepublicationNo
	from [LibraryOP].[dbo].[Book_Volume]

	------------end  Book_Volume-------

	------------start  Suplier---------
	truncate table [LibrarySA].[dbo].[Suplier]

	insert into [LibrarySA].[dbo].[Suplier] 
	select s.ID,s.Name,s.Phone,s.Address,s.City_ID,c.Name from [LibraryOP].[dbo].[Suplier]
	as s join [LibraryOP].[dbo].[City] as c
	on s.City_ID=c.ID
	------------end  Suplier-----------

	------------start  Category--------
	truncate table [LibrarySA].[dbo].[Category]

	insert into [LibrarySA].[dbo].[Category]
	select ID,Name from [LibraryOP].[dbo].[Category]
	------------end  Category----------

	------------start  BookSize--------
	truncate table [LibrarySA].[dbo].[BookSize]

	insert into [LibrarySA].[dbo].[BookSize]
	select ID,Name from [LibraryOP].[dbo].[BookSize]
	------------end  BookSize----------

	------------start  TypeHelper------
	truncate table [LibrarySA].[dbo].[TypeHelper]

	insert into [LibrarySA].[dbo].[TypeHelper]
	values 
	(null,null,1,'Income'),
	(null,null,2,'Expense'),
	(2,'Expense',3,'Buy'),
	(2,'Expense',4,'Salary'),
	(2,'Expense',5,'Event'),
	(2,'Expense',6,'Research'),
	(1,'Income',7,'Budget'),
	(1,'Income',8,'Fine'),
	(1,'Income',9,'Membership');
	------------end  TypeHelper--------

	------------start  Country---------
	truncate table [LibrarySA].[dbo].[Country]

	insert into [LibrarySA].[dbo].[Country]
	select ID,Name from [LibraryOP].[dbo].[Country]
	------------end  BookSize----------

end
go









