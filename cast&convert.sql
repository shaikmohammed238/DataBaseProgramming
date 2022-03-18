/* cast               &                           convert
Both cast and convert our functions used to Convert one data type to another data type 
Both are often used interchangeably 
Without using cast and convert functions, implicit conversions occur
syntax:-

CAST
		CAST(exp AS datatype[(len)]
CONVERT
		CONVERT(datatype[(len)],expression[,style])
		diffrence b/w cast & convert
cast:-			
1}Cast is an ANSI standard 
2)CAST IS used to remove or reduce format while still converting
3)Cast is also the more portable function of two.It means that the cast function can be used by many databases 
convert:-
1)Convert easy specific function in the SQL Server 
2)Convert function can be used for formatting purposes especially for date /Time, data type and, money /Data type. 
3)Convert allows more flexibility and is a preferred function to use for data, time values, traditional numbers, and money signifiers. 
*/  
CREATE TABLE EMPCAST(Id int identity,[Name] VARCHAR(50),Datetype datetime)
INSERT  INTO EMPCAST(Name,Datetype)
VALUES ('suresh',8585)
 
---USE CAST
SELECT Id,cast(Datetype AS varchar(10))as castype,Name from EMPCAST---that ten is optional if u want give or not mandatory 
-- use convert
SELECT Id,CONVERT(varchar(10),Datetype)as castype,Name from EMPCAST--that ten is optional if u want give or not mandatory

---two diffrent datatypes in single column
SELECT Id+' '+Name,Datetype as castype from EMPCAST-------failed --inside of sql is alreadly implicit converting
SELECT Name+' '+Cast(Id as varchar)as twocolumn,Datetype from EMPCAST---passed we use cast for two diffrent datatype combine
--finding diffrent date 
SELECT COUNT (Id) FROM EMPCAST GROUP BY Datetype------all same data
SELECT COUNT (Id) FROM EMPCAST GROUP BY cast( Datetype as smalldatetime)-- u get diffrent date
SELECT COUNT (Id) FROM EMPCAST GROUP BY convert(date,Datetype)--use convert
--CONVERT
--CONVERT(DATA TYPE[(LEN)],EXPRESSION[,STYLE])
/*
8---HH:MM:SS
101 -- mm/dd/yyyy
102--yyyy.mm.dd
103--dd/mm/yyyy
104--dd.mm.yyyy
*/
SELECT Id,CONVERT(varchar(10),Datetype,104)as castype,Name from EMPCAST-------hear only use convert why means its want style or format
