
------------------------------SQL Stored Procedures--------------------------------------------

----A Stored Procedure is a database object.
----A stored Procedure is  a series of declarative SQL statements.
----A stored procedure can be stored in the DB and can be reused over & over again.
----Parameters can be passed to a stored procedure, so that the stored procedure can act based on the parameter value(s).
----SQL server creates an execution plan & stores it in the cache.


---------------store procedure practice--------------
CREATE TABLE Customers(CustomerID INT IDENTITY PRIMARY KEY,CustomerName VARCHAR(50),ContactName VARCHAR(50),Address VARCHAR(70),City VARCHAR(50),PostalCode BIGINT ,Country VARCHAR(50));
INSERT INTO Customers
VALUES ('Shubham','Seth','up','Jaunpur',548445,'India');
-----crete store procedure-----------
CREATE PROCEDURE SelectAllCustomers -------CREATE PROC -----------
AS
SELECT *FROM Customers
GO;
---------Excute Procedure--------------
EXEC SelectAllCustomers;
-------------------create store procedure with parameter----------
CREATE PROCEDURE SelectAllCustomars @City varchar(50)
AS
SELECT * FROM Customers WHERE City = @City;
---------execute store procedure---
EXEC SelectAllCustomars @City = 'Jaunpur';
----------Create multiple parameters store procedure-----
CREATE PROC SelectAllCustomors @City varchar(50), @PostalCode bigint
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode;
--------execute multiple parameters store procedure-----
EXECUTE SelectAllCustomors @City = 'Jaunpur',@PostalCode =548445;
----ater store procedure----------
ALTER PROC SelectAllCustomers @city varchar(50)
AS
BEGIN
SElECT *FROM Customers ORDER BY City
end; 
-----------------exec store procedure---------
EXEC SelectAllCustomars @City = 'IdontKnow';
-----------------another store procedure-------

CREATE PROC uspProductList
AS
BEGIN
SELECT 
     Address,City
	 FROM Customers
	 ORDER BY 
	 Address
	 END;
	 ----exec store procedure------
	 EXEC uspProductList;
------------DROP STORE PROCEDURE-----------
Drop PROCEDURE uspProductList;
--------------CREATE PROCEDURE WITH ONE PARAMETER and multi parameter--------------------
CREATE PROCEDURE uspFindProducts @City VARCHAR(50), @Address VARCHAR(100)
AS
BEGIN
SELECT Address,City FROM Customers WHERE City=@City OR Address=@Address ORDER BY City END;
--------------EXEC MULTIPLE PAREMETER STORE PROCEDURE------------------
EXEC  uspFindProducts @City='Idontknow',@Address='Chennai';
-------------------------alter procedure--------------
ALTER PROCEDURE uspFindProducts @City VARCHAR(50), @Address VARCHAR(100)
AS
BEGIN
SELECT Address,City FROM Customers WHERE City=@City OR Address=@Address ORDER BY Address END;
------------------------------------------------------------------------------------------------
/*Creating optional parameters
When you execute the uspFindProducts stored procedure, you must pass all three arguments corresponding to the three parameters.

SQL Server allows you to specify default values for parameters so that when you call stored procedures, you can skip the parameters with
 default values.

See the following stored procedure:*/
ALTER PROCEDURE uspFindProducts(
    @City VARCHAR(50) = 'jaunpur',
    @Address VARCHAR(100)='up'
    ,@name  VARCHAR(50)
)
AS
BEGIN
    SELECT
        City,
        Address,
		ContactName
    FROM 
        Customers
    WHERE
        City =  @City  AND
        Address =  @Address AND
        ContactName LIKE '%' + @name + '%'
    ORDER BY
        City;
END;

EXEC  uspFindProducts @name='Seth';
-----------------------------------ANOTHER PRACTICE OF STORE PROCEDURE-------------------------------
CREATE PROC spProcedure
AS
BEGIN
SELECT *FROM EmployList WHERE Id=2;
END
---------------EXEC CUTE STORE PROCEDURE---------------
spProcedure ;-----------------for execute just store procedure name is also enuff---
 EXECUTE spProcedure;----------------------this also another type of execute
 EXEC spProcedure;---------------this also another type----------
 -------------------------alter-----------------you can do manually also for alter-----
 Alter PROC spProcedure
