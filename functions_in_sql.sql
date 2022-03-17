/* -------------------------Functions In Programming:-
*A function is a block of code that performs a specific task.
*Functions usually “take in” data, process it, and “return” a result.
*Once a function is written, it can be used over and over again, it means functions can be reused.
-----------------------------Functions In SQL Server:-
* SQL Server Functions are useful objects in SQL Server databases.
	*A function is a set of SQL statements that perform a specific task. Functions faster code reusability.
	*If you have to repeatedly write large SQL scripts to perform the same task, you can create a function that performs that task.
	*Next time instead of rewriting the SQL, you can simply call that function.
	*A function accepts inputs in the form of parameters and returns a value.
	*SQL Server comes with a set of built-in functions that perform a variety of tasks.
	*In SQL Server, a function is a stored program that you can pass parameters into and return a value.
	*A SQL Server function is a code snippet that can be executed on a SQL Server.
	*Of course, you could create a stored procedure to group a set of SQL statements and execute them, however, stored procedures cannot be called within SQL statements.
	*Therefore, if you are using functions with large data sets, you can hit performance issues.
	*In T-SQL, a function is considered an object. Here are some of the rules when creating functions in SQL Server.
	*In T-SQL, a function is considered an object. Here are some of the rules when creating functions in SQL Server.
	*A function must have a name and a function name can never start with a special character such as @, $, #, and so on.
	*Functions only work with select statements.
	*Functions can be used anywhere in SQL, like AVG, COUNT, SUM, MIN, DATE and so on with select statements.
	*Functions compile every time.
	*Functions must return a value or result.
	*Functions only work with input parameters.
	*Try and catch statements are not used in functions.
--------------------SQL Server Function Types:-
SQL Server supports two types of functions – user defined and system.
1)User Defined function: User defined functions are create by a user.
2)System Defined Function: System functions are built in database functions.
------There are three types of user-defined functions in SQL Server:
1)Scalar Functions
2)Inline Table Valued Functions
3)Multi-Statement Table Valued Functions
------------SQL Server Scalar Function
The following are some key takeaway of the scalar functions:
*Scalar functions can be used almost anywhere in T-SQL statements.
*Scalar functions accept one or more parameters but return only one value, therefore, they must include a RETURN statement.
*Scalar functions can use logic such as IF blocks or WHILE loops.
*Scalar functions cannot update data. They can access data but this is not a good practice.
*Scalar functions can call other functions. */
---------------STEPS TO DO:-
--CREATE a Function Without Parameter 

 CREATE FUNCTION Woutparameter()
 RETURNS VARCHAR (100) 
 AS
 BEGIN
 RETURN 'HELLO WELCOME TO FUNCTIONS'
					------------IF U WANT ANY QUERY OR SQL WRITE WITH IN BEGIN AND END
 END
  
  SELECT  dbo.Woutparameter();
---CREATE A function with single parameter 

CREATE FUNCTION Witsparameter(@NUM INT)
 RETURNS INT 
 AS
 BEGIN
 RETURN (@NUM * @NUM)
					------------IF U WANT ANY QUERY OR SQL WRITE WITH IN BEGIN AND END
 END

 SELECT  dbo.Witsparameter(5);
 --Create a function with multi parameters 
 CREATE FUNCTION WitMparameter(@NUM INT,@NUM2 INT)
 RETURNS INT 
 AS
 BEGIN
 RETURN (@NUM+@NUM2)
					------------IF U WANT ANY QUERY OR SQL WRITE WITH IN BEGIN AND END
 END

 SELECT  dbo.WitMparameter(5,15);
 ---Alter function 
 

ALTER FUNCTION Witsparameter(@NUM INT)
 RETURNS INT 
 AS
 BEGIN
 RETURN (@NUM * @NUM +@NUM)
					------------IF U WANT ANY QUERY OR SQL WRITE WITH IN BEGIN AND END
 END

 SELECT DBO.Witsparameter(25)
 ---Drop function 
 DROP FUNCTION DBO.Witsparameter
 --Using if else 
 ALTER function CheckPASSPORTAge(@age as int)
returns varchar(100)
as
begin
	declare @str varchar(150)
	      
	if @age >= 18
	begin
	set @str = 'You are eligible to apply NORMAL passport'
	end
	else
	begin
	set @str = 'You are not eligible to NORMAL passport,PLEASE apply to child passport'
	end
	return @str
end

SELECT DBO.CheckPASSPORTAge(10);
------Using another function inside function
create function FuncLoop(@num as int)
returns datetime
as
begin
return getdate()
end

SELECT DBO.FuncLoop(8)











































































