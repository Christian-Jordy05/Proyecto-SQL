-- Active: 1724787581423@@127.0.0.1@3306@hoteles

USE hoteles;

-----------------------------------------------Consulta la disponibilidad-------------------------------------------

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
CALL consultar_disponibilidad("2024-09-06", "H001")

-----------------------------------------------Cambia el estado de las reservas-------------------------------------------

DELIMITER //
CREATE PROCEDURE cambiar_estado_reserva(IN reserva_id INT, IN nuevo_estado VARCHAR(50))
BEGIN
    UPDATE reservas
    SET estado_reservas = nuevo_estado
    WHERE reservas.ID_Reserva = reserva_id AND reservas.estado_reservas != nuevo_estado;
END //
DELIMITER ;

CALL cambiar_estado_reserva(7, "Cancelada");

-----------------------------------------------agrega las reservas-------------------------------------------

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
    ) VALUES (p_ID_Cliente, p_ID_Hotel, p_ID_Habitacion, p_Fecha_Entrada, p_Fecha_Salida, p_Fecha_Creacion, 'Reservada', p_ID_Pago
    );
END //
DELIMITER ;
CALL agregar_reserva('1-2345-6789', 'H002', 'HAB004', '2024-7-10', '2024-7-17', '2024-06-27', 1002);
>>>>>>> dev

-----------------------------------------------muestra las ocupaciones-------------------------------------------

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

CALL calcular_ocupacion('H002', '2024-09-01', '2024-09-07');

-----------------------------------------------elimina una reservacion-------------------------------------------

DELIMITER //
CREATE PROCEDURE gestionar_reserva(IN p_ID_Reserva INT)
BEGIN
    DECLARE reserva_existe  INT ;
    -- manejo de error
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error al eliminar la reserva' as error_message;
    END;

    START TRANSACTION;

    

    SELECT COUNT(*) INTO reserva_existe
    FROM reservas
    WHERE ID_Reserva = p_ID_Reserva;

    IF reserva_existe = 0 THEN
        SELECT 'la reservacion no existe' AS error_message;
    ELSE
        DELETE FROM reservas
        WHERE ID_Reserva = p_ID_Reserva;
        COMMIT;
    END IF;
END //

DELIMITER ;

-- eliminar las reservaciones---------------------
CALL gestionar_reserva(8);

DROP Procedure gestionar_reserva;




-----------------------------------------------manda reportes-------------------------------------------


DELIMITER //


CREATE PROCEDURE mandarReportes(
    IN p_tipo VARCHAR(50),
    IN p_contenido VARCHAR(500),
    IN p_fecha_creacion DATE,
    IN p_hora TIME
)
BEGIN
    IF p_tipo NOT IN ('mantenimiento', 'limpiar', 'reparacion', 'otros') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tipo no válido.';
    ELSE
        INSERT INTO reportes (tipo, contenido, fecha_creacion, hora)
        VALUES (p_tipo, p_contenido, p_fecha_creacion, p_hora);
    END IF;
END//
DELIMITER ;

---------------------eliminar el procedure de reportes--------------

DROP Procedure `mandarReportes`

-----------------------mandar reportes---------------------------------
CALL mandarReportes("mante","puerta mala y pintura dañada",CURDATE(),TIME(NOW()))


