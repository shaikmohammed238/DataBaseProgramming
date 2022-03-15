/* What is a database cursor
A database cursor is an object that enables traversal over the rows of a result set. It allows you to process individual row returned by a query.

SQL Server cursor life cycle
These are steps for using a cursor:

SQL Server Cursor
First, declare a cursor.

			DECLARE cursor_name CURSOR
				FOR select_statement;

Code language: SQL (Structured Query Language) (sql)
To declare a cursor, you specify its name after the DECLARE keyword with the CURSOR data type and provide a SELECT statement that defines the result set for the cursor.

Next, open and populate the cursor by executing the SELECT statement:

OPEN cursor_name; */

/*-------------------------CURSORS IN SQL SERVER----------------------------
*Cursor is a temporary memory or temporary work station
*asql cursor is a database object that used to retrieve data from aresult set one row at a atime
* cursor purose is use to row by row manner &what a data you write in table that table store in cursor
*if u want to do dml transactions like add,delete,updte, retrive, get , this action doing use of cursors
*if u want use cursor ,first declare cursor and store data set or result set means table after that use dml operations
*sql cursor is used when the data needs to be updated row by row
*its allocated by database server at the time of perfoming DML operations on table by use
* cursors used to store database tables
*it allows you to process individual row returned by query
*they are two of cursors in sql:-1)implicit cursor 2)explicit cursor
*first what is explict and implicit?
implict:- implicit means automatically like systematically,like automatically cars
explicit:- explicit means used defined like user created,like manually stering and gears cars
1)implicit cursor:-
implicit cursor  are also known as default cursors of sql server. ----------default cursors  created sql server
these cursors are allocated by sql server when user performs DML operations
2)explicit cursor:-
explicit cursor are created by users whenever the user requires them.
explicit cursor are used for fecting data from table in row by row manner.
METHODS OF CURSORS;-
next ------------it defines next record where u present 1 record it going to 2 record
prior------------it defines one step backward like u present in 3 record it going to 2 record
first -----------it defines first row or record in your table
last-------------it defines last record in your table
absoulte n-----------it defines where is n =300 row or record positon
Relative n------------it defines where you can pass -5 values or plus +5 means in absoulte n value add that relative value or minus that value
how create a sql cursor life style in steps:-
1) declaring cursor -------> explicit cursor
2)opening cursor
3) fecthing cursor
4) closing cursor
5)de-allocating cursor

1) declaring cursor:-
a cursor is declared by defining the sql statement
2)opening cursor:-
 acursor is opened for storing data retrivred from the result set
3)fecthing cursor:-
when a cursor is opened , rows can be fecthed from the cursor one by one or in a block to do data manipulation
4)closing cursor :-
the cursor should be closed by explicit after dml
5)de-allocating cursor:-
cursors should be deallocated to delete cursor defination and release all the system resources with the cursor
when your work or function is complte using cursor, destroy or delete cursor

we can use cursors in 2 ways:
1) with cursor variables
2)without cursor variables
*/
 SELECT * FROM EmployList;
 ---1) declaring cursor:-
 --a cursor is declared by defining the sql statement
 DECLARE Mycursor CURSOR SCROLL FOR SELECT * FROM EmployList; 
 /* 2)opening cursor:-
 acursor is opened for storing data retrivred from the result set */
 OPEN Mycursor
/*3)fecthing cursor:-
when a cursor is opened , rows can be fecthed from the cursor one by one or in a block to do data manipulation*/

