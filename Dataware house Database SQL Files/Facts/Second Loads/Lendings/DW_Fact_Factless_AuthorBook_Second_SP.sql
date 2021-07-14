-----------------###### DW Factless Fact AuthorBook Second SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Factless_AuthorBook_Second_SP
AS
BEGIN
 
 create table [LibraryDW].[dbo].factlessTmp (
 BookID int,
 AuthorID int
 );

 create table [LibraryDW].[dbo].newData (
 BookID int,
 AuthorID int
 );


 insert into [LibraryDW].[dbo].newData (BookID,AuthorID)
 select ab.Book_ID,ab.Author_ID 
 from LibrarySA.dbo.Author_Book as ab
 where ab.Book_ID not in (select BookID from [LibraryDW].[LendingsDataMart].[factless_book_author])
 

 insert into [LibraryDW].[dbo].factlessTmp (BookID,AuthorID)
 select db.ID,da.ID
 from [LibraryDW].[dbo].newData as ab 
	  inner join [LibraryDW].[dbo].[dimBook] as db on ab.BookID=db.ID
	  inner join [LibraryDW].[dbo].dimAuthor as da on ab.AuthorID=da.ID
 
 
 insert into [LibraryDW].[LendingsDataMart].[factless_book_author] (BookID,AuthorID)
 select BookID,AuthorID
 from [LibraryDW].[dbo].[factlessTmp] 

 drop table [LibraryDW].[dbo].[factlessTmp]
  drop table [LibraryDW].[dbo].newData

END

