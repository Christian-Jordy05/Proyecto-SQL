-- Se eligió crear un indice en la tabla hotel para mostrar la información básica, como el nombre, dirección y calificación.
-- Se eligió crear un indice en la tabla hotel para mostrar la información básica, como el nombre, dirección y calificación.
CREATE UNIQUE INDEX info_hotel ON hotel (ID_hotel, nombre_hotel, direccion, estrellas);

--Se eligio crear un indice en la tabla de clientes para hacer una consulta de manera rapida y eficiente de los usuarios.
CREATE INDEX idx_clientes ON clientes (Email, Telefono,ID_Cliente);

--se eligió crear este indice para hacer eficas las consultas para revisar la disponibilidad de una habitación en un hotel.
CREATE INDEX idx_habitacion ON habitacion (num_habitacion, reservada, precio)

-- selegio este indice para hacer eficas para verificar el tipo de habitcion de menera rapida y eficiente.
CREATE INDEX idx_tipo_habitacion ON tipo_habitacion (nombre, ID_Tipo);


