-- Active: 1724724684814@@127.0.0.1@3306@hoteles

USE hoteles;

DELIMITER //
CREATE PROCEDURE consultar_disponibilidad(IN fecha DATE, IN hotel VARCHAR(50))
BEGIN
    SELECT num_habitacion 
        FROM habitacion
    WHERE habitacion.ID_Hotel = hotel AND NOT EXISTS (
        SELECT NULL
            FROM reservas
        WHERE habitacion.ID_Habitacion = ID_Habitacion AND fecha BETWEEN reservas.Fecha_Entrada AND reservas.Fecha_Salida
    );
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE cambiar_estado_reserva(IN reserva_id INT, IN nuevo_estado VARCHAR(50))
BEGIN
    UPDATE reservas
    SET estado_reservas = nuevo_estado
    WHERE reservas.ID_Reserva = reserva_id AND reservas.estado_reservas != nuevo_estado;
END //
DELIMITER ;

CALL cambiar_estado_reserva(5, "Cancelada");

CALL consultar_disponibilidad("2024-09-09", "H001")

--------------------------------------------------------------1----------------------------------------------- 

DELIMITER //

CREATE PROCEDURE agregar_reserva(
    IN p_ID_Cliente VARCHAR(50),
    IN p_ID_Hotel VARCHAR(50),
    IN p_ID_Habitacion VARCHAR(50),
    IN p_Fecha_Entrada DATE,
    IN p_Fecha_Salida DATE,
    IN p_Fecha_Creacion DATE,
    IN p_ID_Pago INT
)
BEGIN
    INSERT INTO reservas (ID_Cliente, ID_Hotel, ID_Habitacion, Fecha_Entrada, Fecha_Salida, Fecha_Creacion, estado_reservas, ID_Pago
    ) VALUES (p_ID_Cliente, p_ID_Hotel, p_ID_Habitacion, p_Fecha_Entrada, p_Fecha_Salida, p_Fecha_Creacion, 'Reservado', p_ID_Pago
    );
    UPDATE habitacion
    SET reservada = TRUE
    WHERE ID_Habitacion = p_ID_Habitacion;
END //

DELIMITER ;
CALL agregar_reserva('5-6789-0123','H005',  'HAB005', '2024-10-03','2024-09-01',1001
);

--------------------------------------------------------------3----------------------------------------------- 
DELIMITER //

CREATE PROCEDURE calcular_ocupacion(
    IN p_ID_Hotel VARCHAR(50),
    IN p_Fecha_Inicio DATE,
    IN p_Fecha_Fin DATE
)
BEGIN
    SELECT 
        H.ID_Hotel,                 
        H.nombre_hotel AS Nombre_Hotel,   
        COUNT(r.ID_Reserva) AS total_reservas,
        SUM(
            CASE
                WHEN r.Fecha_Entrada <= p_Fecha_Fin 
                  AND r.Fecha_Salida >= p_Fecha_Inicio 
                THEN 1
                ELSE 0
            END
        ) AS total_intersecciones
    FROM 
        Hotel AS H                 
    LEFT JOIN 
        reservas AS r ON H.ID_Hotel = r.ID_Hotel
    WHERE 
        H.ID_Hotel = p_ID_Hotel
    GROUP BY 
        H.ID_Hotel, H.nombre_hotel;     
END //
DELIMITER ;

CALL calcular_ocupacion('H001', '2024-09-01', '2024-09-07');
