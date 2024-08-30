-- Active: 1724794029309@@127.0.0.1@3306@hoteles


-- este es para mostrar las habitaciones que fueron reservada hoy----------
---------------------------------------------------------------------------
CREATE VIEW reservas_de_hoy AS
SELECT nombre_hotel, num_habitacion, `Fecha_Entrada`,`Fecha_Salida`,`Fecha_Creacion`
FROM reservas, hotel, habitacion
WHERE
    reservas.`Fecha_Creacion` = CURRENT_DATE
    AND habitacion.`ID_Habitacion` = reservas.`ID_Habitacion`
    AND hotel.`ID_hotel` = reservas.`ID_Hotel`;




--------------------- enseña todos los hoteles-----------------------------
---------------------------------------------------------------------------
CREATE VIEW lista_hoteles AS
SELECT ID_hotel, nombre_hotel, direccion, servicio
FROM hotel



------enseña todos las habitaciones disponible-----------------------------
---------------------------------------------------------------------------
CREATE View Todas_las_habitaciones_disponibles AS
SELECT h.nombre_hotel, ha.num_habitacion, ha.precio, ha.reservada
FROM hotel h, habitacion ha
WHERE
    ha.reservada = 'disponible' AND
    h.id_hotel = ha.id_hotel;


------enseña los reportes--------------------------------------------------
---------------------------------------------------------------------------

CREATE View lista_de_reporte AS
SELECT COUNT(*) AS canti_reportes, tipo, contenido as todos_los_reportes
FROM reportes
GROUP BY tipo, contenido;

DROP View lista_de_reporte