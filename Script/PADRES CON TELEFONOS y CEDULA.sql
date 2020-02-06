 
SELECT	P.RECORDID,
		P.FULLNAME AS NOMBREPACIENTE,  
		NOMBRECOMPLETO = m.FULLNAME,
		PARENTESCO = d.NOMBRE,
		EDAD = DATEDIFF(YEAR,M.FNACE,GETDATE()),
		SEXO = d.SEXOID 
,M.CEDULAID AS CEDULA,
 FORMAT(M.FNACE,'dd/MM/yyyy') AS FNACE 
 ,T.TEL1	, T.TEL2	, T.TEL3	,T.TEL4 		
FROM	[PAX00001] m
		LEFT JOIN SMX30003 d ON (m.FILIACIONID = d.ROWGUID AND m.ROWSGXID = d.ROWSGXID)	
		LEFT JOIN SMX30015 es ON (m.ESCOLARIDADID = es.ROWGUID)	
		INNER JOIN PAX00000 P ON  M.REFGUID = P.ROWGUID AND M.ROWSGXID = P.ROWSGXID 
	    LEFT JOIN SMX00100 T ON T.REFGUID = P.ROWGUID AND T.ROWSGXID = P.ROWSGXID		
WHERE	-- m.REFGUID		= @REFGUID AND 
m.ROWSGXID	= 'CAID-SD'
AND m.FULLNAME <> ''
AND P.RECORDID > 0 
ORDER	BY P.RECORDID 


select * from SMX00100

exec SMX00100S3 @REFGUID=N'CAID-SD-00001',@ROWSGXID=N'CAID-SD'
