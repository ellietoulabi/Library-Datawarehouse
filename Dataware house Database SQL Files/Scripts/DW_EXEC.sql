-----------------###### DW Execution ######---------------
USE LibraryDW
go

-- IF first time, uncomment and run the lines below
EXEC DW_Tables_SP
go
EXEC DW_ETL_First_SP
go

-- For Second Time
EXEC DW_ETL_Second_SP
go





