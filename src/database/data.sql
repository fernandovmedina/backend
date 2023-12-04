INSERT INTO AEROPUERTOS(NOMBRE_AEROPUERTO)VALUES("A E R O T E C");

INSERT INTO AVIONES(ID_AEROPUERTO,NOMBRE_AVION)VALUES(1,"AX-109"),(1,"MG-890"),(1,"XZ-728"),(1,"WA-748"),(1,"ZN-839");

INSERT INTO CLIENTES(ID_AEROPUERTO,NOMBRE,EMAIL,PASS)VALUES(1,"Fernando Vazquez","fernandomedina.fvm@gmail.com","Medina_04f");

INSERT INTO DESTINOS(NOMBRE)VALUES("Saltillo, Coahuila"),("Monterrey, Nuevo Leon"),("Guadalajara, Jalisco"),("Cancun, Quintana Roo"),("La Paz, Baja California"),("Mazatlan, Sinaloa"),("CDMX"),("Queretaro, Mexico");

INSERT INTO TIPOS_DE_VUELO(NOMBRE)VALUES("Solo ida"),("Ida");

INSERT INTO VUELOS_DISPONIBLES(ID_AEROPUERTO,ID_PUNTO_DE_PARTIDA,ID_DESTINO,FECHA)VALUES(1,2,5,'12/07/2023'),(1,1,3,'12/05/2023'),(1,4,6,'12/04/2023'),(1,5,8,'12/06/2023'),(1,3,1,'12/07/2023'),(1,6,2,'12/03/2023'),(1,7,4,'12/08/2023'),(1,8,7,'12/09/2023');