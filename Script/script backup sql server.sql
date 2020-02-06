use master
go

ALTER DATABASE CAID
SET SINGLE_USER WITH
ROLLBACK IMMEDIATE
 
----Restore Database
RESTORE DATABASE CAID
FROM DISK = 'C:\CAIDDEV\DB\CAID_backup.bak'
 WITH REPLACE,
  MOVE 'CAID' TO 'C:\CAID\Data\CAID.mdf',
MOVE 'CAID_log' TO 'C:\CAID\Data\CAID.ldf'
 
/*If there is no error in statement before database will be in multiuser
mode.
If error occurs please execute following command it will convert
database in multi user.*/
ALTER DATABASE CAID SET MULTI_USER
GO