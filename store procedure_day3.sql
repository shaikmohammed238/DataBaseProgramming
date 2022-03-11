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



