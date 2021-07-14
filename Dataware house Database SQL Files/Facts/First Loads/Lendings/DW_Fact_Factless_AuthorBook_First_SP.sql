-----------------###### DW Factless Fact AuthorBook First SP ######---------------
USE LibraryDW
GO
CREATE OR ALTER PROCEDURE DW_Fact_Factless_AuthorBook_First_SP
AS
BEGIN
 
 create table [LibraryDW].[dbo].factlessTmp (
 BookID int,
 AuthorID int
 );

 truncate table [LibraryDW].[LendingsDataMart].[factless_book_author];

 insert into [LibraryDW].[dbo].[factlessTmp] (BookID,AuthorID)
 select db.ID,da.ID
 from LibrarySA.dbo.Author_Book as ab 
	  inner join [LibraryDW].[dbo].[dimBook] as db on ab.Book_ID=db.ID
	  inner join [LibraryDW].[dbo].dimAuthor as da on ab.Author_ID=da.ID
 
 
 insert into [LibraryDW].[LendingsDataMart].[factless_book_author] (BookID,AuthorID)
 select BookID,AuthorID
 from [LibraryDW].[dbo].[factlessTmp] 

 drop table [LibraryDW].[dbo].[factlessTmp]
END

--exec DW_Fact_Factless_AuthorBook_First_SP

--select COUNT(*) from LibraryOP.dbo.Author_Book 
--select COUNT(*) from [LibraryDW].[LendingsDataMart].[factless_book_author]

