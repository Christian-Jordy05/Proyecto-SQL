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