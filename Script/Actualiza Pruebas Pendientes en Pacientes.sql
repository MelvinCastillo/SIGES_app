
declare @centro varchar(20) = 'CAID-SD'

--2. hago un select de la data ------------------------------------------------------------
select px.estatuspruebaspendientes AS A , px.DetalledePruebas, pp.[pruebas pendientes], * from pax00000  Px, Pruebaspendientes1 pp 
where px.ROWSGXID = @centro
and px.RECORDID = pp.[exp#]
ORDER BY estatuspruebaspendientes DESC

--3. actualizo la informacion--------------------------------------------
update px set  px.estatuspruebaspendientes = 'PENDIENTE PRUEBAS MEDICAS' , 
	           px.DetalledePruebas =  pp.[pruebas pendientes]
from pax00000  Px, Pruebaspendientes1 pp 
where px.ROWSGXID = @centro
and px.RECORDID = pp.[exp#]
