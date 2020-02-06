-- SGX00000RG 	@ROWSGXID = 'CAID-SD', @USRID = '64C361FA-686D-4714-ACE2-028E4A3C1F25',@FECHA1='01/01/2016', @FECHA2='07/12/2018', @TYPE= 'Prediagnostico'
-- sp_helptext 'SGX00000RG'


SELECT
	S.NOMBRE AS CENTRO
   ,CASE
		WHEN DATEDIFF(YEAR, FNACE, GETDATE()) <= 5 THEN 'Edad 0 a 05 A�os'
		WHEN DATEDIFF(YEAR, FNACE, GETDATE()) >= 6 AND
			 DATEDIFF(YEAR, FNACE, GETDATE()) <= 10 THEN 'Edad 6 a 10 A�os'
		ELSE 'Mayor de 10 A�os'
	END EDADES,
	CASE ISNULL(P.SEXOID,'')
	WHEN  'F' THEN 'FEMENINO'
	WHEN  'M' THEN 'MASCULINO'
	WHEN  '' THEN 'N/A'
	END AS SEXO
   ,N.NOMBRE AS DATO
   ,COUNT(P.FULLNAME) AS VALOR
FROM PAX00000 P

INNER JOIN PAX00700 N
	ON P.PREDIAGNOSTICO = N.ROWGUID
INNER JOIN SGX00000 S
	ON P.ROWSGXID = S.ROWGUID

WHERE P.ROWCDTE BETWEEN CONVERT(DATETIME, CONVERT(VARCHAR(10), '01/01/2016', 101)) AND CONVERT(DATETIME, CONVERT(VARCHAR(10), '07/12/2018', 101)) + ' 23:59:59'
AND P.RECORDID > 0
AND N.NOMBRE = 'TEA'
GROUP BY S.NOMBRE
		,N.NOMBRE
		,CASE
		WHEN DATEDIFF(YEAR, FNACE, GETDATE()) <= 5 THEN 'Edad 0 a 05 A�os'
		WHEN DATEDIFF(YEAR, FNACE, GETDATE()) >= 6 AND
			 DATEDIFF(YEAR, FNACE, GETDATE()) <= 10 THEN 'Edad 6 a 10 A�os'
		ELSE 'Mayor de 10 A�os'
	END,
	CASE ISNULL(P.SEXOID,'')
	WHEN  'F' THEN 'FEMENINO'
	WHEN  'M' THEN 'MASCULINO'
	WHEN  '' THEN 'N/A'
	END

ORDER BY S.NOMBRE, N.NOMBRE 


 