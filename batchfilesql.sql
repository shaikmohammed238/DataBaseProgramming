/*-------------excute quries using batch file-------------------------
How to execute SQL scripts using batch file?
*A batch file is a basically a text to file with .bat file extension
*It consists of sequence of commands for computer operating system
*You can open any application, call any exe ,execute list of sql scripts
*batch file is one type of shortcut of open  any application,exe,like here sql queries

---steps of create batch file to execute sql query--
1) write one query in sql like create table 
2)save that connection where you write sql query but dont execute the query why means we use batch file for execute 
3)go that location where u saved sql connection ,create new text file 
4)write @echo off ---for print any msg
5)write @echo executing my tsql table creation ----------this msg
6)SQLCMD -s servername -d databse -e window authentication -i "sql query path"   ---WHERE SERVERVER NAME -S= YOUR DATABASE SERVER NAME,-D=DATABASE NAME,-E=WINDOW AUTHENTICATION OR U = YOU HAVE USERID=YOURID P=PASSWORD OF YOUR SERVER,I= INPUT MEANS GIVE LOCATION OF SQL QUERY
7)pause																					
8)save textdocument in bat extension
9)open that batch file
10) check table is created or not */
CREATE TABLE Batchtable (Id INT IDENTITY,[NAME] VARCHAR(90));