---------------------------------------WITHOUT CURSOR VARIABLE--------------------------------

 FETCH FIRST FROM Mycursor -----------> HEAR USING WITHOUT VARIABLE CURSOR WITH first METHODs
 FETCH NEXT FROM Mycursor-----------> HEAR USING WITHOUT VARIABLE CURSOR WITH NEXT METHOD
  FETCH LAST FROM Mycursor-----------> HEAR USING WITHOUT VARIABLE CURSOR WITH LAST METHOD
 FETCH PRIOR FROM Mycursor-----------> HEAR USING WITHOUT VARIABLE CURSOR WITH PRIOR METHOD
 FETCH ABSOLUTE 5 FROM Mycursor-----------> HEAR USING WITHOUT VARIABLE CURSOR WITH ABSOLUTE METHOD
 FETCH RELATIVE -3 FROM Mycursor-----------> HEAR USING WITHOUT VARIABLE CURSOR WITH RELATIVE METHOD HEAR ABSOLUTE +RELATIVE



/*4)closing cursor :-
the cursor should be closed by explicit after dml
*/
CLOSE Mycursor---------close cursor
/*
5)de-allocating cursor:-
cursors should be deallocated to delete cursor defination and release all the system resources with the cursor
when your work or function is complte using cursor, destroy or delete cursor
*/
DEALLOCATE Mycursor;
---------------------------------WITH CURSOR VARIABLES-----------------------------------
---1) declaring cursor:-
 --a cursor is declared by defining the sql statement
 DECLARE Mycursorp CURSOR SCROLL FOR SELECT Id,FirstName,LastName FROM EmployList 
 DECLARE @empid INT,@empfirstname VARCHAR(50),@emplastname VARCHAR(50);------------ONLY GET THAT COLUMS&ROWS
 /* 2)opening cursor:-
 acursor is opened for storing data retrivred from the result set */
 OPEN Mycursorp
/*3)fecthing cursor:-
when a cursor is opened , rows can be fecthed from the cursor one by one or in a block to do data manipulation*/


 FETCH FIRST FROM Mycursorp INTO @empid, @empfirstname, @emplastname -----------> HEAR USING WITH VARIABLE CURSOR WITH first METHOD and declare variables
 PRINT 'Employee is: '+CAST(@empid AS VARCHAR(50))+' '+@empfirstname+' '+@emplastname;

 FETCH NEXT FROM Mycursorp INTO @empid,@empfirstname,@emplastname-----------> HEAR USING WITH VARIABLE CURSOR WITH NEXT METHOD and declare variables
  PRINT 'Employee is: '+CAST(@empid AS VARCHAR(50))+' '+@empfirstname+' '+@emplastname;

  FETCH LAST FROM Mycursorp INTO @empid,@empfirstname,@emplastname-----------> HEAR USING WITH VARIABLE CURSOR WITH LAST METHOD and declare variables
   PRINT 'Employee is: '+CAST(@empid AS VARCHAR(50))+' '+@empfirstname+' '+@emplastname;

 FETCH PRIOR FROM Mycursorp INTO @empid,@empfirstname,@emplastname-----------> HEAR USING WITH VARIABLE CURSOR WITH PRIOR METHOD and declare variables
 PRINT 'Employee is: '+CAST(@empid AS VARCHAR(50))+' '+@empfirstname+' '+@emplastname;

 FETCH ABSOLUTE 5 FROM Mycursorp INTO @empid,@empfirstname,@emplastname -----------> HEAR USING WITH VARIABLE CURSOR WITH ABSOLUTE METHOD and declare variables
  PRINT 'Employee is: '+CAST(@empid AS VARCHAR(50))+' '+@empfirstname+' '+@emplastname;

 FETCH RELATIVE -3 FROM Mycursorp INTO @empid,@empfirstname,@emplastname-----------> HEAR USING WITH VARIABLE CURSOR WITH RELATIVE METHOD HEAR ABSOLUTE +RELATIVE
  PRINT 'Employee is: '+CAST(@empid AS VARCHAR(50))+' '+@empfirstname+' '+@emplastname;


/*4)closing cursor :-
the cursor should be closed by explicit after dml = data manipulation language
*/
CLOSE Mycursorp---------close cursor
/*
5)de-allocating cursor:-
cursors should be deallocated to delete cursor defination and release all the system resources with the cursor
when your work or function is complte using cursor, destroy or delete cursor 
*/
DEALLOCATE Mycursorp;






