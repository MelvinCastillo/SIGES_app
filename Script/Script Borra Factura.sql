
USE CAID
GO

DECLARE @ROWSGXID  VARCHAR(50) = 'CAID-STG' 
DECLARE @NUMERO VARCHAR(50)    = 'FT014193'

DECLARE @FACTURAID VARCHAR(50) 

SELECT @FACTURAID= ROWGUID  FROM  	FTX00000 M WHERE ROWSGXID =@ROWSGXID   AND  NUMERO = @NUMERO

PRINT @FACTURAID

SELECT * FROM  	FTX00000_D M WHERE ROWSGXID = @ROWSGXID   AND  FACTURAID = @FACTURAID


DELETE  FROM 	FTX00000  WHERE ROWSGXID =@ROWSGXID   AND  NUMERO = @NUMERO
DELETE FROM  	FTX00000_D WHERE ROWSGXID = @ROWSGXID   AND  FACTURAID = @FACTURAID

 