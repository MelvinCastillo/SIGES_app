 

SELECT	
		m.ROWSGXID,
		m.REFGUID,
        v.RECORDID, 
		 v.FULLNAME
		,COUNT(M.REFGUID) AS CANT 
FROM	[PAX00001] m 
		inner join vpaciente v on v.idpaciente = m.REFGUID and v.rowsgxid = m.ROWSGXID
  where v.recordid > 0 AND M.ROWSGXID = 'CAID-SD'
  GROUP BY m.ROWSGXID,m.REFGUID,v.RECORDID,  v.FULLNAME
  HAVING COUNT(m.REFGUID) = 1 
-- ORDER	BY m.ROWSGXID,V.RECORDID
UNION 
SELECT  ROWSGXID,
		ROWGUID REFGUID,
        RECORDID, 
		FULLNAME
		,0 AS CANT FROM vPaciente WHERE recordid > 0 AND ROWGUID NOT IN (SELECT  REFGUID FROM PAX00001)
AND ROWSGXID = 'CAID-SD'
ORDER	BY ROWSGXID,CANT, RECORDID

 