AS
BEGIN
SELECT *FROM EmployList WHERE Id=2;
SELECT *FROM EmployList WHERE Id=4;
END

Drop PROC spProcedure;
-----------------------parameter store procedure-------------
CREATE PROC spProcedure
@salary int ,
@city VARCHAR(50)
AS
BEGIN
SELECT *FROM EmployList WHERE Salary=@salary;
SELECT *FROM EmployList WHERE City=@city
END
 spProcedure 'up'; --------------order sequence is important for execute-----
 spProcedure @city='up',@salary=0;---------------------hear not mandatory sequences---its called named table
 - --------------default parameter sp----------------
 Alter PROC spProcedure
@salary int =0,
@city VARCHAR(50)------------------------------------in this case not mandatory to GIVE VALUE why means its have a default value
AS
BEGIN
SELECT *FROM EmployList WHERE Salary=@salary;
SELECT *FROM EmployList WHERE City=@city
END
spProcedure @city='up'-----im not give any value its taking automatically valuue for salary-------------
-----------------output paramter dynamic sp-------
ALTER PROC spProcedure
@num1 INT =0,                   -------------------hear also you can give default value or not with out default value also its taking from out side parameter----
@num2 INT =5,
@Result INT OUTPUT          --------in this case output type variable we can store any value
AS
BEGIN
	SET @Result =@num1+@num2; 
END
------------------execute output parameter-----------
DECLARE @Res INT
EXEC spProcedure 5,6,@Res output;
SELECT @Res;
--------------------- show what data inside of store proceddure--------------
sp_helptext spProcedure
--------------------------encrypt sp for security purpose------------------------
ALTER PROC spProcedure
@num1 INT =0,                   
@num2 INT =5,
@Result INT OUTPUT 
WITH ENCRYPTION        ------> THIS IS USE FOR ENCRYPT DATA
AS
BEGIN
	SET @Result =@num1+@num2; 
