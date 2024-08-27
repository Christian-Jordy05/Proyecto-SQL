CREATE VIEW reservas_de_hoy AS
SELECT nombre_hotel, num_habitacion
FROM reservas, hotel, habitacion
WHERE
    reservas.`Fecha_Creacion` = CURRENT_DATE
    AND habitacion.`ID_Habitacion` = reservas.`ID_Habitacion`
    AND hotel.`ID_hotel` = reservas.`ID_Hotel`;