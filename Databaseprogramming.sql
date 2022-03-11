--create database--
CREATE DATABASE HiringMicroServices;
-- Drop Data Base--
DROP DATABASE HiringMicroServices;
--create table and declare datatype with not nulland increment etc--
CREATE TABLE PersonsTable (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
	PinCode int,
	PRIMARY KEY(PersonID)
);
--delete table from data base--
Drop Table Persons;
--insert data to that table with column or specified column--
INSERT INTO PersonsTable 
VALUES (0, 'Shaik', 'true', 'Almaspet', 'kadapa',516001);
--display all table with data--
Select *From PersonsTable;
--update your table with give condition like where--
UPDATE PersonsTable
SET LastName = 'mohammed', City= 'Delhi'
WHERE PersonID = 0; 
--delete from table with give condition leke where --
DELETE FROM PersonsTable WHERE PersonID=3;

-----------------------------------------------------------------------------------
-------------------------------------- day2---------------------------------------
CREATE TABLE EmployList(
    Id int Identity PRIMARY KEY,
    LastName varchar(255) not null,
    FirstName varchar(255) not null,
	JobRole varchar(150)not null,
	Salary int default(0),
	PhoneNumber bigint,
    Address varchar(255),
    City varchar(255),
	PinCode int,
	Email varchar(40),
	Experience int default(0) 
	);

SELECT *FROM EmployList;

INSERT INTO EmployList(LastName,FirstName,JobRole,PhoneNumber,Address,City,PinCode,Email)
VALUES('dewrjhr','frkn581','modeel',9954569852,'mum630','viugojt',556561,'englishlo@gmail.com');

SELECT
    *
FROM
    EmployList;

SELECT
    FirstName,
    LastName
FROM
    EmployList;

SELECT
    FirstName,
    LastName,
    Email
FROM
    EmployList;


	SELECT
    *
FROM
    EmployList;



	SELECT
    *
FROM
    EmployList
WHERE
    PinCode = 516001;


	SELECT
    *
FROM
    EmployList
WHERE
    Salary= 0
ORDER BY
    FirstName;


	SELECT
	City,
   COUNT(*)
FROM
    EmployList
WHERE
    Salary= 0
GROUP BY
    City
ORDER BY
    City;


	SELECT
    City,
    COUNT (*)
FROM
    EmployList
WHERE
    Salary= 0
GROUP BY
    City
HAVING
    COUNT (*) >= 1
ORDER BY
    City;

-----------------Order By Clause in Details--------------

--When you use the SELECT statement to query data from a table, the order of rows in the result set is not guaranteed. 
--It means that SQL Server can return a result set with an unspecified order of rows.
--The only way for you to guarantee that the rows in the result set are sorted is to use the ORDER BY clause
------------------------------------------ASC | DESC
--Second, use ASC or DESC to specify whether the values in the specified column should be sorted in ascending or descending order.

---The ASC sorts the result from the lowest value to the highest value while the DESC sorts the result set from the highest value to the lowest one.

----If you don’t explicitly specify ASC or DESC, SQL Server uses ASC as the default sort order. Also, SQL Server treats NULL as the lowest value
--A) Sort a result set by one column in ascending order

	SELECT FirstName, LastName FROM EmployList ORDER BY FirstName;

---B) Sort a result set by one column in descending order
--The following statement sorts the customer list by the first name in descending order

	SELECT FirstName, LastName FROM EmployList ORDER BY FirstName DESC;

--C) Sort a result set by multiple columns
--The following statement retrieves the first name, last name, and city of the customers. It sorts the customer list by the city first and then by the first name.

	SELECT FirstName, LastName,City FROM EmployList ORDER BY City, FirstName;

--D) Sort a result set by multiple columns and different orders

SELECT FirstName,LastName,City FROM EmployList ORDER BY  City DESC, FirstName ASC;

--E) Sort a result set by a column that is not in the select list
--It is possible to sort the result set by a column that does not appear on the select list. 
--For example, the following statement sorts the employee by the state even though the state column does not appear on the select list.

SELECT  FirstName, LastName, City FROM EmployList ORDER BY City;

--F) Sort a result set by an expression
--The LEN() function returns the number of characters of a string. 
--The following statement uses the LEN() function in the ORDER BY clause to retrieve a employee list sorted by the length of the first name.

SELECT FirstName, LastName FROM EmployList ORDER BY LEN(FirstName) DESC;

--G) Sort by ordinal positions of columns
--SQL Server allows you to sort the result set based on the ordinal positions of columns that appear in the select list.
--The following statement sorts the employees by first name and last name. But instead of specifying the column names explicitly, 
--it uses the ordinal positions of the columns:

SELECT FirstName, LastName FROM EmployList ORDER BY 1,2; --(hear 1= lastname,2= first name)










