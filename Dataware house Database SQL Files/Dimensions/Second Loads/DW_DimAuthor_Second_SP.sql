-----------------###### DW DimAuthorSecond SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimAuthor_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimAuthor') IS NOT NULL
	BEGIN
		DROP TABLE tmpDimAuthor
	END
	IF OBJECT_ID('LibraryDW.dbo.tmpSAauthor') IS NOT NULL
	BEGIN
		DROP TABLE tmpSAauthor
	END
	CREATE TABLE tmpDimAuthor (
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
	TRUNCATE TABLE tmpDimAuthor
	INSERT INTO tmpDimAuthor
	SELECT  ID,
			Firstname,
			Lastname,
			Country_ID,
			Country_name,
			Gender_ID,
			Gender_Name,
			BirthYear,
			DeathYear,
			Style
	FROM dimAuthor
	TRUNCATE TABLE LibraryDW.dbo.dimAuthor


	CREATE TABLE tmpSAauthor (
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
	
	TRUNCATE TABLE LibraryDW.dbo.tmpSAauthor

	INSERT INTO tmpSAauthor
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

	INSERT INTO LibraryDW.dbo.dimAuthor
	SELECT ISNULL(S.ID,D.ID),
		ISNULL(S.Firstname,D.Firstname),
		ISNULL(S.Lastname,D.Lastname),
		ISNULL(S.Country_ID,D.Country_ID),
		ISNULL(S.Country_name,D.Country_name),
		ISNULL(S.Gender_ID,D.Gender_ID),
		ISNULL(S.Gender_Name,D.Gender_Name),
		ISNULL(S.BirthYear,D.BirthYear),
		ISNULL(S.DeathYear,D.DeathYear),
		ISNULL(S.Style,D.Style)
	FROM tmpSAauthor AS S FULL OUTER JOIN tmpDimAuthor AS D ON S.ID=D.ID
	DROP TABLE tmpDimAuthor
	DROP TABLE tmpSAauthor
END
go
 
--EXEC DW_DimAuthor_Second_SP


