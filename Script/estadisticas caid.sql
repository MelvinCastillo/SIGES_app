-- 1. atenciones por centro y anio 

	SELECT	  C.ROWSGXID as centro, 
	         year(C.ROWCDTE) as anio ,
			 COUNT (*) AS contador 
    FROM HCL00000 C

    INNER JOIN SGX00100 T ON T.TERID = C.TERGUID

    INNER JOIN PAX00000 P ON P.ROWGUID = C.REFGUID
GROUP BY C.ROWSGXID  ,  year(C.ROWCDTE) 
 

-- 2. facturado por centro y anio

	 
