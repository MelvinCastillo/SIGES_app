
-- 1. admitir los prospectos por la pantalla de prospectos

-- 2. asignar los numeros de records 
select p.*   from PAX00000 p   where p.fullname like '%LARCIER DIAZ%'
 
 -- 3. actualizar los numeros de records en tabla PAX00300 y en el campo nombre 
 -- ponerle el fullname del paciente

select * from PAX00300 where   refguid in ( 
'385B2ED1-C3DC-4B72-BFBE-1956C3D5E1AF',
'B04CF97E-7EFC-4616-BD88-816716C277A9')

-- 4. revisar con este query

select p.*,pa.*  from PAX00000 p , PAX00300 pa where p.fullname like '%LARCIER DIAZ%'
and pa.REFGUID = p.ROWGUID and p.ROWSGXID = pa.ROWSGXID