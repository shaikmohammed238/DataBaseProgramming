@echo off
@echo my first bacthfile is executed
SQLCMD -S (localdb)\MSSQLLocalDB -d HiringMicroServices -E -i "D:\cfp all\CFP(projects)\databaseprogramming\batchfilesql.sql"
PAUSE