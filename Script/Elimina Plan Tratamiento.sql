
-- select ROWGUID from HCX00300 where ROWSGXID = 'CAID-SD' and especilidadguid = '6018C880-53FF-4DF6-922F-8A799D0A0C87' order by nombre
-- select * into HCX00300_D_back17102017 from HCX00300_D
-- SELECT * FROM SGX00100 WHERE ROWGUID IN  ('001-1880295-8', '4971E0DE-7ED6-4921-81FF-E02B167012DC')
-- SELECT * FROM PAX00000 WHERE FULLNAME LIKE '%SEBAST%MEDO%'
 
select *  from   HCX00300_D  where rowsgxid = 'CAID-SD' and 
OBJID in (select ROWGUID from HCX00300 where ROWSGXID = 'CAID-SD' and especilidadguid = '6018C880-53FF-4DF6-922F-8A799D0A0C87')
AND NOMBRE IN ('zanahoria','zapato','vaso','u','tronco','Tenedor','Taza','tambor','taco','tableta','silla','radio','pulpo','Plato','Pelotas-PECS','Pelota','papa','palomitas-PECS',
'palomitas','palo','o','microfono-PECS','microfono','mickey mouse','mesa','llave','lla-llave','Libro','Lapicero','La niña','gato','galleta-PECS','galleta','Figuras Geométricas','dos','dinosaurio','carro',
'Carro-PECS','confle','cubo','Cuchara','cuchara','Cuchillo','burbujas','bloque','a','5 Bloques','"Toca" DOCTOR','"Toca" COCINERO','"Toca" BOMBERO')
ORDER BY nombre

select *  from   HCX00300_D  where rowsgxid = 'CAID-SD' and 
OBJID in (select ROWGUID from HCX00300 where ROWSGXID = 'CAID-SD' and especilidadguid = '6018C880-53FF-4DF6-922F-8A799D0A0C87')
AND NOMBRE IN ( 'gallina')



 