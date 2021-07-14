-----------------###### DW DimAuthorFirst SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimAuthor_First_SP
AS
BEGIN
	TRUNCATE TABLE LibraryDW.dbo.dimAuthor 		
	INSERT INTO LibraryDW.dbo.dimAuthor			(ID,
												Firstname,
												Lastname,
												Country_ID,
												Country_name,
												Gender_ID,
												Gender_Name,
												BirthYear,
												DeathYear,
												Style)
	SELECT  SL.ID,
			Firstname,
			Lastname,
			Country_ID,
			SC.Name AS Country_name,
			Gender_ID,
			SG.Name AS Gender_Name,
			BirthYear,
			DeathYear,
			Style
	FROM LibrarySA.dbo.Author AS SL
	INNER JOIN LibrarySA.dbo.Gender AS SG ON SL.Gender_ID=SG.ID
	INNER JOIN LibrarySA.dbo.Country AS SC ON SC.ID=SL.Country_ID
END
GO

--EXEC DW_DimAuthor_First_SP

