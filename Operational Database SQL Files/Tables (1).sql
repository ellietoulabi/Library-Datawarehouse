--for test
--use master;
--drop database LibraryOP;
--create database LibraryOP;
--use LibraryOP;
---------


create table Gender
(
	ID int,
	Name varchar(200)
);
create table Institute
(
	ID int,
	Name varchar(200)
);
create table Qualification
(
	ID int,
	Name varchar(200)
);

create table Research_Type
(
	ID int,
	Name varchar(200)
);
create table Research_State
(
	ID int,
	Name varchar(200)
);
create table Country
(
	ID int,
	Name varchar(200)
);
create table PhysicalType
(
	ID int,
	[Name] varchar(200)
);
create table BookSize
(
	ID int,
	[Name] varchar(200)
);
create table Author
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
create table Category
(
	ID int,
	Name varchar(200) 
);
create table Age_Range
(
	ID int,
	Title varchar(200),
	Description varchar(500)
);
create table Translator
(
	ID int,
	Firstname varchar(200),
	Lastname varchar(200)
);
create table [Language]
(
	ID int,
	[Name] varchar(200),
	abbreviation varchar(20)
);
create table Province
(
	ID int,
	[Name] varchar(200)
);
create table City
(
	ID int,
	[Name] varchar(200),
	Province_ID int
);
create table Suplier
(
	ID int,
	[Name] varchar(200),
	Phone varchar(20),
	[Address] varchar(500),
	City_ID int
);
create table Publisher
(
	ID int,
	[Name] varchar(200),
	Phone varchar(20),
	[Address] varchar(500), 
	City_ID int
);
create table Editor
(
	ID int,
	Firstname varchar(200),
	Lastname varchar(200)
);
create table Branch
(
	ID int,
	[Name] varchar(200),
	[Address] varchar(500),
	BranchCode int,
	Phone varchar(20),
	City_ID int
);
create table Budget---------------
(
	ID int,
	Amount bigint,
	[Date] datetime,
	Branch_ID int
);
create table Event_Category
(
	ID int,
	[Name] varchar(200) 
);
create table Research_Category
(
	ID int,
	[Name] varchar(200) 
);
create table [Event]
(
	ID int,
	Title varchar(200),
	[Description] varchar(500),
	Cost bigint,
	[Date] datetime,
	Branch_ID int,
	Category_ID int
);
create table Research
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

create table Position
(
	ID int,
	Title varchar(200),
	Salary bigint
);
create table Employee
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
create table Salary
(
	ID int,
	Salary bigint,
	[Date] datetime,
	Employee_ID int
);
create table Member
(
	ID int,
	Firstname varchar(200),
	Lastname varchar(200),
	NationalCode varchar(15),
	[Address] varchar(500),
	Phone varchar(20),
	Registration_Date date,
	Branch_ID int,
	Registration_Valid_Date date,
	Gender_ID int,
	HighestQualificationID int,
); 
create table MembershipPay
(
	ID int,
	Member_ID int,
	Amount bigint,
	[Date] datetime
);
create table Research_Member
(
	Member_ID int not null,
	Research_ID int not null
);
create table Book
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
create table Author_Book
(
	Author_ID int not null,
	Book_ID int not null
);
create table Book_Volume
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
create table Borrowed_Books
(
	ID int,
	Borrowing_Date datetime,
	Due_Date datetime,
	Returned_Date datetime,
	Member_ID int,
	Employee_ID int,
	BookV_ID int,
	Modified_Date datetime
);
create table Fine_Paid
(
	ID int,
	Payment bigint,
	[date] datetime,
	Borrowed_ID int
);
create table BuyHeader
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
create table BuyDetail
(
	ID int,
	Header_ID int,
	ISBN varchar(100),
	Cost bigint,
	Number int
)

alter table Gender drop column ID;
alter table Gender add ID int primary key identity(1,1); 

alter table Institute drop column ID;
alter table Institute add ID int primary key identity(1,1); 

alter table Qualification drop column ID;
alter table Qualification add ID int primary key identity(1,1); 

alter table Research_Type drop column ID;
alter table Research_Type add ID int primary key identity(1,1); 

alter table Research_State drop column ID;
alter table Research_State add ID int primary key identity(1,1); 

alter table Country drop column ID;
alter table Country add ID int primary key identity(1,1); 

alter table PhysicalType drop column ID;
alter table PhysicalType add ID int primary key identity(1,1); 

alter table BookSize drop column ID;
alter table BookSize add ID int primary key identity(1,1);

alter table Author drop column ID;
alter table Author add ID int primary key identity(1,1);
alter table Author add foreign key (Country_ID) references Country(ID);
alter table Author add foreign key (Gender_ID) references Gender(ID);

alter table Category drop column ID;
alter table Category add ID int primary key identity(1,1); 

alter table Age_Range drop column ID;
alter table Age_Range add ID int primary key identity(1,1); 

alter table Translator drop column ID;
alter table Translator add ID int primary key identity(1,1); 

alter table [Language] drop column ID;
alter table [Language] add ID int primary key identity(1,1);

alter table Province drop column ID;
alter table Province add ID int primary key identity(1,1); 

alter table City drop column ID;
alter table City add ID int primary key identity(1,1);
alter table City add foreign key (Province_ID) references Province(ID);

alter table Suplier drop column ID;
alter table Suplier add ID int primary key identity(1,1);
alter table Suplier add foreign key (City_ID) references City(ID);

