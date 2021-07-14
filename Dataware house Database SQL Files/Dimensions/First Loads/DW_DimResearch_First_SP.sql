﻿-----------------###### DW DimResearch First SP ######---------------
USE LibraryDW
Go
CREATE OR ALTER PROCEDURE DW_DimResearch_First_SP
AS
BEGIN
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
										Supervisor_lastName )
								SELECT	R.ID,
										R.Title,
										R.[Description],
										R.Cost,
										R.StartDate,
										R.[EndDate],
										R.DocumentURL,
										R.Branch_ID,
										B.name,
										R.Category_ID,
										RC.name,
										R.Research_Type_ID,
										RT.Name,
										R.Research_State_ID,
										RS.name,
										R.Supervisor_ID,
										E.Firstname,
										E.Lastname
								FROM	   LibrarySA.dbo.Research as R 
								inner join LibrarySA.dbo.Research_Category as RC on R.Category_ID=RC.ID
								inner join LibrarySA.dbo.Branch as B on R.Branch_ID = B.ID
								inner join LibrarySA.dbo.Research_Type as RT on R.Research_Type_ID=RT.ID
								inner join LibrarySA.dbo.Research_State as RS on R.Research_State_ID = RS.ID
								inner join LibrarySA.dbo.Employee as E on R.Supervisor_ID=E.ID
END


