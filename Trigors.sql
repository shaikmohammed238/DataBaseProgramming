--------------------------------------------------TRIGGERS-------------------------------
/* What is Trigger?
:- trigger is even driven  t-sql programming block.it runs automatically when a particular event occurs.
we cannot be explict the triggers,when a certain event occuurs
 in database two types of different types of events:- 1) dml (data manipulation language) event 2) ddl event(data defination events)
 
 INSERT,UPDATE,DELETE  --> DML COMMAND--> dml trigger

 CREATE,ALTER,DROP ---> DDL COMMAND   --> DML TRIGGER
 -------------------------------------D.M.L------------------------------*/
 DELETE FROM EmployList
  INSERT INTO EmployList
  VALUES ('JACK','SPARROW','KING OF SEA',0,555555555,'PIAREN','USA',555555,'CAPTAIN JACK@GMAIL.COM',100)
 -----------AUDIT TABLE ----------
 CREATE TABLE EmployAudit(Id INT,Insertedby VARCHAR(100)) ;
 SELECT * FROM EmployAudit;
--TRIGGER FOR INSERT EVENT   -----------------SIMPLE TRIGGER 
CREATE TRIGGER TRG_insert_audit
ON EmployList
FOR INSERT 
AS 
BEGIN 
		DECLARE @Id INT 

		SELECT @Id=Id FROM inserted------------------>magic table created itself sql
		insert INTO EmployAudit(Id,Insertedby)
		VALUES (@Id, ORIGINAL_LOGIN())
		
		PRINT'INSERT TRIGGER EXECUTE'
END
GO 
-------------------TRIGGER FOR DELETE EVENT -------
CREATE TRIGGER TRG_delete_audit
ON EmployList
FOR DELETE 
AS 
BEGIN 
		ROLLBACK
		PRINT'YOU CANNOT DELETE RECORDS IN THIS TABLE'
END
GO 
-------------------D.D.L-------------------------------------
CREATE TRIGGER TRG_create_ddl
ON DATABASE
FOR CREATE_TABLE 
AS 
BEGIN 
		ROLLBACK
		PRINT'YOU CANNOT CREATE  TABLE'
END
GO 

CREATE TABLE DDLEX(ID INT)-----------------------TRY THIS WHEN U CREATE TRIGGER
---------------LIST ALL TRIGGERS-----------------
SELECT * FROM sys.triggers
---------------find the description of triggers----------
SELECT * FROM sys.sql_modules
WHERE OBJECT_ID=object_id('TRG_delete_audit')
GO
------------------ENABLE TRIGGER & DISABLE TRIGGER-------------
--STATEMENT : DISABLE KEY WORD AFTER TRIGGER NAME  ON WHICH TABLE
--STATEMENT:ENABLE KEY WORD AFTER TRIGGER NAME  ON WHICH TABLE
DISABLE TRIGGER TRG_delete_audit ON EmployList
GO

ENABLE TRIGGER TRG_delete_audit ON EmployList
GO
-------- HOW TO DROP TRIGGERS---------
DROP TRIGGER TRG_delete_audit

 GO
 DROP TRIGGER TRG_create_ddl
 GO