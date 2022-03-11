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