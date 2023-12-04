CREATE DATABASE IF NOT EXISTS PROYECTO;

USE PROYECTO;

CREATE TABLE IF NOT EXISTS AEROPUERTOS (
    ID_AEROPUERTO INT AUTO_INCREMENT NOT NULL,
    NOMBRE_AEROPUERTO TEXT NULL,
    CONSTRAINT PK_AEROPUERTO PRIMARY KEY (ID_AEROPUERTO)
);

CREATE TABLE IF NOT EXISTS AVIONES (
    ID_AVION INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_AVIONES PRIMARY KEY (ID_AVION),
    NOMBRE_AVION TEXT NULL,
    ID_AEROPUERTO INT NOT NULL,
    CONSTRAINT FK_AVION_AEROPUERTOS FOREIGN KEY (ID_AEROPUERTO) REFERENCES AEROPUERTOS (ID_AEROPUERTO)
);

CREATE TABLE IF NOT EXISTS CLIENTES (
    ID_CLIENTE INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_CLIENTES PRIMARY KEY (ID_CLIENTE),
    NOMBRE TEXT NULL,
    EMAIL TEXT NULL,
    PASS TEXT NULL,
    ID_AEROPUERTO INT NOT NULL,
    CONSTRAINT FK_CLIENTE_AEROPUERTOS FOREIGN KEY (ID_AEROPUERTO) REFERENCES AEROPUERTOS (ID_AEROPUERTO)
);

CREATE TABLE IF NOT EXISTS FORMAS_DE_PAGO (
    ID_FORMA_DE_PAGO INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_FORMAS_DE_PAGO PRIMARY KEY (ID_FORMA_DE_PAGO),
    NUMERO TEXT NULL,
    EXPIRACION TEXT NULL,
    CVV TEXT NULL,
    ID_CLIENTE INT NOT NULL,
    CONSTRAINT FK_FORMAS_DE_PAGO_CLIENTES FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE)
);

CREATE TABLE IF NOT EXISTS DESTINOS (
    ID_DESTINO INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_DESTINOS PRIMARY KEY (ID_DESTINO),
    NOMBRE TEXT NULL
);

CREATE TABLE IF NOT EXISTS VUELOS_DISPONIBLES (
    ID_VUELO_DISPONIBLE INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_VUELOS_DISPONIBLES PRIMARY KEY (ID_VUELO_DISPONIBLE),
    ID_PUNTO_DE_PARTIDA INT NULL,
    CONSTRAINT FK_PUNTOS_DE_PARTIDA_DESTINOS FOREIGN KEY (ID_PUNTO_DE_PARTIDA) REFERENCES DESTINOS (ID_DESTINO),
    ID_DESTINO INT NULL,
    CONSTRAINT FK_DESTINOS_DESTINOS FOREIGN KEY (ID_DESTINO) REFERENCES DESTINOS (ID_DESTINO),
    ID_AEROPUERTO INT NOT NULL,
    CONSTRAINT FK_VUELOS_DISPONIBLES_AEROPUERTOS FOREIGN KEY (ID_AEROPUERTO) REFERENCES AEROPUERTOS (ID_AEROPUERTO)
);

CREATE TABLE IF NOT EXISTS VUELOS (
    ID_VUELO INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_VUELOS PRIMARY KEY (ID_VUELO),
    NUMERO_DE_VUELO TEXT NULL,
    ID_AVION INT NOT NULL,
    CONSTRAINT FK_VUELO_AVIONES FOREIGN KEY (ID_AVION) REFERENCES AVIONES (ID_AVION),
    ID_PUNTO_DE_PARTIDA INT NULL,
    CONSTRAINT FK_PUNTO_DE_PARTIDA_DESTINOS FOREIGN KEY (ID_PUNTO_DE_PARTIDA) REFERENCES DESTINOS (ID_DESTINO),
    ID_DESTINO INT NULL,
    CONSTRAINT FK_DESTINO_DESTINOS FOREIGN KEY (ID_DESTINO) REFERENCES DESTINOS (ID_DESTINO)
);

CREATE TABLE IF NOT EXISTS COORDENADAS (
    ID_COORDENADA INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_COORDENADAS PRIMARY KEY (ID_COORDENADA),
    X INT NULL,
    Y INT NULL,
    Z INT NULL,
    ID_VUELO INT NOT NULL,
    CONSTRAINT FK_COORDENADAS_VUELOS FOREIGN KEY (ID_VUELO) REFERENCES VUELOS (ID_VUELO)
);

CREATE TABLE IF NOT EXISTS CLIENTE_has_VUELOS (
    ID_CLIENTE_HAS_VUELOS INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_CLIENTE_HAS_VUELOS PRIMARY KEY (ID_CLIENTE_HAS_VUELOS),
    ID_CLIENTE INT NOT NULL,
    CONSTRAINT FK_CLIENTE_CLIENTE_HAS_VUELOS FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE),
    ID_VUELO INT NOT NULL,
    CONSTRAINT FK_VUELO_CLIENTE_HAS_VUELOS FOREIGN KEY (ID_VUELO) REFERENCES VUELOS (ID_VUELO)
);

CREATE TABLE IF NOT EXISTS TIPOS_DE_VUELO (
    ID_TIPO_DE_VUELO INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_TIPOS_DE_VUELO PRIMARY KEY (ID_TIPO_DE_VUELO),
    NOMBRE TEXT NULL
);

CREATE TABLE IF NOT EXISTS RESERVACIONES (
    ID_RESERVACION INT AUTO_INCREMENT NOT NULL,
    CONSTRAINT PK_RESERVACIONES PRIMARY KEY (ID_RESERVACION),
    ID_CLIENTE INT NOT NULL,
    CONSTRAINT FK_RESERVACION_CLIENTES FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE),
    ID_VUELO INT NOT NULL,
    CONSTRAINT FK_RESERVACION_VUELOS FOREIGN KEY (ID_VUELO) REFERENCES VUELOS (ID_VUELO),
    ID_TIPO_DE_VUELO INT NOT NULL,
    CONSTRAINT FK_TIPO_DE_VUELO_RESERVACIONES FOREIGN KEY (ID_TIPO_DE_VUELO) REFERENCES TIPOS_DE_VUELO (ID_TIPO_DE_VUELO),
    ID_PUNTO_DE_PARTIDA INT NOT NULL,
    CONSTRAINT FK_PUNTO_DE_PARTIDA_RESERVACIONES FOREIGN KEY (ID_PUNTO_DE_PARTIDA) REFERENCES DESTINOS (ID_DESTINO),
    ID_DESTINO INT NOT NULL,
    CONSTRAINT FK_DESTINO_RESERVACIONES FOREIGN KEY (ID_DESTINO) REFERENCES DESTINOS (ID_DESTINO)
);
