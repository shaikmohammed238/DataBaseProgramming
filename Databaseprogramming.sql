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
	---------------------EXECUTE TABLE--------------

SELECT *FROM EmployList;
-----------------------ADDED VALUE---------------------------
INSERT INTO EmployList(LastName,FirstName,JobRole,Salary,PhoneNumber,Address,City,PinCode,Email,Experience)
VALUES('dewj','frn1','modjbel',545560,995456152,'mujbffhj0','viugojfgt',5565661,'englishglo@gmail.com',9);
------------------------EXECUTE VALUE-------------------
SELECT
    *
FROM
    EmployList;
-----------------------------------------EXCUTE VALUE-------------------------------
SELECT
    FirstName,
    LastName
FROM
    EmployList;
-----------------------EXECUTE PARTICULAR VALUE---------------------------
SELECT
    FirstName,
    LastName,
    Email
FROM
    EmployList;

------------------------------------EXECUTE PARTICULAR COLUMNS----------------------
	SELECT
    *
FROM
    EmployList;
-----------------------------------------EXECUTE TABLE------------------------
	SELECT
    *
FROM
    EmployList
WHERE
    PinCode = 516001;
-----------------------------------------EXECUTE PINCODE COLUMN USE WHERE CONDITION-----------------
	SELECT
    *
FROM
    EmployList
WHERE
    Salary= 0
ORDER BY
    FirstName;
---------------------------------------EXECUTE PINCODE COLUMN USE WHERE CONDITION ONE ORDER BY ----------------
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
--------------------------------------EXECUTE PINCODE COLUMN USE WHERE CONDITION ONE ORDER BY USING GROUP BY SAME VALUE--------------
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
------------------------EXECUTE PINCODE COLUMN USE WHERE CONDITION ONE ORDER BY USING GROUP BY SAME VALUE USE HAVING CONDITON less than 2--------------
	-------------------------------------------------SECTION 2-----------------------------
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

---------------------------------------------------------------------SECTION3---------------OFFSET-------------------------------------------------------------------------------------

--The OFFSET clause specifies the number of rows to skip before starting to return rows from the query. The offset_row_count can be a constant, variable, or parameter that is greater or equal to zero.
--The FETCH clause specifies the number of rows to return after the OFFSET clause has been processed. The offset_row_count can a constant, variable or scalar that is greater or equal to one.
--The OFFSET clause is mandatory while the FETCH clause is optional. Also, the FIRST and NEXT are synonyms respectively so you can use them interchangeably. Similarly, you can use the FIRST and NEXT interchangeably.
--The OFFSET and FETCH clauses are the options of the ORDER BY clause. They allow you to limit the number of rows to be returned by a query.

SELECT
    Salary,
    City
FROM
    EmployList
ORDER BY
    Salary,
    City;
--To skip the first 5  and Employes return the rest, you use the OFFSET clause as shown in the following statement:

SELECT
    Salary,
    City
FROM
    EmployList
ORDER BY
    Salary,
    City
OFFSET 5 ROWS;

--To skip the first 10 products and select the next 10 products, you use both OFFSET and FETCH clauses as follows:

SELECT
    Salary,
    City
FROM
    EmployList
ORDER BY
    Salary,
    City
OFFSET 5 ROWS
FETCH NEXT 4 ROWS ONLY;

------Introduction to SQL Server SELECT TOP------------------------------------------

--The SELECT TOP clause allows you to limit the number of rows or percentage of rows returned in a query result set.
--In this syntax, the SELECT statement can have other clauses such as WHERE, JOIN, HAVING, and GROUP BY.
-- expression
--Following the TOP keyword is an expression that specifies the number of rows to be returned. The expression is evaluated to a
-- float value if PERCENT is used, otherwise, it is converted to a BIGINT value.
--------------------------------------------- PERCENT
--The PERCENT keyword indicates that the query returns the first N percentage of rows, where N is the result of the expression.

------------------------------------------ WITH TIES
--The WITH TIES allows you to return more rows with values that match the last row in the limited result set. 
--Note that WITH TIES may cause more rows to be returned than you specify in the expression.
--1)top 5 rows
SELECT TOP 5
    FirstName 
FROM
    EmployList
ORDER BY 
    FirstName DESC;

