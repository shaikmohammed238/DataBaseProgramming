/*Transaction is 
*A single unit of work 
--Is successful only when all data modifications That are made in a transaction Are committed and Are saved in the database permanently 
*If the transaction Is rolled back or cancelled , then it means that the transaction has encountered errors and there are no changes
Made to the contents of the database .
*A transition can be either committed or rolledback .
*TCL(Transfer control language ] commit , rolledback , save point. */

SELECT * FROM EmployList;

UPDATE EmployList SET Salary=50000 WHERE LastName='Shaik'--------implicit transaction means system transaction its permenatly saved

-- explicit transaction start--
BEGIN TRANSACTION		-- These is compulsory to write any transaction 
UPDATE EmployList SET Salary=5000 WHERE LastName='Shaik'; -----If you start transaction rollback ,commit or close it's mandatory without this you Can't check in another connection it's not show
DELETE FROM EmployList WHERE Id=5;---At a time you can do multiple transactions ,But 2 SQL queries Is successful otherwise one is SQL query Is failed , transaction cancelled .

ROLLBACK TRANSACTION;----THIS IS ROLL BACK KEYWORD IS USE TO UNDO THE TRANSACTION

COMMIT TRANSACTION; --------THIS COMMITED MEANS CLOSE TRANSACTION& SAVE THE DATA IN TABLE
/*Defining transitions :a logical unit Of Work must exhibit 4 properties , called the atomicity , consistency , isolation, and 
durability (Acid] properties , to qualify as a transaction . 
1)atomicity:-If the transaction has many operations Then all should Be committed . It means all or none . It manages 
			By transaction manager .(if all success query its succes or if one query its fail total transaction fail)
2)Consistency:-the sequence of opertions must should be consistent.
				A=3000,b=4000=7000 -- BEFORE TRANSACTION
				A=3000-1000=2000}---
				b=4000+1000=5000}--- 7000 after transaction
3) isolation:-The operation that are performed must be isolated from the other operations on the same server or on the same database 
				It means each transaction must to be executed without knowing what is happening to other transactions .
				(means diffrent sql dont give same sql query)
4)durability:-The operations that are performed on the database must be saved and store in the database permanently 

---states of transaction
											begin
											  |
											active
										      |
								failed				partially commited or temporlysave
								|								|
								aborted						Commited

*When a transaction is started on a connection , all transact SQL statements are executed on the same connection and are a part
 Of the connection until the transaction ends 
*Transactions are managed at the connection level 
--if u want to see partiallty commited this below syntax
syntax:set transaction isolation level read uncommitted */
set transaction isolation level read uncommitted---syntax of uncommited
/* transaction types
explicit transaction:Every transaction explicitly starts with begin transaction statement and ends With a Rollback or commit transaction 
implicit transaction:When you cannot rollback any transaction and your transaction is automatically committed by SQL Server engine 
