﻿﻿-----------------###### DW DimBook First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimBook_First_SP
AS
	IF OBJECT_ID('LibraryDW.dbo.book_pub') IS NOT NULL
	BEGIN
		DROP TABLE book_pub
	END

	IF OBJECT_ID('LibraryDW.dbo.bp_e') IS NOT NULL
	BEGIN
		DROP TABLE bp_e
	END

	IF OBJECT_ID('LibraryDW.dbo.bpe_t') IS NOT NULL
	BEGIN
		DROP TABLE bpe_t
	END

	IF OBJECT_ID('LibraryDW.dbo.bpet_cat_agerange_lang') IS NOT NULL
	BEGIN
		DROP TABLE bpet_cat_agerange_lang
	END
	CREATE TABLE book_pub (		
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

	CREATE TABLE bp_e 	(	
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
	CREATE TABLE bpe_t 	(	
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

	CREATE TABLE bpet_cat_agerange_lang 	(	
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

	INSERT INTO book_pub
	SELECT 		B.ID,
				ISBN,
				Title,
				[Description],
				[Year],
				Publisher_ID,
				P.Name AS Publisher_name,
				Category_ID,
				NULL AS Category_name,
				Age_Range_ID,
				NULL AS Age_Range_name,
				NULL AS Age_Range_Desc,
				Translator_ID,
				NULL AS Translator_fname,
				NULL AS Translator_lname,
				Editor_ID,
				NULL AS Editor_fname,
				NULL AS Editor_lname,
				Language_ID,
				NULL AS Language_Name,
				NULL AS Language_Abbreviation,
				RepublicationNo,
				NumOfEditions
	FROM [LibrarySA].[dbo].[Book] B INNER JOIN [LibrarySA].[dbo].[Publisher] P ON B.Publisher_ID=P.ID
	INSERT INTO bp_e
	SELECT 		B.ID,
				ISBN,
				Title,
				[Description],
				[Year],
				Publisher_ID,
				Publisher_name,
				Category_ID,
				NULL AS Category_name,
				Age_Range_ID,
				NULL AS Age_Range_name,
				NULL AS Age_Range_Desc,
				Translator_ID,
				NULL AS Translator_fname,
				NULL AS Translator_lname,
				Editor_ID,
				E.Firstname AS Editor_fname,
				E.Lastname AS Editor_lname,
				Language_ID,
				NULL AS Language_Name,
				NULL AS Language_Abbreviation,
				RepublicationNo,
				NumOfEditions
	FROM book_pub B INNER JOIN [LibrarySA].[dbo].[Editor] E ON E.ID=B.Editor_ID
	

	INSERT INTO bpe_t
	SELECT 		B.ID,
				ISBN,
				Title,
				[Description],
				[Year],
				Publisher_ID,
				Publisher_name,
				Category_ID,
				NULL AS Category_name,
				Age_Range_ID,
				NULL AS Age_Range_name,
				NULL AS Age_Range_Desc,
				Translator_ID,
				T.Firstname Translator_fname,
				T.Lastname Translator_lname,
				Editor_ID,
				Editor_fname,
				Editor_lname,
				Language_ID,
				NULL AS Language_Name,
				NULL AS Language_Abbreviation,
				RepublicationNo,
				NumOfEditions
	FROM bp_e B INNER JOIN [LibrarySA].[dbo].[Translator] T ON T.ID=B.Translator_ID
	

	INSERT INTO bpet_cat_agerange_lang
	SELECT 		B.ID,
				ISBN,
				B.Title,
				B.[Description],
				[Year],
				Publisher_ID,
				Publisher_name,
				Category_ID,
				C.Name AS Category_name,
				Age_Range_ID,
				A.Title Age_Range_name,
				A.Description Age_Range_Desc,
				Translator_ID,
				Translator_fname,
				Translator_lname,
				Editor_ID,
				Editor_fname,
				Editor_lname,
				Language_ID,
				L.Name Language_Name,
				L.abbreviation Language_Abbreviation,
				RepublicationNo,
				NumOfEditions
	FROM bpe_t B INNER JOIN [LibrarySA].[dbo].[Category] C ON C.ID=B.Category_ID
				INNER JOIN [LibrarySA].[dbo].[Age_Range] A ON A.ID=B.Age_Range_ID
				INNER JOIN [LibrarySA].[dbo].[Language] L ON L.ID=B.Language_ID

	TRUNCATE TABLE dimBook
	INSERT INTO dimBook
		(ID,
		ISBN,
		Title,
		[Description],
		[Year],
		Publisher_ID,
		Publisher_name,
		Category_ID,
		Category_name,
		Age_Range_ID,
		Age_Range_name,
		Age_Range_Desc,
		Translator_ID,
		Translator_fname,
		Translator_lname,
		Editor_ID,
		Editor_fname,
		Editor_lname,
		Language_ID,
		Language_Name,
		Language_Abbreviation,
		RepublicationNo,
		NumOfEditions)
	SELECT 	
		ID,
		ISBN,
		Title,
		[Description],
		[Year],
		Publisher_ID,
		Publisher_name,
		Category_ID,
		Category_name,
		Age_Range_ID,
		Age_Range_name,
		Age_Range_Desc,
		Translator_ID,
		Translator_fname,
		Translator_lname,
		Editor_ID,
		Editor_fname,
		Editor_lname,
		Language_ID,
		Language_Name,
		Language_Abbreviation,
		RepublicationNo,
		NumOfEditions
	FROM bpet_cat_agerange_lang 
	DROP TABLE book_pub
	DROP TABLE bp_e
	DROP TABLE bpe_t
	DROP TABLE bpet_cat_agerange_lang
GO
--	EXEC DW_DimBook_First_SP
