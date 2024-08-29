-- Obtener el número de reservas por hotel

SELECT 
  h.ID_hotel,
  h.nombre_hotel,
  COUNT(r.ID_Reserva) AS numero_reservas
FROM 
  Hotel h
  LEFT JOIN reservas r ON h.ID_hotel = r.ID_Hotel
GROUP BY 
  h.ID_hotel, h.nombre_hotel
ORDER BY 
  numero_reservas DESC;

-- -- consulta las habitacioes que estan disponible

SELECT COUNT(ha.num_habitacion) AS num_habitaciones_disponibles
FROM habitacion ha
JOIN hotel h ON h.ID_Hotel = ha.ID_Hotel
WHERE h.id_hotel = "H002" AND ha.reservada = 'Disponible' AND ha.num_habitacion NOT IN (
  SELECT num_habitacion
  FROM reservas
  WHERE Fecha_Entrada <= '2022-01-01' AND Fecha_Salida >= '2022-01-10'
);

-- Buscar hoteles por nombre

SELECT 
  ID_hotel,
  nombre_hotel AS nombredehotel,
  provincia,
  direccion,
  estrellas,
  servicio
FROM 
  hotel
WHERE 
  nombre_hotel LIKE '%Hotel Montaña Azul%';

-- Buscar hoteles por dirección

SELECT 
  ID_hotel,
  nombre_hotel AS nombredehotel,
  provincia,
  direccion,
  estrellas,
  servicio
FROM 
  hotel
WHERE 
  direccion LIKE '%Carrer de la Marina, 123, 08018 Barcelona%';

-- Consulta para buscar hoteles cuya ubicación termina con un texto específico.

SELECT 
  ID_hotel,
  nombre_hotel AS nombredehotel,
  provincia,
  direccion,
  estrellas,
  servicio
FROM 
  hotel
WHERE direccion LIKE '%a';

-- Obtener reservas de un cliente específico

SELECT 
    r.ID_Reserva,
    r.ID_Hotel,
    h.nombre_hotel,
    r.ID_Habitacion,
    r.Fecha_Entrada,
    r.Fecha_Salida,
    r.Fecha_Creacion,
    r.estado_reservas,
    r.ID_Pago
FROM 
    reservas r
    JOIN Clientes c ON r.ID_Cliente = c.ID_Cliente
    JOIN Hotel h ON r.ID_Hotel = h.ID_hotel
WHERE 
    c.Email = 'marylinmartinez@gmail.com'
    AND r.Fecha_Entrada >= '2024-07-01'
    AND r.Fecha_Entrada < '2024-7-30';

-- calcula el promedio de las reservaciones

WITH reservas_diarias AS (
  SELECT 
    ID_Hotel,
    Fecha_Entrada AS Fecha,
    COUNT(ID_Reserva) AS reservas_diarias
  FROM 
    Reservas
  GROUP BY 
    ID_Hotel, Fecha_Entrada
)
SELECT 
  ID_Hotel,
  AVG(reservas_diarias) AS promedio_reservas_diarias
FROM 
  reservas_diarias
GROUP BY 
  ID_Hotel;

--Consulta para identificar el hotel con la mayor ocupación en el mes anterior.

SELECT h.`ID_hotel`, h.nombre_hotel, COUNT(r.`ID_Reserva`) AS cantidad_reservas
FROM hotel h
    JOIN reservas r ON h.`ID_hotel` = r.`ID_Hotel`
WHERE
    r.`Fecha_Entrada` <= LAST_DAY(
        CURRENT_DATE - INTERVAL 1 MONTH
    )
    AND r.`Fecha_Salida` >= DATE_SUB(
        CURRENT_DATE - INTERVAL 1 MONTH,
        INTERVAL DAY(
            CURRENT_DATE - INTERVAL 1 MONTH
        ) - 1 DAY
    )
GROUP BY
    h.`ID_hotel`,
    h.nombre_hotel
ORDER BY h.`ID_hotel` DESC
LIMIT 1;

-- Consulta para listar los hoteles que tienen habitaciones disponibles pero no han sido reservadas en el último mes.

SELECT DISTINCT h.ID_hotel, h.nombre_hotel, h.provincia, h.direccion, h.estrellas, h.servicio
FROM Hotel h
JOIN habitacion hb ON h.ID_hotel = hb.ID_Hotel
LEFT JOIN reservas r ON hb.ID_Habitacion = r.ID_Habitacion
    AND r.Fecha_Entrada <= CURDATE()
    AND r.Fecha_Salida >= CURDATE()
    AND r.estado_reservas = 'Reservada'
WHERE hb.reservada = 'Disponible'
AND (r.ID_Habitacion IS NULL OR r.Fecha_Creacion < CURDATE() - INTERVAL 1 MONTH);