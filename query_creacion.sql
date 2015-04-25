--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      GERMAN
-- Project :      DB1-PRACICA4.dm1
-- Author :       GERMAN
--
-- Date Created : Friday, April 24, 2015 15:21:15
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: ASIENTO 
--

CREATE TABLE ASIENTO(
    asiento    INT    NOT NULL,
    bus        INT    NOT NULL,
    PRIMARY KEY (asiento, bus)
)ENGINE=INNODB
;



-- 
-- TABLE: BUS 
--

CREATE TABLE BUS(
    bus         INT            NOT NULL,
    modelo      VARCHAR(50),
    tipo_bus    INT            NOT NULL,
    PRIMARY KEY (bus)
)ENGINE=INNODB
;



-- 
-- TABLE: FACTURA 
--

CREATE TABLE FACTURA(
    factura    INT     NOT NULL,
    fecha      DATE,
    NIT        INT,
    total      INT,
    usuario    INT     NOT NULL,
    PRIMARY KEY (factura)
)ENGINE=INNODB
;



-- 
-- TABLE: PUNTO 
--

CREATE TABLE PUNTO(
    punto       INT            NOT NULL,
    latitud     INT,
    longitud    INT,
    nombre      VARCHAR(50),
    precio      INT,
    PRIMARY KEY (punto)
)ENGINE=INNODB
;



-- 
-- TABLE: PUNTOXRUTA 
--

CREATE TABLE PUNTOXRUTA(
    ruta     INT    NOT NULL,
    punto    INT    NOT NULL,
    PRIMARY KEY (ruta, punto)
)ENGINE=INNODB
;



-- 
-- TABLE: RUTA 
--

CREATE TABLE RUTA(
    ruta      INT            NOT NULL,
    nombre    VARCHAR(50),
    PRIMARY KEY (ruta)
)ENGINE=INNODB
;



-- 
-- TABLE: TICKET 
--

CREATE TABLE TICKET(
    ticket     INT            NOT NULL,
    estado     VARCHAR(10),
    asiento    INT            NOT NULL,
    bus        INT            NOT NULL,
    viaje      INT            NOT NULL,
    punto      INT            NOT NULL,
    puntof     INT            NOT NULL,
    factura    INT            NOT NULL,
    PRIMARY KEY (ticket)
)ENGINE=INNODB
;



-- 
-- TABLE: TIPO_BUS 
--

CREATE TABLE TIPO_BUS(
    tipo_bus     INT            NOT NULL,
    nombre       VARCHAR(50),
    capacidad    INT,
    PRIMARY KEY (tipo_bus)
)ENGINE=INNODB
;



-- 
-- TABLE: USUARIO 
--

CREATE TABLE USUARIO(
    usuario     INT             NOT NULL,
    nombre      VARCHAR(100),
    rol         VARCHAR(7),
    correo      VARCHAR(20),
    pass        VARCHAR(20),
    telefono    INT,
    PRIMARY KEY (usuario)
)ENGINE=INNODB
;



-- 
-- TABLE: VIAJE 
--

CREATE TABLE VIAJE(
    viaje    INT     NOT NULL,
    fecha    DATE,
    ruta     INT     NOT NULL,
    PRIMARY KEY (viaje)
)ENGINE=INNODB
;



-- 
-- TABLE: ASIENTO 
--

ALTER TABLE ASIENTO ADD CONSTRAINT RefBUS3 
    FOREIGN KEY (bus)
    REFERENCES BUS(bus)
;


-- 
-- TABLE: BUS 
--

ALTER TABLE BUS ADD CONSTRAINT RefTIPO_BUS4 
    FOREIGN KEY (tipo_bus)
    REFERENCES TIPO_BUS(tipo_bus)
;


-- 
-- TABLE: FACTURA 
--

ALTER TABLE FACTURA ADD CONSTRAINT RefUSUARIO12 
    FOREIGN KEY (usuario)
    REFERENCES USUARIO(usuario)
;


-- 
-- TABLE: PUNTOXRUTA 
--

ALTER TABLE PUNTOXRUTA ADD CONSTRAINT RefRUTA1 
    FOREIGN KEY (ruta)
    REFERENCES RUTA(ruta)
;

ALTER TABLE PUNTOXRUTA ADD CONSTRAINT RefPUNTO2 
    FOREIGN KEY (punto)
    REFERENCES PUNTO(punto)
;


-- 
-- TABLE: TICKET 
--

ALTER TABLE TICKET ADD CONSTRAINT RefASIENTO6 
    FOREIGN KEY (asiento, bus)
    REFERENCES ASIENTO(asiento, bus)
;

ALTER TABLE TICKET ADD CONSTRAINT RefVIAJE7 
    FOREIGN KEY (viaje)
    REFERENCES VIAJE(viaje)
;

ALTER TABLE TICKET ADD CONSTRAINT RefPUNTO8 
    FOREIGN KEY (punto)
    REFERENCES PUNTO(punto)
;

ALTER TABLE TICKET ADD CONSTRAINT RefPUNTO10 
    FOREIGN KEY (puntof)
    REFERENCES PUNTO(punto)
;

ALTER TABLE TICKET ADD CONSTRAINT RefFACTURA11 
    FOREIGN KEY (factura)
    REFERENCES FACTURA(factura)
;


-- 
-- TABLE: VIAJE 
--

ALTER TABLE VIAJE ADD CONSTRAINT RefRUTA5 
    FOREIGN KEY (ruta)
    REFERENCES RUTA(ruta)
;


