
DECLARE @NO VARCHAR(50) ='5E4F5304-DC05-409B-AED1-47FA84611CE7'
DECLARE @ROWSGXID VARCHAR(50) ='CAID-SD'

DELETE  FROM PAX00000   WHERE ROWSGXID=@ROWSGXID AND ROWGUID=@NO
DELETE  FROM PAX00300   WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00000_A WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00000_DEALTA WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00000_F WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00001_L WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00001_S WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00100   WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00100_G WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00100_M WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00100_P WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00100_R WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00101   WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00101_R WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00102   WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00200   WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00300   WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00400   WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00700   WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
DELETE  FROM PAX00001   WHERE ROWSGXID=@ROWSGXID  AND ROWGUID=@NO
-- SELECT ROWGUID,*   FROM PAX00000 WHERE ROWSGXID=@ROWSGXID AND RECORDID= 1

 SELECT ROWGUID,*   FROM PAX00000 where fullname like '%SAHIRA LISBETH FRANJUL MILANES%'


