alter  VIEW vPacienteTodosAdmisiones
as

select distinct top 100 percent 
p.RECORDID, 
p.fullname as NOMBRE , 
p.ROWSGXID AS CENTRO, 
a.FechaAdmision, 
p.ROWCDTE FECHA_ADMISION, 
EDAD,
SEXOID AS SEXO, 
ISNULL(ESTATUSDESCRIPCION,'N/D') AS ESTATUS, 
PROVINCIA AS PROCEDENCIA, 
PREDIAGNOSTICODESCRIPCION AS PREDIAGNOSTICO

from vPacienteTodos p left join  VPacienteAdmisiones a on 
  a.recordid = p.recordid and a.ROWSGXID = p.ROWSGXID
where p.recordid >0 
 order by    P.ROWSGXID , P.RECORDID
  GO 

-- SELECT * FROM vPacienteTodos

select * from vPacienteTodosAdmisiones V order by  V.CENTRO ,V.RECORDID

-- género, edad, estatus, procedencia y diagnóstico 
