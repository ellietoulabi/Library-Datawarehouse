-----------------###### DW Dated Execution ######---------------
USE LibraryDW
go

-- IF first time, uncomment and run the lines below
--EXEC DW_Tables_SP
go
EXEC DW_ETL_Dated_First_SP @cdate='2009-05-01', @fdate='2009-05-01', @ldate='2009-03-26'
go

-- For Second Time
EXEC DW_ETL_Second_SP
go





