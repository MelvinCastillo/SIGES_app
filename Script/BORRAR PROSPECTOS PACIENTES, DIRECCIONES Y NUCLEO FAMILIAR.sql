
--SELECT * INTO PAX00000_30052019 FROM PAX00000 
  SELECT * FROM PAX00001 WHERE   ROWSGXID = 'caid-stg'
    SELECT * FROM SMX00100 WHERE   ROWSGXID = 'caid-stg'

/*1. BUSCO LOS NUCLEO FAMILIAR*/
SELECT *  FROM PAX00001 WHERE   ROWSGXID = 'caid-stg'
 AND REFGUID IN
  (
SELECT ROWGUID FROM 
PAX00000 WHERE FULLNAME IN 
('MOIS�S DE JES�S RODR�GUEZ',
'PEDRO MANUEL SANCHEZ ALMONTE',
'JOSEPH FRANCISCO FAJARDO RODRIGUEZ',
'NAHIA ANYELINA CEPEDA NU�EZ',
'RANDOLPH JOEL BATISTA GONZALEZ',
'HENSEY DE JESUS TAVAREZ REINOSO',
'ROELVIS  REYES VENTURA',
'RAYSEL ALBERTO ARIAS FAMILIA',
'FRANCISCO JAVIER MEDINA HERASME',
'SAID  FERNANDEZ',
'CESAR AGUSTO CARBUCCIA MOREL',
'CRISTOFER RAFAEL GONZALEZ NU�EZ',
'ENYELIN YARLIN GONZALES GARCIA',
'JONATHAN AMAURIS CASTILLO HERNANDEZ',
'TULIO JAHZEEL RAMOS THOMAS',
'JAHDIEL EMILIO RAMOS THOMAS',
'JEMSY  TORIBIO INFANTE',
'CARLOS YADIEL CORONADO',
'JUAN ISMAEL DURAN JAVIER',
'YEURI ALEXANDER ALMANZAR LAMI',
'ELIAN DE JESUS GUTIERREZ PAULINO',
'JAIME DAVID SANTOS RODRIGUEZ',
'CARLOS ANTONIE PALACIOS CRUZ',
'JAIME MANUEL PERELLO MUSA',
'ANGEL LUIS GUZMAN POLANCO',
'MANUEL EMILIO JOAQUIN DIAZ',
'JOSUE  DIAZ GONZALEZ',
'SHERLYN MARIE GRULLON ACOSTA',
'ALISHA  CRUZ',
'JOHAN ALEJANDRO BEATO REYES',
'CAMILLE FIGUEROA GUZMAN',
'LUIS GERONIMO CABRERA',
'CARLOS DAVID PERALTA CUERVAS',
'KAYRA MICHELL ARIAS MARTINEZ',
'MIRANDA  PEREZ',
'MAYOLY OLIS TORRES',
'EVAN MAXWELL GUZMAN OVIEDO',
'DOMINIC DE JESUS RODRIGUEZ HIERRO',
'WESHLEY YADDIET VASQUEZ ACOSTA',
'SEBASTIAN  ROSARIO CRUZ',
'MAURICIO ENMANUEL ROSARIO CRUZ',
'WILBERT  FLETE ESPINAL',
'ALVIN  ROSARIO FERMIN',
'JOSE RAMON CRISSOSTOMO CAMILO',
'WILBERT JOSE ROMAN KHOURI',
'MAURICIO ADOLFO FLORES ACOSTA',
'JOSUE  ARIAS RUBIO',
'LISBETH  CESPEDES BATISTA',
'ISANDI DE JESUS LANFRANCO MORONTA',
'RAINIEL  ADAMES DE LA ROSA',
'ANGEL RAFAEL RODRIGUEZ PEREZ',
'FRANCISCO JAVIER HERASMO',
'DIXON JUNIOR OZORIA CORDERO',
'SULEINY DEL PILAR VARGAS DIAZ',
'RONEL  CESSE GONSALEZ',
'DILAN RAFAEL FARRA GUTIERREZ',
'BLEY MANUEL ABREU',
'AMIN ARTURO ESTEVEZ MEDINA',
'JOSELI  RAMIREZ RODRIGUEZ',
'SEBASTIAN EMILIO PEREZ LAUREANO',
'ENMANUEL  GARCIA TAVERAS',
'KEURY DE JESUS GOMEZ VALERIO',
'GIONEL� VILLAR BALDERA',
'JHOSWAN EMILIO RODRIGUEZ SANCHEZ')
AND RECORDID = 0
AND ROWSGXID = 'caid-stg'
)
/* 2. BUSCO LOS DIRECCIONES*/
SELECT * FROM SMX00100 WHERE   ROWSGXID = 'caid-stg'
 AND REFGUID IN
  (
SELECT ROWGUID FROM 
PAX00000 WHERE FULLNAME IN 
('MOIS�S DE JES�S RODR�GUEZ',
'PEDRO MANUEL SANCHEZ ALMONTE',
'JOSEPH FRANCISCO FAJARDO RODRIGUEZ',
'NAHIA ANYELINA CEPEDA NU�EZ',
'RANDOLPH JOEL BATISTA GONZALEZ',
'HENSEY DE JESUS TAVAREZ REINOSO',
'ROELVIS  REYES VENTURA',
'RAYSEL ALBERTO ARIAS FAMILIA',
'FRANCISCO JAVIER MEDINA HERASME',
'SAID  FERNANDEZ',
'CESAR AGUSTO CARBUCCIA MOREL',
'CRISTOFER RAFAEL GONZALEZ NU�EZ',
'ENYELIN YARLIN GONZALES GARCIA',
'JONATHAN AMAURIS CASTILLO HERNANDEZ',
'TULIO JAHZEEL RAMOS THOMAS',
'JAHDIEL EMILIO RAMOS THOMAS',
'JEMSY  TORIBIO INFANTE',
'CARLOS YADIEL CORONADO',
'JUAN ISMAEL DURAN JAVIER',
'YEURI ALEXANDER ALMANZAR LAMI',
'ELIAN DE JESUS GUTIERREZ PAULINO',
'JAIME DAVID SANTOS RODRIGUEZ',
'CARLOS ANTONIE PALACIOS CRUZ',
'JAIME MANUEL PERELLO MUSA',
'ANGEL LUIS GUZMAN POLANCO',
'MANUEL EMILIO JOAQUIN DIAZ',
'JOSUE  DIAZ GONZALEZ',
'SHERLYN MARIE GRULLON ACOSTA',
'ALISHA  CRUZ',
'JOHAN ALEJANDRO BEATO REYES',
'CAMILLE FIGUEROA GUZMAN',
'LUIS GERONIMO CABRERA',
'CARLOS DAVID PERALTA CUERVAS',
'KAYRA MICHELL ARIAS MARTINEZ',
'MIRANDA  PEREZ',
'MAYOLY OLIS TORRES',
'EVAN MAXWELL GUZMAN OVIEDO',
'DOMINIC DE JESUS RODRIGUEZ HIERRO',
'WESHLEY YADDIET VASQUEZ ACOSTA',
'SEBASTIAN  ROSARIO CRUZ',
'MAURICIO ENMANUEL ROSARIO CRUZ',
'WILBERT  FLETE ESPINAL',
'ALVIN  ROSARIO FERMIN',
'JOSE RAMON CRISSOSTOMO CAMILO',
'WILBERT JOSE ROMAN KHOURI',
'MAURICIO ADOLFO FLORES ACOSTA',
'JOSUE  ARIAS RUBIO',
'LISBETH  CESPEDES BATISTA',
'ISANDI DE JESUS LANFRANCO MORONTA',
'RAINIEL  ADAMES DE LA ROSA',
'ANGEL RAFAEL RODRIGUEZ PEREZ',
'FRANCISCO JAVIER HERASMO',
'DIXON JUNIOR OZORIA CORDERO',
'SULEINY DEL PILAR VARGAS DIAZ',
'RONEL  CESSE GONSALEZ',
'DILAN RAFAEL FARRA GUTIERREZ',
'BLEY MANUEL ABREU',
'AMIN ARTURO ESTEVEZ MEDINA',
'JOSELI  RAMIREZ RODRIGUEZ',
'SEBASTIAN EMILIO PEREZ LAUREANO',
'ENMANUEL  GARCIA TAVERAS',
'KEURY DE JESUS GOMEZ VALERIO',
'GIONEL� VILLAR BALDERA',
'JHOSWAN EMILIO RODRIGUEZ SANCHEZ')
AND RECORDID = 0
AND ROWSGXID = 'caid-stg'
)

