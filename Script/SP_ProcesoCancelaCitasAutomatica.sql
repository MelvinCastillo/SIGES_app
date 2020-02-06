
alter procedure SP_ProcesoCancelaCitasAutomatica
as

begin
 declare @fecha date = ''

--select 
--convert(datetime,RIGHT(CONVERT(VARCHAR, GETDATE(), 100),7)) , 
--convert(datetime,RIGHT(CONVERT(VARCHAR, HORAINI, 100),7)) ,
--DateADD(mi, -15, HORAINI), 
--horaini as prueba,

--* from SMX00500 where CITAESTATUS !=2
--and 
-- (CONVERT(DATETIME,CONVERT(VARCHAR,FECHAINI ,101)) < CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),101)))
--and FECHAINI =@fecha
--and convert(datetime,RIGHT(CONVERT(VARCHAR, GETDATE(), 100),7))  > convert(datetime,RIGHT(CONVERT(VARCHAR, HORAINI, 100),7))
--and REFGUID not in ( select  REFGUID from FTX00000 where cast(rowcdte as date) = cast(@fecha as date))
 
 update  SMX00500 set CITAESTATUS = 2, DETAUSENCIATERAPEUTA = 'CANCELADA AUTOMATICAMENTE POR EL SISTEMA'
  where CITAESTATUS !=2 and 
 (CONVERT(DATETIME,CONVERT(VARCHAR,FECHAINI ,101)) = CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),101)))
and convert(datetime,RIGHT(CONVERT(VARCHAR, GETDATE(), 100),7))  > DateADD(mi, -15, HORAINI)
and REFGUID not in ( select  REFGUID from FTX00000 where cast(rowcdte as date) = cast(GETDATE() as date))
and FECHAINI =@fecha
 end

 
