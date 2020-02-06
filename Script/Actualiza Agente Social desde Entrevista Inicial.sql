select P.FULLNAME,  p.AGENTSOCIALID, U.NOMBRE 
  FROM PAX00000 P , PAX00102 ENTREVISTAINICIAL  , SGX00100 U
  WHERE   ENTREVISTAINICIAL.ROWUSERID = U.ROWGUID AND ENTREVISTAINICIAL.ROWSGXID = U.ROWSGXID AND 
ENTREVISTAINICIAL.REFGUID = P.ROWGUID 
AND P.ROWSGXID = ENTREVISTAINICIAL.ROWSGXID
AND ISNULL(p.AGENTSOCIALID,'') = ''
AND P.ROWSGXID='CAID-SJ' 

UPDATE P SET P.AGENTSOCIALID = U.NOMBRE
  FROM PAX00000 P , PAX00102 ENTREVISTAINICIAL  , SGX00100 U
  WHERE   ENTREVISTAINICIAL.ROWUSERID = U.ROWGUID AND ENTREVISTAINICIAL.ROWSGXID = U.ROWSGXID AND 
ENTREVISTAINICIAL.REFGUID = P.ROWGUID 
AND P.ROWSGXID = ENTREVISTAINICIAL.ROWSGXID
AND ISNULL(p.AGENTSOCIALID,'') = ''
AND P.ROWSGXID='CAID-SD' 