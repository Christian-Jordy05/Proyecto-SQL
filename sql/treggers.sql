-- Active: 1724787581423@@127.0.0.1@3306@hoteles

DELIMITER //

--------------------------Actualiza el estado de la habitacion a "no disponible" por si se elimino una reservacion----------------------

CREATE TRIGGER trg_update_disponibilidad_reserva
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
    UPDATE habitacion
    SET reservada = 'No disponible'
    WHERE ID_Habitacion = NEW.ID_Habitacion;
END //

----------------------------Actualiza el estado de la habitacion a "disponible" por si se agrego una reservacion------------------------

CREATE TRIGGER disponibilidad
AFTER DELETE ON reservas
FOR EACH ROW
BEGIN
    UPDATE habitacion
    SET reservada = 'Disponible'
    WHERE ID_Habitacion = OLD.ID_Habitacion;
END //

DELIMITER ;

DROP TRIGGER IF EXISTS trg_update_disponibilidad_reserva
