--2) Using TOP to return a percentage of rows

SELECT TOP 1 PERCENT
    FirstName,
	City 
FROM
    EmployList
ORDER BY 
    FirstName DESC;

--3) Using TOP WITH TIES to include rows that match the values in the last row

SELECT TOP 6 WITH TIES
    FirstName,
	City 
FROM
    EmployList
ORDER BY 
    FirstName DESC;
	--------------------------------------------------SECTION4---------------------------------------------------------
---------------------------------------------Introduction to SQL Server SELECT DISTINCT clause
--Sometimes, you may want to get only distinct values in a specified column of a table. To do this, you use the SELECT DISTINCT clause as follows:
--The query returns only distinct values in the specified column. In other words, it removes the duplicate values in the column from the result set.
--If you apply the DISTINCT clause to a column that has NULL, the DISTINCT clause will keep only one NULL and eliminate the other. In other words, 
--the DISTINCT clause treats all NULL “values” as the same value.

--To get distinct cities, you add the DISTINCT keyword as follows:

SELECT DISTINCT
    City
FROM
    EmployList
ORDER BY
    City;
--B) DISTINCT multiple columns example

SELECT DISTINCT
    City,
	Salary
FROM
    EmployList
ORDER BY
    Salary,
    City;

----------------------------------DISTINCT vs. GROUP BY----------------------------------------

SELECT 
	City,
	Salary,
	FirstName
FROM 
	EmployList
GROUP BY 
	City,Salary,FirstName
ORDER BY
	City,Salary,FirstName;
--Both DISTINCT and GROUP BY clause reduces the number of returned rows in the result set by removing the duplicates.

--However, you should use the GROUP BY clause when you want to apply an aggregate function on one or more columns.

--In this tutorial, you have learned how to use the SQL Server SELECT DISTINCT clause to retrieve the distinct values 
--in a specified list of columns.
--It is equivalent to the following query that uses the DISTINCT operator :
SELECT 
	DISTINCT 
      City,
	Salary,
	FirstName
FROM 
	EmployList;
--When you use the SELECT statement to query data against a table, you get all the rows of that table, which is unnecessary because 
--the application may only process a set of rows at the time.

--To get the rows from the table that satisfy one or more conditions, you use the WHERE clause as follows:

SELECT 
      City,
	LastName,
	FirstName
FROM 
	EmployList
WHERE
     Salary=0;

--The following example uses the LIKE operator to find products whose name contains the string
SELECT 
      City,
	LastName,
	FirstName
FROM 
	EmployList
WHERE
     LastName LIKE 'Kumari'
ORDER BY
	 City;
---SQL Server AND operator examples
--A) Using AND operator example
SELECT
    *
FROM
    EmployList
WHERE
    LastName = 'Kumari'
AND Experience =0
ORDER BY
    Experience;
--A) Using OR operator example
SELECT
    LastName,
	Experience
FROM
    EmployList
WHERE
    Experience <2
OR  Experience > 8
ORDER BY
    Experience;
--A) Using SQL Server IN with a list of values example
SELECT
    LastName,
	Experience
FROM
    EmployList
WHERE
    Experience IN (4,5,6,7,8,9)
ORDER BY
    Experience;
-----------------------------------------------------Overview of the SQL Server BETWEEN operator-------------------------------
-----The BETWEEN operator is a logical operator that allows you to specify a range to test.
-------The following illustrates the syntax of the BETWEEN operator:
---[column | expression BETWEEN start_expression AND end_expression]------
--You can use the greater than or equal to (>=) and less than or equal to (<=) to substitute the BETWEEN operator as follows:
----[column | expression <= end_expression AND column | expression >= start_expression]
---To negate the result of the BETWEEN operator, you use NOT BETWEEN operator as follows:
--[column | expression NOT BETWEEN start_expression AND end_expresion]
----the  start_expression and greater than the value of the end_expression. It is equivalent to the following condition:
--[column | expression < start_expression AND column | expression > end_expression]
--A) Using SQL Server BETWEEN with numbers example
SELECT
    LastName,
	Experience
FROM
    EmployList
WHERE
    Experience BETWEEN 1 AND 9
ORDER BY
    Experience;
--B) Using SQL Server Not BETWEEN with numbers example
SELECT
    LastName,
	Experience
