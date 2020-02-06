DECLARE @SERVICIO_ID VARCHAR(100) = 'CAID-SD-HISCL-08' -- ATENCION TEMPRANA
-- inserta los objectivos de ATENCION TEMPRANA de santo domingo a san juan

INSERT INTO HCX00310
 (CODIGOID, NOMBRE, SERVICIOID, ROWGUID, ROWCDTE,  ROWUSERID, ROWSGXID)
	SELECT
		CODIGOID
	   ,NOMBRE
	   ,SERVICIOID
	   ,'AT_SJ_'+ROWGUID -- NEWID()
	   ,GETDATE() 
	   ,ROWUSERID
	   ,'CAID-SJ' 
	FROM HCX00310
	WHERE SERVICIOID = @SERVICIO_ID AND ROWSGXID = 'CAID-SD'
	ORDER BY ROWIDX

-- inserta las actividades de Apoyo psicopedagogico de santo domingo a san juan
insert into HCX00311
(CODIGOID,NOMBRE ,OBJETIVOID ,rowguid ,rowcdte ,rowmdte ,ROWUSERID ,ROWSGXID ,CRITERIO ,ESTADO)
	SELECT   
		ACT.CODIGOID
	   ,ACT.NOMBRE
	   ,'AT_SJ_'+ACT.OBJETIVOID
	   --, ROWIDXV
	   ,NEWID()
	   ,GETDATE()
	   ,GETDATE()
	   ,ACT.ROWUSERID
	   ,'CAID-SJ'
	   ,ACT.CRITERIO
	   ,ACT.ESTADO
	FROM HCX00311 ACT 

	WHERE   ACT.OBJETIVOID IN (SELECT
			rowguid
		FROM HCX00310
		WHERE SERVICIOID = @SERVICIO_ID AND ROWSGXID = 'CAID-SD')
		order by ACT.ROWIDX
