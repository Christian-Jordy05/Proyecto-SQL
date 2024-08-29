USE hoteles;

CALL insertar_datos_de_prueba ();

DROP PROCEDURE insertar_datos_de_prueba;

DELIMITER $$
CREATE Procedure insertar_datos_de_prueba()
BEGIN
    INSERT INTO
        administradores (
            nombre,
            email,
            telefono,
            contraseña
        )
    VALUES (
            'Jordy',
            'jordymartinez@gmail.com',
            '8739-1234',
            'pass1'
        ),
        (
            'Elian',
            'elianguevara@gmail.com',
            '6525-5678',
            'pass2'
        ),
        (
            'Yacith',
            'yacithdelgado@gmail.com',
            '6126-4011',
            'pass3'
        );
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
        );

    INSERT INTO
        tipo_habitacion (nombre)
    VALUES ('Simple'),
        ('Doble'),
        ('Suite'),
        ('Presidencial');

    INSERT INTO
        habitacion (
            ID_Habitacion,
            ID_Hotel,
            ID_Tipo,
            num_habitacion,
            precio
        )
    VALUES (
            'HAB001',
            'H001',
            1,
            'A01',
            200.00
        ),
        (
            'HAB002',
            'H001',
            2,
            'A02',
            300.00
        ),
        (
            'HAB003',
            'H001',
            3,
            'A03',
            500.00
        ),
        (
            'HAB004',
            'H002',
            4,
            'B01',
            540.00
        ),
        (
            'HAB005',
            'H002',
            4,
            'B02',
            1000.00
        ),
        (
            'HAB006',
            'H002',
            2,
            'B03',
            349.99
        ),
        (
            'HAB007',
            'H003',
            1,
            'C01',
            189.99
        ),
        (
            'HAB008',
            'H003',
            4,
            'C02',
            799.99
        ),
        (
            'HAB009',
            'H003',
            3,
            'C03',
            349.99
        ),
        (
            'HAB010',
            'H004',
            2,
            'A01',
            229.99
        ),
        (
            'HAB011',
            'H004',
            4,
            'A02',
            649.99
        ),
        (
            'HAB012',
            'H004',
            3,
            'A03',
            449.99
        ),
        (
            'HAB013',
            'H005',
            1,
            'A01',
            199.99
        ),
        (
            'HAB014',
            'H005',
            4,
            'B02',
            599.99
        ),
        (
            'HAB015',
            'H005',
            2,
            'C03',
            299.99
        );
    INSERT INTO
        Metodo_Pago (ID_Pago, Nombre_Pago)
    VALUES (1001, 'Tarjeta de Crédito'),
        (1002, 'PayPal'),
        (1003, 'simpe movil'),
        (1004, 'efectivo'),
        (1005, 'bitcoin');
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
            'Marylin',
            'Martínez',
            'marylinmartinez@gmail.com',
            '8555-1234'
        ),
        (
            "2-3456-7890",
            'Luis',
            'Segura',
            'luissegura@gmail.com',
            '8725-5678'
        ),
        (
            "3-4567-8901",
            'Steven',
            'Salas',
            'stevensalas@gmail.com',
            '6792-8765'
        ),
        (
            "6-3028-9769",
            'Keylor',
            'Villalobos',
            'KeylorVillalobos@gmail.com',
            '8398-4321'
        ),
        (
            "4-5678-9012",
            'Dereck',
            'Vallestero',
            'Dreckvallestero@gmail.com',
            '7830-4456'
        ),
        (
            "5-6789-0123",
            'Susana',
            'Cordero',
            'Susanacordero@gmail.com',
            '7389-6789'
        );
    INSERT INTO
        Reservas (
            ID_cliente,
            ID_hotel,
            ID_habitacion,
            Fecha_Entrada,
            Fecha_Salida,
            Fecha_Creacion,
            `ID_Pago`
        )
    VALUES (
            "1-2345-6789",
            "H001",
            "HAB003",
            "2024-09-01",
            "2024-09-07",
            "2024-08-15",
            1001
        ),
        (
            "2-3456-7890",
            "H002",
            "HAB005",
            "2024-10-05",
            "2024-10-10",
            "2024-08-20",
            1005
        ),
        (
            "3-4567-8901",
            "H003",
            "HAB008",
            "2024-11-15",
            "2024-11-20",
            "2024-09-01",
            1003
        ),
        (
            "4-5678-9012",
            "H004",
            "HAB011",
            "2024-12-01",
            "2024-12-05",
            "2024-09-01",
            1004
        ),
        (
            "5-6789-0123",
            "H005",
            "HAB014",
            "2024-12-10",
            "2024-12-15",
            "2024-09-25",
            1002
        );
END $$
DELIMITER ;