FROM
    EmployList
WHERE
    Experience NOT BETWEEN 1 AND 9
ORDER BY
    Experience;
----SQL Server LIKE operator overview
--The SQL Server LIKE is a logical operator that determines if a character string matches a specified pattern.
-- A pattern may include regular characters and wildcard characters. The LIKE operator is used in the WHERE clause of the SELECT,
--  UPDATE, and DELETE statements to filter rows based on pattern matching.

--The following illustrates the syntax of the SQL Server LIKE operator:
--[column | expression LIKE pattern [ESCAPE escape_character]]
---Pattern
--The pattern is a sequence of characters to search for in the column or expression. It can include the following valid wildcard characters:

--The percent wildcard (%): any string of zero or more characters.
--The underscore (_) wildcard: any single character.
--The [list of characters] wildcard: any single character within the specified set.
--The [character-character]: any single character within the specified range.
--The [^]: any single character not within a list or a range.
---The wildcard characters makes the LIKE operator more flexible than the equal (=) and not equal (!=) string comparison operators.
----------------------------------------------------Escape character
--The escape character instructs the LIKE operator to treat the wildcard characters as the regular characters. 
--The escape character has no default value and must be evaluated to only one character.

--the LIKE operator returns TRUE if the column or expression matches the specified pattern.

--To negate the result of the LIKE operator, you use the NOT operator as follows:
------------[column | expression NOT LIKE pattern [ESCAPE escape_character]]

SELECT
    LastName,
	FirstName,
	City
FROM
    EmployList
WHERE
    LastName Like 'S%'   --[where front of % in first letter in last name] ---'%ri' end of last name 'ri' come
ORDER BY
    FirstName;
--The following statement retrieves the customers whose last name starts with the letter k and ends with the letter i:
SELECT
    LastName,
	FirstName,
	City
FROM
    EmployList
WHERE
    LastName Like 'K%i'   ---'[YZ]%'--->means whole lastname column visible all yz character names
ORDER BY
    FirstName;
--For example, the following query finds the customers where the first character in the last name is the letter in the range A through C:
-----------['[A-C]%']-----------
--For example, the following query returns the customers where the first character in the last name is not the letter in the range A through X:
-------------------['[^A-X]%']-----------
--The following example uses the NOT LIKE operator to find customers where the first character in the first name is not the letter A:
-----------------------[ first_name NOT LIKE 'A%']----------------------
---------------------------------------------------------------SQL Server column alias
--When you use the SELECT statement to query data from a table, SQL Server uses the column names as the column headings for the output.
-- See the following example:
--Note that if the column alias contains spaces, you need to enclose it in quotation marks as shown in the following example:

SELECT
    FirstName + ' ' + LastName AS 'Full Name'
FROM
    EmployList
ORDER BY
    FirstName;
--SQL Server table alias
--A table can be given an alias which is known as correlation name or range variablE

--Similar to the column alias, table alias can be assigned either with or without the AS keyword:

--table_name AS table_alias
--table_name table_alias


--------Section 5. Joining tables--------
--Summary: in this tutorial, you will learn about various SQL Server joins that allow you to combine data from two tables.

--In a relational database, data is distributed in multiple logical tables. To get a complete meaningful set of data, you need to query data 
--from these tables using joins. SQL Server supports many kinds of joins, including inner join, left join, right join, full outer join, and cross join.
-- Each join type specifies how SQL Server uses data from one table to select rows in another table.

--Let’s set up sample tables for demonstration.
CREATE SCHEMA hr;
GO
---Second, create two new tables named candidates and employees in the hr schema:

CREATE TABLE hr.candidates(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

CREATE TABLE hr.employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);
----Third, insert some rows into the candidates and employees tables:
INSERT INTO 
    hr.candidates(fullname)
VALUES
    ('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');


INSERT INTO 
    hr.employees(fullname)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');
	---SQL Server Inner Join
	--Inner join produces a data set that includes rows from the left table, matching rows from the right table.

---The following example uses the inner join clause to get the rows from the candidates table
-- that has the corresponding rows with the same values in the fullname column of the employees table:
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name       --{inner join means only visible same data}
FROM 
    hr.candidates c
    INNER JOIN hr.employees e 
        ON e.fullname = c.fullname;





