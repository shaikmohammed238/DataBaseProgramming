----------------create view----------------------
-------

---------create simple view ---------------------

 CREATE  VIEW Vwemploy---------------------CREATE VIEW
 AS
 SELECT *FROM EmployList;
 ----------------execute of view ----------------------
  SELECT *FROM Vwemploy; -----------------EXCUTE VIEW
  ----------------alter view means any changes you want------------
  ALTER  VIEW Vwemploy---------------------ALTER VIEW
 AS
 SELECT *FROM EmployList;

 DROP VIEW Vwemploy;

 /* By definition, views do not store data except for indexed views.

A view may consist of columns from multiple tables using joins or just a subset of columns of a single table. This makes views useful for abstracting or hiding complex queries.

The following picture illustrates a view that includes columns from multiple tables:

SQL Server Views
Advantages of views
Generally speaking, views provide the following advantages:

Security
You can restrict users to access directly to a table and allow them to access a subset of data via views.

For example, you can allow users to access customer name, phone, email via a view but restrict them to access the bank account and other sensitive information.*/
--------------multiple  views -----------------
--in multiple table get in single views use joins 
CREATE VIEW Vwemployeemulti
As
SELECT al.City,al.FirstName,al.LastName,am.CustomerName
FROM EmployList al-------------->alias name al
JOIN Customers am------------>alias name am
ON al.City=am.City; 
-------------------------EXECUTE--------------
 SELECT *FROM Vwemployeemulti;
 /* How To Update The MetaData Of ASql View -----if u update the table then then update view also without update not showing  */

 EXEC sp_refreshview Vwemploy;------sp_refreshview view is refreshing view

  SELECT *FROM Vwemploy;
/* How To Create schema binding A Sql View---in schema binding use u cant delete,update,change any row of original table
*/
 CREATE VIEW Vwemployschemabinding                    ---------------------CREATE schemabinding
 WITH SCHEMABINDING								------------------using SCHEMABINDING u get one type of security
 AS
 SELECT LastName,FirstName,JobRole FROM dbo.EmployList;  ---------u cant binding total table use * ,u use rows
 /* Why to use view?- hide the complexity of query row&column  level security*/ 

  CREATE  VIEW Vwemployrow---------------------CREATE row level security
 AS
 SELECT *FROM EmployList WHERE Id >6;

  CREATE  VIEW Vwemploycolumn---------------------CREATE column level security 
 AS
 SELECT Id,City FROM EmployList ;

  SELECT *FROM  Vwemploycolumn;

/* UPdating views 
-we can use dml operation on single table only
-view should not contain groupby,having,distintinct clauses
-we cannot use sub query in a view in sql server
-we cannot use set operators in a sql view
delete from view
update into view */

CREATE  VIEW Vwemploydemoupde
 AS
 SELECT *FROM EmployList ;

  SELECT *FROM  Vwemploydemoupde
  ----isert data thourgh view---
  Insert Into Vwemploydemoupde(LastName,FirstName,JobRole,Salary,PhoneNumber,Address,City,PinCode,Email,Experience)
  VALUES ( 'SHAIK','MOHAMMED','ENGINEER',80000,5802852025,'Almaspet','kadapa',582268,'shaik@amil.com',5);
  ------delete data to thourgh view------------
  DELETE FROM Vwemploydemoupde WHERE Id=13;
  --------UPDATE DATA thourgh VIEW-------
  UPDATE Vwemploydemoupde Set LastName='hello' where Id =1011;

  /* with check option 
  it is applicable to a updatetable view.
  if the view is not updatable, then there is no meaning of this.
  the with check option clause is used to prevent the insertion of rows in the view where the conditon in the
  where clause in create view statement is not satisfied.  */

  CREATE VIEW Vmcheckoptiondemo
  AS
  SELECT * FROM EmployList WHERE City='kadapa'  -----giving condition 
  WITH CHECK OPTION;
  ----------UPDATE USE CHECK OPTION----------------
    Insert Into Vmcheckoptiondemo(LastName,FirstName,JobRole,Salary,PhoneNumber,Address,City,PinCode,Email,Experience)
	VALUES ( 'SHA','MOHAMM','ENGINEER',80580,5802852525,'Almas','kadapa',582252,'shik@amil.com',6);

	 SELECT *FROM  Vmcheckoptiondemo;




  

  

 