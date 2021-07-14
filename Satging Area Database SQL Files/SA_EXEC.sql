-----------------###### SA Execution ######---------------
CREATE DATABASE LibrarySA
go
USE LibrarySA
go

-- IF first time, uncomment and run the line below
EXEC SA_Tables_SP
go

EXEC SA_Load_SP
go

