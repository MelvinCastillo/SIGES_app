 
select ROWGUID,* from PAX00000 where RECORDID in (491,928) and ROWSGXID='CAID-STG'
HCL00000R2 @REFGUID = 'CAID-SD-00491', @ESPGUID	='', @FECHA1 = '', @FECHA2 = '', @NODO = 'CE_ING'
SP_HELPTEXT 'HCL00000R2'

SELECT * FROM PAX00000 WHERE ROWGUID  = 'C250B78D-039C-4BBE-9D53-826BD98B6768' AND ROWSGXID ='CAID-STG'
SELECT * FROM PAX00000 WHERE FULLNAME = 'ADRIAN ESTEBAN VALDEZ BREA' 
SELECT ROWGUID,REFGUID, * FROM HCL00000 WHERE REFGUID = 'C250B78D-039C-4BBE-9D53-826BD98B6768' AND ROWSGXID ='CAID-STG'
 
UPDATE HCL00000 SET REFGUID ='56EA86FB-9708-422D-B248-EE547DCE4906' WHERE REFGUID = 'C250B78D-039C-4BBE-9D53-826BD98B6768' AND ROWSGXID ='CAID-STG'
