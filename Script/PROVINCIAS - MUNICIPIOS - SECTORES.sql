use cenasi
GO

-- provincia
select * from SMX00002 where ROWGUID = '0ECCD124-A4C1-4E69-934F-3681ED141092'


-- municipio
select * from SMX00003 where  provinciaid= '0ECCD124-A4C1-4E69-934F-3681ED141092'

-- sectores
select * from SMX00004 where  MUNICIPIOID ='0ECCD124-A4C1-4E69-934F-3681ED141092'


select * from SMX00002 PROV, SMX00003 MUN , SMX00004 SECT WHERE PROV.ROWGUID = MUN.PROVINCIAID AND MUN.ROWGUID = SECT.MUNICIPIOID


SELECT * FROM SMX00003