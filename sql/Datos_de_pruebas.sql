

use hoteles;

---------------------------------------CLIENTES--------------------------------
INSERT INTO
    Clientes (
        ID_Cliente,
        Nombre,
        Apellido,
        Email,
        Telefono
    )
VALUES (
        "1-2345-6789",
        'Ana',
        'Martínez',
        'ana.martinez@email.com',
        '555-1234'
    ),
    (
        "2-3456-7890",
        'Luis',
        'García',
        'luis.garcia@email.com',
        '555-5678'
    ),
    (
        "3-4567-8901",
        'Marta',
        'López',
        'marta.lopez@email.com',
        '555-8765'
    ),
    (
        "4-5678-9012",
        'Carlos',
        'Fernández',
        'carlos.fernandez@email.com',
        '555-4321'
    ),
    (
        "5-6789-0123",
        'Isabel',
        'Gómez',
        'isabel.gomez@email.com',
        '555-6789'
    );




---------------------------------RESERVAS-----------------------------
INSERT INTO
    Reservas (
        ID_cliente,
        ID_hotel,
        ID_habitacion,
        Fecha_Entrada,
        Fecha_Salida,
        Fecha_Creacion,
        estado_reservas,
        `ID_Pago`
    )
VALUES (
        "1-2345-6789",
        "H001",
        "HAB001",
        "2024-09-01",
        "2024-09-07",
        "2024-08-15",
        "Confirmada",
        1001
    ),
    (
        "2-3456-7890",
        "H002",
        "HAB002",
        "2024-10-05",
        "2024-10-10",
        "2024-08-20",
        "Pendiente",
        1005
    ),
    (
        "3-4567-8901",
        "H003",
        "HAB003",
        "2024-11-15",
        "2024-11-20",
        "2024-09-01",
        "Confirmada",
        1003
    ),
    (
        "4-5678-9012",
        "H004",
        "HAB004",
        "2024-12-01",
        "2024-12-05",
        "2024-09-01",
        "Cancelada",
        1004
    ),
    (
        "5-6789-0123",
        "H005",
        "HAB005",
        "2024-12-10",
        "2024-12-15",
        "2024-09-25",
        "Confirmada",
        1002
    );


-------------------------------HOTELES--------------------------
INSERT INTO
    Hotel (
        ID_hotel,
        nombre_hotel,
        provincia,
        direccion,
        estrellas,
        servicio
    )
VALUES (
        "H001",
        "Hotel Grand Vista",
        "Barcelona",
        "Carrer de la Marina, 123, 08018 Barcelona",
        "5 estrellas",
        "Wi-Fi gratuito, spa, gimnasio, restaurante gourmet, piscina cubierta, servicio de habitaciones 24h"
    ),
    (
        "H002",
        "Hotel Oasis",
        "Alicante",
        "Avenida de la Playa, 45, 03001 Alicante",
        "4 estrellas",
        "Wi-Fi gratuito, piscina al aire libre, restaurante buffet, gimnasio, parking gratuito, servicio de lavandería"
    ),
    (
        "H003",
        "Hotel Montaña Azul",
        "Granada",
        "Calle de la Sierra, 78, 18000 Granada",
        "3 estrellas",
        "Wi-Fi gratuito, restaurante, bar, servicio de habitaciones, aparcamiento, aire acondicionado"
    ),
    (
        "H004",
        "Hotel Costa Brava",
        "Girona",
        "Carrer del Mar, 12, 17200 Girona",
        "4 estrellas",
        "Wi-Fi gratuito, piscina exterior, spa, restaurante, gimnasio, recepción 24h"
    ),
    (
        "H005",
        "Hotel Boutique El Reloj",
        "Madrid",
        "Plaza Mayor, 10, 28012 Madrid",
        "3 estrellas",
        "Wi-Fi gratuito, desayuno continental, servicio de habitaciones, recepción 24h, aire acondicionado"
    )





------------------------------METODOS DE PAGOS --------------------------------
INSERT INTO
    Metodo_Pago (ID_Pago, Nombre_Pago)
VALUES (1001, 'Tarjeta de Crédito'),
    (1002, 'PayPal'),
    (1003, 'simpe movil'),
    (1004, 'efectivo'),
    (1005, 'bitcoin');




----------------------------------------------HABITACIONES----------------------------
INSERT INTO
    habitacion (
        ID_Habitacion,
        ID_Hotel,
        ID_Tipo,
        num_habitacion,
        precio,
        reservada
    )
VALUES (
        'HAB001',
        'H001',
        1,
        'A01',
        200.00,
        FALSE
    ),
    (
        'HAB002',
        'H002',
        2,
        'A02',
        300.00,
        FALSE
    ),
    (
        'HAB003',
        'H003',
        3,
        'A03',
        500.00,
        FALSE
    ),
    (
        'HAB004',
        'H004',
        4,
        'A04',
        540.00,
        FALSE
    ),
    (
        'HAB005',
        'H005',
        5,
        'A05',
        1000.00,
        FALSE
    );


------------------------- TIPOS DE HABITACIONES------------------------
INSERT INTO
    tipo_habitacion (nombre)
VALUES ('Simple'),
    ('Doble'),
    ('doble'),
    ('Suite'),
    ('Presidencial');  