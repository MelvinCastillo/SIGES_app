
   SELECT *   FROM PAX00000 where RECORDID = 2882  

  DECLARE @REFGUID VARCHAR(100) = (SELECT ROWGUID   FROM PAX00000 where RECORDID = 2882 )
  DECLARE @ROWSGXID VARCHAR(20) = 'CAID-SD'

  SELECT ROWGUID,* FROM PAX00000 WHERE ROWGUID = @REFGUID
  SELECT * FROM PAX00300 WHERE REFGUID = @REFGUID AND ROWSGXID = @ROWSGXID
  SELECT * FROM PAX00300 WHERE REFGUID = @REFGUID AND ROWSGXID = @ROWSGXID
  SELECT * FROM HCX00300 WHERE REFGUID = @REFGUID AND [ESPECILIDADGUID]  IN ('CAID-SD-HISCL-01','CAID-SD-HISCL-03','CAID-SD-HISCL-05','CAID-SD-HISCL-16','CAID-SD-HISCL-09','1F8CAC37-0F91-4FB2-8D74-063AF752E712') AND ROWSGXID = @ROWSGXID
  SELECT * FROM HCX00300_D WHERE OBJID  IN  (SELECT OBJETIVOGUID FROM HCX00300 WHERE REFGUID = @REFGUID AND [ESPECILIDADGUID] IN  ('CAID-SD-HISCL-01','CAID-SD-HISCL-03','CAID-SD-HISCL-05','CAID-SD-HISCL-16','CAID-SD-HISCL-09','1F8CAC37-0F91-4FB2-8D74-063AF752E712') AND ROWSGXID = @ROWSGXID) AND ROWSGXID = @ROWSGXID

  /*
  DELETE FROM PAX00000 WHERE ROWGUID = @REFGUID
  DELETE FROM PAX00300 WHERE REFGUID = @REFGUID AND ROWSGXID = @ROWSGXID
  DELETE FROM PAX00300 WHERE REFGUID = @REFGUID AND ROWSGXID = @ROWSGXID
  DELETE FROM HCX00300 WHERE REFGUID = @REFGUID AND [ESPECILIDADGUID]  IN ('CAID-SD-HISCL-01','CAID-SD-HISCL-03','CAID-SD-HISCL-05','CAID-SD-HISCL-16','CAID-SD-HISCL-09','1F8CAC37-0F91-4FB2-8D74-063AF752E712') AND ROWSGXID = @ROWSGXID
  DELETE FROM HCX00300_D WHERE OBJID  IN  (SELECT OBJETIVOGUID FROM HCX00300 WHERE REFGUID = @REFGUID AND [ESPECILIDADGUID] IN  ('CAID-SD-HISCL-01','CAID-SD-HISCL-03','CAID-SD-HISCL-05','CAID-SD-HISCL-16','CAID-SD-HISCL-09','1F8CAC37-0F91-4FB2-8D74-063AF752E712') AND ROWSGXID = @ROWSGXID) AND ROWSGXID = @ROWSGXID
  DELETE FROM PAX00001  WHERE REFGUID = @REFGUID AND ROWSGXID = @ROWSGXID
  DELETE FROM SMX00100  WHERE REFGUID = @REFGUID AND ROWSGXID = @ROWSGXID
  */

  SELECT * FROM PAX00001
    SELECT * FROM SMX00100
