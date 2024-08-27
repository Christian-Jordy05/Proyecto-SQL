-- Se eligió crear un indice en la tabla hotel para mostrar la información básica, como el nombre, dirección y calificación.
CREATE UNIQUE INDEX info_hotel
ON hotel (ID_hotel, nombre_hotel, direccion, estrellas);
