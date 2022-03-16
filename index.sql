/*Indexes are special data structures associated with tables or views that help speed up the query.
 SQL Server provides two types of indexes: clustered index and non-clustered index.
 Clustered indexes – A clustered index stores data rows in a sorted structure based on its key values.
					 Each table has only one clustered index because
                      data rows can be only sorted in one order. The table that has a clustered index is called a clustered table.
Create nonclustered indexes –A nonclustered index is a data structure that improves the speed of data retrieval from tables.
                        Unlike a clustered index, a nonclustered index sorts and stores data separately from the data rows in the table.
                         It is a copy of selected columns of data from a table with the links to the associated table. 
Rename indexes – replace the current index name with the new name using sp_rename stored procedure and SQL Server Management Studio.
Disable indexes – show you how to disable indexes of a table to make the indexes ineffective.
Enable indexes – learn various statements to enable one or all indexes on a table.
Unique indexes – enforce the uniqueness of values in one or more columns.
Drop indexes – describe how to drop indexes from one or more tables.
Indexes with included columns – describe how to add non-key columns to a nonclustered index to improve the speed of queries.
Filtered indexes – .
Indexes on computed columns – walk you through how to simulate function-based indexes using the indexes on computed columns.
   
 -------------------------------Clustered indexes----------------------------------------------------------
 When you create a table with a primary key, SQL Server automatically creates a corresponding clustered index based on columns included in the primary key.

This statement creates a new table named production.part_prices with a primary key that includes two columns: part_id and valid_from.
	
	CREATE TABLE production.part_prices(
    part_id int,
    valid_from date,
    price decimal(18,4) not null,
    PRIMARY KEY(part_id, valid_from) 
);

If you add a primary key constraint to an existing table that already has a clustered index, SQL Server will enforce the primary key using a non-clustered index:

This statement defines a primary key for the production.parts table:

	ALTER TABLE production.parts----------------------if doesnt have a cluster index create from table
ADD PRIMARY KEY(part_id);

Using SQL Server CREATE CLUSTERED INDEX statement to create a clustered index.
In case a table does not have a primary key, which is very rare, you can use the CREATE CLUSTERED INDEX statement to define a 
clustered index for the table.

The following statement creates a clustered index for the production.parts table:

CREATE CLUSTERED INDEX ix_parts_id  --------------> Ix is index symbol
ON production.parts (part_id);  

If you open the Indexes node under the table name, you will see the new index name ix_parts_id with type Clustered.


When executing the following statement, SQL Server traverses the index (Clustered index seek) to locate the row, 
which is faster than scanning the whole table.

SELECT 
    part_id, 
    part_name
FROM 
    production.parts
WHERE 
    part_id = 5;

	SQL Server CREATE CLUSTERED INDEX syntax
The syntax for creating a clustered index is as follows:

CREATE CLUSTERED INDEX index_name
ON schema_name.table_name (column_list);  

In this syntax:

First, specify the name of the clustered index after the CREATE CLUSTERED INDEX clause.
Second, specify the schema and table name on which you want to create the index.
Third, list one or more columns included in the index.
-------------------------------Create nonclustered indexes----------------------------------------
A nonclustered index is a data structure that improves the speed of data retrieval from tables.
 Unlike a clustered index, a nonclustered index sorts and stores data separately from the data rows in the table.
 It is a copy of selected columns of data from a table with the links to the associated table.

 *
 A table may have one or more nonclustered indexes and each non-clustered index may include one or more columns of the table.

 To create a non-clustered index, you use the CREATE INDEX statement:

				CREATE [NONCLUSTERED] INDEX index_name
				ON table_name(column_list);
In this syntax:

First, specify the name of the index after the CREATE NONCLUSTERED INDEX clause. Note that the NONCLUSTERED keyword is optional.
Second, specify the table name on which you want to create the index and a list of columns of that table as the index key columns.

When you create a nonclustered index that consists of multiple columns, the order of the columns in the index is very important. 
You should place the columns that you often use to query data at the beginning of the column list.

For example, the following statement finds customers whose last name is Albert. Because the last_name is the leftmost column in the 
index, the query optimizer can leverage the index and uses the index seek method for searching:

	SELECT 
    customer_id, 
    first_name, 
    last_name
FROM 
    sales.customers
WHERE 
    last_name = 'Albert';
*/
-----------------------------------INDEXES---------------------------------------------