/* BUSCO LOS PACIENTES */
SELECT *  FROM 
PAX00000 WHERE FULLNAME IN 
('MOIS�S DE JES�S RODR�GUEZ',
'PEDRO MANUEL SANCHEZ ALMONTE',
'JOSEPH FRANCISCO FAJARDO RODRIGUEZ',
'NAHIA ANYELINA CEPEDA NU�EZ',
'RANDOLPH JOEL BATISTA GONZALEZ',
'HENSEY DE JESUS TAVAREZ REINOSO',
'ROELVIS  REYES VENTURA',
'RAYSEL ALBERTO ARIAS FAMILIA',
'FRANCISCO JAVIER MEDINA HERASME',
'SAID  FERNANDEZ',
'CESAR AGUSTO CARBUCCIA MOREL',
'CRISTOFER RAFAEL GONZALEZ NU�EZ',
'ENYELIN YARLIN GONZALES GARCIA',
'JONATHAN AMAURIS CASTILLO HERNANDEZ',
'TULIO JAHZEEL RAMOS THOMAS',
'JAHDIEL EMILIO RAMOS THOMAS',
'JEMSY  TORIBIO INFANTE',
'CARLOS YADIEL CORONADO',
'JUAN ISMAEL DURAN JAVIER',
'YEURI ALEXANDER ALMANZAR LAMI',
'ELIAN DE JESUS GUTIERREZ PAULINO',
'JAIME DAVID SANTOS RODRIGUEZ',
'CARLOS ANTONIE PALACIOS CRUZ',
'JAIME MANUEL PERELLO MUSA',
'ANGEL LUIS GUZMAN POLANCO',
'MANUEL EMILIO JOAQUIN DIAZ',
'JOSUE  DIAZ GONZALEZ',
'SHERLYN MARIE GRULLON ACOSTA',
'ALISHA  CRUZ',
'JOHAN ALEJANDRO BEATO REYES',
'CAMILLE FIGUEROA GUZMAN',
'LUIS GERONIMO CABRERA',
'CARLOS DAVID PERALTA CUERVAS',
'KAYRA MICHELL ARIAS MARTINEZ',
'MIRANDA  PEREZ',
'MAYOLY OLIS TORRES',
'EVAN MAXWELL GUZMAN OVIEDO',
'DOMINIC DE JESUS RODRIGUEZ HIERRO',
'WESHLEY YADDIET VASQUEZ ACOSTA',
'SEBASTIAN  ROSARIO CRUZ',
'MAURICIO ENMANUEL ROSARIO CRUZ',
'WILBERT  FLETE ESPINAL',
'ALVIN  ROSARIO FERMIN',
'JOSE RAMON CRISSOSTOMO CAMILO',
'WILBERT JOSE ROMAN KHOURI',
'MAURICIO ADOLFO FLORES ACOSTA',
'JOSUE  ARIAS RUBIO',
'LISBETH  CESPEDES BATISTA',
'ISANDI DE JESUS LANFRANCO MORONTA',
'RAINIEL  ADAMES DE LA ROSA',
'ANGEL RAFAEL RODRIGUEZ PEREZ',
'FRANCISCO JAVIER HERASMO',
'DIXON JUNIOR OZORIA CORDERO',
'SULEINY DEL PILAR VARGAS DIAZ',
'RONEL  CESSE GONSALEZ',
'DILAN RAFAEL FARRA GUTIERREZ',
'BLEY MANUEL ABREU',
'AMIN ARTURO ESTEVEZ MEDINA',
'JOSELI  RAMIREZ RODRIGUEZ',
'SEBASTIAN EMILIO PEREZ LAUREANO',
'ENMANUEL  GARCIA TAVERAS',
'KEURY DE JESUS GOMEZ VALERIO',
'GIONEL� VILLAR BALDERA',
'JHOSWAN EMILIO RODRIGUEZ SANCHEZ')
AND RECORDID = 0
AND ROWSGXID = 'caid-stg'