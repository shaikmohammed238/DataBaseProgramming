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