/*
Indexes are special data structures associated with tables or views that help speed up the query.
WHAT IS INDEX?
* An index is a pointer to  data in a table.
* An index in a database is very similiar to an index in the back of a book.
*An index its help to reduce time to execute qureis
* An index helps to speed up SELECT queries and WHERE clauses.
* Indexes can be created or dropped with no effect on the data.
						TYPES OF INDEXES
1) CLUSTERED INDEX:-
	* Each table has only one clustered index because data rows can be only sorted in one order.
	* A clustered index is a special index which physically orders the data according to the indexed columns.
	* The leaf nodes of the index store the data for the rest of the columns in the table.
2) NON-CLUSTERED INDEX:-
	* A table may have one or more non clusterd.
	* A non-clustered index is just like the index of a book.
	* It points back to the actual page that contains the data. (In other words, it points back to the clustered index)
*/

Create Table EmployeesIndexexamp
(
	Id int primary key identity,
	[Name] nvarchar(50),
	Email nvarchar(50),
	Department nvarchar(50)
)

SET NOCOUNT ON
Declare @count int = 1

While(@count <= 10000)
Begin
	Declare @Name nvarchar(50) = 'ABC ' + RTRIM(@count)
	Declare @Email nvarchar(50) = 'abc' + RTRIM(@count) + '@startech.com'
	Declare @Dept nvarchar(10) = 'Dept ' + RTRIM(@count)

	Insert into EmployeesIndexexamp values (@Name, @Email, @Dept)

	Set @count = @count +1

	If(@count%100000 = 0)
		Print RTRIM(@count) + ' rows inserted'
End

----In SQL Server Management Studio click on Include Actual Execution Plan icon and then execute the following query
Select * from EmployeesIndexexamp where Id = 9999

/*
Notice, the operation is Clustered Index Seek, meaning the database engine is using the clustered index on the employee Id 
column to find the employee row with Id = 9999
Number of rows read = 1
Actual number of rows for all executions = 1
Number of rows read, is the number of rows SQL server has to read to produce the query result. 
In our case Employee Id is unique, so we expect 1 row and that is represented by Actual number of rows for all executions.
With the help of the index, SQL server is able to directly read that 1 specific employee row we want. 
Hence, both, Number of rows read and Actual number of rows for all executions is 1.
So the point is, if there are thousands or even millions of records, SQL server can easily and quickly find the data 
we are looking for, provided there is an index that can help the query find data.
----------------------------------------------------------------------Clustered Index Scan------------------------------------------------
In this example, there is a clustered index on EmployeeId column, so when we search by employee id, 
SQL Server can easily and quickly find the data we are looking for. What if we serach by Employee name? 
At the moment, there is no index on the Name column, so there is no easy way for sql server to find the data 
we are looking for. SQL server has to read every record in the table which is extremely inefficient 
from performace standpoint. 
Execute the following query with Include Actual Execution Plan turned ON
*/

Select * from EmployeesIndexexamp Where Name = 'ABC 9999'

/*
Notice, the operation is Clustered Index Scan. Since there is no proper index to help this query, 
the database engine has no other choice than to read every record in the table. This is exactly the reason 
why Number of rows read is 10000, i.e every row in the table
Number of rows read = 10000
Actual number of rows for all executions = 1
How many rows are we expecting in the result? Well, only one row because there is only one employee whose 
Name = 'ABC 9320'. So, to produce this 1 row as the result, SQL server has to read all the 10000 rows 
from the table because there is no index to help this query. This is called Index Scan and in general, 
Index Scans are bad for performance.
*/

/*	
---------Non-Clustered Index in SQL Server-----------
This is when we create a non-clustered index on the Name column.
In an non-clusterd index we do not have table data. We have key values and row locators.
We created a non-clustered index on the Name column, so the key values, in this case Employee names are sorted 
and stored in alphabetical order.
The row locators at the bottom of the tree contain Employee Names and cluster key of the row. In our example, 
Employee Id is the cluster key.*/


GO
CREATE NONCLUSTERED INDEX IX_EmployeesIndexnon
ON [dbo].EmployeesIndexexamp ([Name])
GO

----Execute the following query again with Include Actual Execution Plan turned ON
Select * from EmployeesIndexexamp Where Name = 'ABC 9999'

/*
						NON CLUSTERED INDEX
* A non-clustered index doesn't sort the physical data inside the table.
* In fact, a non-clustered index is stored at one place and table data is stored in another place.
* This is similar to a textbook where the book content is located in one place and the index is located in another.
* This allows for more than one non-clustered inex per table.
						SQL SERVER UNIQUE INDEX
* A unique index ensures the index key columns do not contain any duplicate values.
* A unique index may consist of one or many columns.
* A unique index can be clustered or non-clustered.
						WHERE TO APPLY INDEX
* Indexes are meant to speed up the performance of a database, so use indexing whenever it significantly improves the 
performance of your database.
* Check query and find reason for slow performance.
* Find column in query which is used frequently for searching.
						DISADVANTAGES OF INDEXING
* In case of update(change in indexed column) and delete a record, the database might need to move the entire row into
row into a new position to keep the rows in sorted order.
*/ 