END
/*important some definations
@ ---->in sql declare parameter using @
@parameter in sp declare this formal parameter,in normally output time its is actual parameter
sp  in prefix its good practice */
-----------------------SITE STORE PROCEDURE  SECTION 2 CONTROL OF FLOW STATEMENTS-----------------------------------------------------------------------------------
--- BEGIN AND END-----
/* The BEGIN...END statement is used to define a statement block. A statement block consists of a set of SQL statements that execute together.
 A statement block is also known as a batch.

In other words, if statements are sentences, the BEGIN...END statement allows you to define paragraphs.

The following illustrates the syntax of the BEGIN...END statement:
BEGIN
    { sql_statement | statement_block}
END
First, we have a block starting with the BEGIN keyword and ending with the END
keyword.
Note that the" @@ROWCOUNT " is a system variable that returns the number of rows affected by the last previous statement.

The BEGIN... END statement bounds a logical block of SQL statements. We often use the BEGIN...END at the start and end of a stored procedure and function.
 But it is not strictly necessary.

However, the BEGIN...END is required for the IF ELSE statements, WHILE statements, etc., where you need to wrap multiple statements.
Nesting :-  BEGIN... END
The statement block can be nested. It simply means that you can place a BEGIN...END statement within another BEGIN... END statement.
BEGIN
    DECLARE @name VARCHAR(MAX);

    SELECT TOP 1
        @name = product_name
    FROM
        production.products
    ORDER BY
        list_price DESC;
    
    IF @@ROWCOUNT <> 0
    BEGIN
        PRINT 'The most expensive product is ' + @name    -----SEE HEAR USE AGAIN BEGIN AND END LIKE THAT WE CAN USE NO OF TIMES
    END
    ELSE
    BEGIN
        PRINT 'No product found';
    END;
END*/
BEGIN
PRINT 'HELLO';  -------------PRINT USE FOR PRINT MSG
END
----------------------------------IF ELSE-----------------------
/*   The IF...ELSE statement is a control-flow statement that allows you to execute or skip a statement block based on a specified condition.

The IF statement
The following illustrates the syntax of the IF statement:

IF boolean_expression   
BEGIN
    { statement_block }
END
Code language: SQL (Structured Query Language) (sql)
In this syntax, if the Boolean_expression evaluates to TRUE then the statement_block in the BEGIN...END block is executed. Otherwise, the statement_block is skipped and the control of the program is passed to the statement after the END keyword.

Note that if the Boolean expression contains a SELECT statement, you must enclose the SELECT statement in parentheses.

The following example first gets the sales amount from the sales.order_items table in the sample database and then prints out a message if the sales amount
 is greater than 1 million.

BEGIN
    DECLARE @sales INT;

    SELECT 
        @sales = SUM(list_price * quantity)
    FROM
        sales.order_items i
        INNER JOIN sales.orders o ON o.order_id = i.order_id
    WHERE
        YEAR(order_date) = 2018;

    SELECT @sales;

    IF @sales > 1000000
    BEGIN
        PRINT 'Great! The sales amount in 2018 is greater than 1,000,000';
    END
END
Code language: SQL (Structured Query Language) (sql)
The output of the code block is:

Great! The sales amount in 2018 is greater than 1,000,000
----------------------IF ELSE ----------------------------------------------
When the condition in the IF clause evaluates to FALSE and you want to execute another statement block, you can use the ELSE clause.

The following illustrates the IF ELSE statement:

IF Boolean_expression
BEGIN
    -- Statement block executes when the Boolean expression is TRUE
END
ELSE
BEGIN
    -- Statement block executes when the Boolean expression is FALSE
END
Code language: SQL (Structured Query Language) (sql)
Each IF statement has a condition. If the condition evaluates to TRUE then the statement block in the IF clause is executed.
 If the condition is FALSE, then the code block in the ELSE clause is executed.

 BEGIN
    DECLARE @sales INT;
	-------------------------------------------1ST PART
    SELECT 
        @sales = SUM(list_price * quantity)
    FROM
        sales.order_items i
        INNER JOIN sales.orders o ON o.order_id = i.order_id
    WHERE
        YEAR(order_date) = 2017;
	------------------------------------------------2ND PART
    SELECT @sales;
	---------------------------------------------3RD PART
    IF @sales > 10000000
    BEGIN
        PRINT 'Great! The sales amount in 2018 is greater than 10,000,000';
    END
    ELSE
    BEGIN
        PRINT 'Sales amount in 2017 did not reach 10,000,000';
    END
END

OUT PUT : Sales amount did not reach 10,000,000
------------------------------------IF ELSE EXAMPLE PRACTICAL---------------------
Nested IF...ELSE
SQL Server allows you to nest an IF...ELSE statement within inside another IF...ELSE statement, see the following example:  */

BEGIN
    DECLARE @x INT = 10,
            @y INT = 20;

    IF (@x > 0)
    BEGIN
        IF (@x < @y)
            PRINT 'x > 0 and x < y';
        ELSE
            PRINT 'x > 0 and x >= y';
    END			
END
 /*  Code language: SQL (Structured Query Language) (sql)
In this example:

First, declare two variables @x and @y and set their values to 10 and 20 respectively:*/

DECLARE @x INT = 5,
        @y INT = 60;
/* Code language: SQL (Structured Query Language) (sql)
Second, the output IF statement check if @x is greater than zero. Because @x is set to 10, the condition (@x > 10) is true. Therefore, the nested IF statement executes.

Finally, the nested IF statement check if @x is less than @y ( @x < @y). Because @y is set to 20,  the condition (@x < @y) evaluates to true.
 The PRINT 'x > 0 and x < y'; statement in the IF branch executes.

Here is the output:

x > 0 and x < y
It is a good practice to not nest an IF statement inside another statement because it makes the code difficult to read and hard to maintain.*/
