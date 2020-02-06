
select * from SGX00001 order by rowcdte desc

-- 1. crear la opcion por el sistema
-- 2 actualizar el campo opcionurl
update SGX00001 set opcionurl = 'http://caidsiges01:8082/forms/TardanzasyAusencias2.aspx?LOCALIDAD=' where rowguid ='BA6035C4-0675-488C-A78F-41EECA1A043D'

-- 3 modicar este sp 
exec SGX00001S3 @ROWSGXID=N'CAID-SD',@MNUTYPE=N'TOP',@USERID=N'64C361FA-686D-4714-ACE2-028E4A3C1F25'
-- editar el sp SGX00001S3 y modifcarlo 

--4. darle acceso a los usuarios




