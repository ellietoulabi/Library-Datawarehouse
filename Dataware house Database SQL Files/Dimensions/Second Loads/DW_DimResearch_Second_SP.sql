﻿-----------------###### DW DimResearch Second SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimResearch_Second_SP
AS
BEGIN
	IF OBJECT_ID('LibraryDW.dbo.tmpDimResearch') IS NOT NULL
	BEGIN
		DROP TABLE  LibraryDW.dbo.tmpDimResearch
	END
	CREATE TABLE  LibraryDW.dbo.tmpDimResearch (
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

	TRUNCATE TABLE  LibraryDW.dbo.tmpDimResearch
	INSERT INTO  LibraryDW.dbo.tmpDimResearch(
										ID,
										Title,
										[Description],
										Cost,
										StartDate,
										[EndDate],
										DocumentURL,
										Branch_ID,
										Branch_name,
										Category_ID,
										Category_name,
										Research_Type_ID,
										Research_Type_name,
										Research_State_ID,
										Research_State_name,
										Supervisor_ID,
										Supervisor_firstName,
										Supervisor_lastName)
	SELECT								ID,
										Title,
										[Description],
										Cost,
										StartDate,
										[EndDate],
										DocumentURL,
										Branch_ID,
										Branch_name,
										Category_ID,
										Category_name,
										Research_Type_ID,
										Research_Type_name,
										Research_State_ID,
										Research_State_name,
										Supervisor_ID,
										Supervisor_firstName,
										Supervisor_lastName
	FROM  LibraryDW.dbo.[dimResearch]

	TRUNCATE TABLE LibraryDW.dbo.dimResearch

	INSERT INTO LibraryDW.dbo.dimResearch(
										ID,
										Title,
										[Description],
										Cost,
										StartDate,
										[EndDate],
										DocumentURL,
										Branch_ID,
										Branch_name,
										Category_ID,
										Category_name,
										Research_Type_ID,
										Research_Type_name,
										Research_State_ID,
										Research_State_name,
										Supervisor_ID,
										Supervisor_firstName,
										Supervisor_lastName)
								SELECT  ISNULL(S.ID,D.ID),
										ISNULL(S.Title,D.Title),
										ISNULL(S.Description,D.Description),
										ISNULL(S.Cost,D.Cost),
										ISNULL(S.StartDate,D.StartDate),
										ISNULL(S.[EndDate],D.[EndDate]),
										ISNULL(S.DocumentURL,D.DocumentURL),
										ISNULL(S.Branch_ID,D.Branch_ID),
										ISNULL(RB.name,D.Branch_name),
										ISNULL(S.Category_ID,D.Category_ID),
										ISNULL(RC.name,D.Category_name),
										ISNULL(S.Research_Type_ID,D.Research_Type_ID),
										ISNULL(RT.name,D.Research_Type_name),
										ISNULL(S.Research_State_ID,D.Research_State_ID),
										ISNULL(RS.Name,D.Research_State_name),
										ISNULL(S.Supervisor_ID,D.Supervisor_ID),
										ISNULL(E.firstName,D.Supervisor_firstName),
										ISNULL(E.lastName,D.Supervisor_lastName)
								FROM        [LibrarySA].[dbo].[Research] AS S FULL OUTER JOIN LibraryDW.dbo.tmpDimResearch AS D ON S.ID=D.ID
								inner join  [LibraryDW].[dbo].[dimResearchCategory] as RC on S.Category_ID=Rc.ID
								inner join  [LibrarySA].[dbo].[Research_State] as RS on S.Research_State_ID=RS.ID------------------
								inner join  [LibraryDW].[dbo].[dimBranch] as RB on S.Branch_ID=RB.ID
								inner join  [LibraryDW].[dbo].[dimResearchType] as RT on S.Research_Type_ID = RT.ID
								inner join  [LibraryDW].[dbo].[dimEmployee] as E on S.Supervisor_ID=E.ID
	DROP TABLE [LibraryDW].[dbo].tmpDimResearch
END
go

