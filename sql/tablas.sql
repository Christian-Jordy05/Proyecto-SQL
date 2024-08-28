-- Active: 1724794029309@@127.0.0.1@3306@hoteles
create DATABASE hoteles;

DROP DATABASE hoteles;

use hoteles;


-------------------------------------CLients--------------------------------

CREATE TABLE Clientes (
    ID_Cliente VARCHAR(50) NOT NULL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Telefono VARCHAR(20) NOT NULL
);



---------------------------------Reservas

CREATE TABLE reservas (
    ID_Reserva INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente VARCHAR(50),
    ID_Hotel VARCHAR(50),
    ID_Habitacion VARCHAR(50),
    Fecha_Entrada DATE NOT NULL,
    Fecha_Salida DATE NOT NULL,
    Fecha_Creacion DATE NOT NULL,
    estado_reservas VARCHAR(50) NOT NULL,
    ID_Pago INT,
    FOREIGN KEY (ID_Cliente) REFERENCES clientes (ID_Cliente),
    FOREIGN KEY (ID_Hotel) REFERENCES hotel (ID_Hotel),
    FOREIGN KEY (ID_Habitacion) REFERENCES habitacion (ID_Habitacion),
    FOREIGN KEY (ID_Pago) REFERENCES metodo_pago (ID_Pago)
);

DROP TABLE reservas;

--------------------------- metodos de pago ----------------------------------------------------------
CREATE TABLE Metodo_Pago (
    ID_Pago INT NOT NULL PRIMARY KEY,
    Nombre_Pago VARCHAR(50) NOT NULL
);


----------------------------------------------------------------hoteles----------------------------------------------------------------
CREATE TABLE Hotel (
    ID_hotel VARCHAR(50) NOT NULL PRIMARY KEY,
    nombre_hotel VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    estrellas VARCHAR(50) NOT NULL,
    servicio VARCHAR(120)
);
----------------------------------------------------------------habitaciones----------------------------------------------------------------

CREATE TABLE habitacion (
    ID_Habitacion VARCHAR(50) NOT NULL PRIMARY KEY,
    ID_Hotel VARCHAR(50) NOT NULL,
    ID_Tipo INT NOT NULL,
    num_habitacion VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    reservada VARCHAR(50) DEFAULT 'Disponible',
    FOREIGN KEY (ID_Hotel) REFERENCES Hotel (ID_Hotel),
    FOREIGN KEY (ID_Tipo) REFERENCES tipo_habitacion (ID_Tipo)
);



----------------------------------------------------------------tipo de habitacion----------------------------------------------------------------
CREATE TABLE tipo_habitacion (
    ID_Tipo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

