alter table Publisher drop column ID;
alter table Publisher add ID int primary key identity(1,1);
alter table Publisher add foreign key (City_ID) references City(ID);

alter table Editor drop column ID;
alter table Editor add ID int primary key identity(1,1); 

alter table Branch drop column ID;
alter table Branch add ID int primary key identity(1,1);
alter table Branch add foreign key (City_ID) references City(ID);
ALTER TABLE Branch ADD UNIQUE (BranchCode);

alter table Budget drop column ID;
alter table Budget add ID int primary key identity(1,1);
alter table Budget add foreign key (Branch_ID) references Branch(ID);

alter table Event_Category drop column ID;
alter table Event_Category add ID int primary key identity(1,1); 

alter table Research_Category drop column ID;
alter table Research_Category add ID int primary key identity(1,1); 

alter table [Event] drop column ID;
alter table [Event] add ID int primary key identity(1,1);
alter table [Event] add foreign key (Branch_ID) references Branch(ID);
alter table [Event] add foreign key (Category_ID) references Event_Category(ID);


alter table Position drop column ID;
alter table Position add ID int primary key identity(1,1); 

alter table Employee drop column ID
alter table Employee add ID int primary key identity(1,1);
alter table Employee add foreign key (Branch_ID) references Branch(ID);
alter table Employee add foreign key (Position_ID) references Position(ID);
alter table Employee add foreign key (Institute_ID) references Institute(ID);
alter table Employee add foreign key (HighestQualificationID) references Qualification(ID);
alter table Employee add foreign key (Gender_ID) references Gender(ID);
ALTER TABLE Employee ADD UNIQUE (NationalCode);


alter table Research drop column ID;
alter table Research add ID int primary key identity(1,1);
alter table Research add foreign key (Branch_ID) references Branch(ID);
alter table Research add foreign key (Category_ID) references Research_Category(ID);
alter table Research add foreign key (Research_Type_ID) references Research_Type(ID);
alter table Research add foreign key (Research_State_ID) references Research_State(ID);
alter table Research add foreign key (Supervisor_ID) references Employee(ID);



alter table Research_Payments drop column ID;
alter table Research_Payments add ID int primary key identity(1,1);
alter table Research_Payments add foreign key (Research_ID) references Research(ID);


alter table Salary drop column ID;
alter table Salary add ID int primary key identity(1,1);
alter table Salary add foreign key (Employee_ID) references Employee(ID);

alter table Member drop column ID;
alter table Member add ID int primary key identity(1,1);
alter table Member add foreign key (Branch_ID) references Branch(ID);
alter table Member add foreign key (Gender_ID) references Gender(ID);
alter table Member add foreign key (HighestQualificationID) references Qualification(ID);
ALTER TABLE Member ADD UNIQUE (NationalCode);

alter table MembershipPay drop column ID;
alter table MembershipPay add ID int primary key identity(1,1);
alter table MembershipPay add foreign key (Member_ID) references Member(ID);


alter table Research_Member add primary key (Member_ID,Research_ID);
alter table Research_Member add foreign key (Member_ID) references Member(ID);
alter table Research_Member add foreign key (Research_ID) references Research(ID);

alter table Book drop column ID;
alter table Book add ID int primary key identity(1,1);
alter table Book add foreign key (Category_ID) references Category(ID);
alter table Book add foreign key (Publisher_ID) references Publisher(ID);
alter table Book add foreign key (Editor_ID) references Editor(ID);
alter table Book add foreign key (Translator_ID) references Translator(ID);	
alter table Book add foreign key (Age_Range_ID) references Age_Range(ID);
alter table Book add foreign key (Language_ID) references [Language](ID);
ALTER TABLE Book ADD UNIQUE (ISBN);


alter table Author_Book add primary key (Author_ID,Book_ID);
alter table Author_Book add foreign key (Author_ID) references Author(ID);
alter table Author_Book add foreign key (Book_ID) references Book(ID);


alter table Book_Volume drop column ID;
alter table Book_Volume add ID int primary key identity(1,1);
alter table Book_Volume add foreign key (Book_ID) references Book(ID);
alter table Book_Volume add foreign key (Branch_ID) references Branch(ID);
alter table Book_Volume add foreign key (PhysicalType_ID) references PhysicalType(ID);
alter table Book_Volume add foreign key (BookSize_ID) references BookSize(ID);

alter table Borrowed_Books drop column ID;
alter table Borrowed_Books add ID int primary key identity(1,1);
alter table Borrowed_Books add foreign key (Member_ID) references Member(ID);
alter table Borrowed_Books add foreign key (Employee_ID) references Employee(ID);
alter table Borrowed_Books add foreign key (BookV_ID) references Book_Volume(ID);

alter table Fine_Paid drop column ID;
alter table Fine_Paid add ID int primary key identity(1,1);
alter table Fine_Paid add foreign key (Borrowed_ID) references Borrowed_Books(ID);

alter table BuyHeader drop column ID;--------------------------------------------------------------------
alter table BuyHeader add ID int primary key identity(1,1);
alter table BuyHeader add foreign key (Branch_ID) references Branch(ID);
alter table BuyHeader add foreign key (Employee_ID) references Employee(ID);
alter table BuyHeader add foreign key (Suplier_ID) references Suplier(ID);

alter table BuyDetail drop column ID;---------------------------------------------------------------------------
alter table BuyDetail add ID int primary key identity(1,1);
alter table BuyDetail add foreign key (Header_ID) references BuyHeader(ID);