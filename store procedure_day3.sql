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