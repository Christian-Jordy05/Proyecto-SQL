-- Active: 1724682181883@@127.0.0.1@3306@hoteles

USE hoteles;

DELIMITER //
CREATE PROCEDURE consultar_disponibilidad(IN fecha DATE)
BEGIN
    SELECT ID_Hotel, ID_Habitacion
        FROM habitacion
    WHERE NOT EXISTS (
        SELECT NULL
            FROM reservas
        WHERE fecha BETWEEN reservas.Fecha_Entrada AND reservas.Fecha_Salida
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

CALL consultar_disponibilidad("2024-09-07")