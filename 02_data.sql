USE movilidadurbana;

-- =====================================================
-- tipospago — 30 registros (ASCII)
-- =====================================================
INSERT INTO tipospago (id, nombre, descripcion) VALUES
(1,  'Efectivo',               'Pago en efectivo al finalizar el viaje.'),
(2,  'Tarjeta de Credito',     'Pago con tarjeta de credito a traves de la app.'),
(3,  'Mercado Pago',           'Pago utilizando el saldo o tarjetas de Mercado Pago.'),
(4,  'Tarjeta de Debito',      'Debito online.'),
(5,  'Transferencia Bancaria', 'CBU/alias.'),
(6,  'PayPal',                 'Pago internacional.'),
(7,  'Credito en App',         'Credito promocional.'),
(8,  'QR Interoperable',       'Lectura de codigo QR.'),
(9,  'Criptomonedas',          'Pago con cripto.'),
(10, 'Ticket Empresa',         'Convenio con empresas.'),
(11, 'Vale Turistico',         'Promocion turismo.'),
(12, 'Descuento Estudiantil',  'Tarifa con descuento.'),
(13, 'POS Movil',              'Lectura fisica de tarjeta.'),
(14, 'Cuenta DNI',             'Billetera digital provincia.'),
(15, 'Naranja X',              'Billetera digital.'),
(16, 'Uala',                   'Billetera digital.'),
(17, 'Personal Pay',           'Billetera digital.'),
(18, 'MODO',                   'Billetera interoperable.'),
(19, 'Tarjeta Prepaga',        'Tarjeta recargable.'),
(20, 'Pago Telefonico',        'IVR/autorizacion.'),
(21, 'Pago en Kiosco',         'Convenio puntos fisicos.'),
(22, 'Pago en Rapipago',       'Sucursal Rapipago.'),
(23, 'Pago en Pago Facil',     'Sucursal Pago Facil.'),
(24, 'Descuento Referido',     'Codigos de referido.'),
(25, 'Abono Mensual',          'Plan por suscripcion.'),
(26, 'Tarjeta Corporativa',    'Empresas.'),
(27, 'Tarjeta Virtual',        'Tarjeta virtual en app.'),
(28, 'Cobro Contra Entrega',   'CoD validado.'),
(29, 'Gift Card',              'Tarjeta de regalo.'),
(30, 'Promocion Bancaria',     'Promo bancos/financieras.');

-- =====================================================
-- motivocancelacion — 30 registros (ASCII)
-- =====================================================
INSERT INTO motivocancelacion (id, codigo, descripcion) VALUES
(1,  'PASSENGER_NO_SHOW',  'El pasajero no se presento en el punto de encuentro.'),
(2,  'DRIVER_TOO_LATE',    'El conductor demoro mas de lo esperado.'),
(3,  'WRONG_ADDRESS',      'El pasajero se equivoco en la direccion de origen.'),
(4,  'APP_ERROR',          'Hubo un error tecnico en la aplicacion.'),
(5,  'VEHICLE_UNSUITABLE', 'El vehiculo no cumplia con las condiciones esperadas.'),
(6,  'PAX_CHANGE_MIND',    'El pasajero cambio de opinion.'),
(7,  'DRV_VEHICLE_ISSUE',  'Falla mecanica del vehiculo.'),
(8,  'WEATHER_ALERT',      'Condiciones climaticas adversas.'),
(9,  'SAFETY_CONCERN',     'Motivos de seguridad.'),
(10, 'TRAFFIC_BLOCK',      'Corte o bloqueo de transito.'),
(11, 'PAX_LATE',           'Pasajero llego tarde.'),
(12, 'DRV_EMERGENCY',      'Emergencia del conductor.'),
(13, 'PAX_EMERGENCY',      'Emergencia del pasajero.'),
(14, 'BAD_ADDRESS_FORMAT', 'Direccion mal ingresada.'),
(15, 'PAYMENT_FAIL',       'Fallo en el metodo de pago.'),
(16, 'OVER_CAPACITY',      'Supera capacidad del vehiculo.'),
(17, 'NO_PETS_ALLOWED',    'Restriccion por mascotas.'),
(18, 'NO_CHILD_SEAT',      'Silla infantil requerida.'),
(19, 'AREA_RESTRICTED',    'Zona no permitida.'),
(20, 'DOUBLE_BOOKING',     'Reserva duplicada.'),
(21, 'PRICE_DISPUTE',      'Conflicto con la tarifa.'),
(22, 'HEALTH_ISSUE',       'Cuestion de salud.'),
(23, 'PANIC_BUTTON',       'Cancelacion por alerta.'),
(24, 'LANGUAGE_BARRIER',   'Problema de comunicacion.'),
(25, 'NO_MASK',            'Requisito sanitario.'),
(26, 'NO_ID',              'Falta de identificacion.'),
(27, 'NO_FUEL',            'Sin combustible suficiente.'),
(28, 'ROAD_INCIDENT',      'Accidente/incidente vial.'),
(29, 'SCHEDULE_CHANGE',    'Cambio de horario.'),
(30, 'OTHER',              'Otro motivo.');

-- =====================================================
-- usuariosviajeros — 30 registros (ASCII)
-- =====================================================
INSERT INTO usuariosviajeros (id, nombre, apellido, correo, telefono) VALUES
(1,  'Tito',  'Calderon',      'tito.calde@casilla.ar',          '+54 9 3764 11-0001'),
(2,  'Cosme', 'Fulanito',      'cosme.f@correo.local',           '3764-22-0002'),
(3,  'Naiara','Iturriaga',     'nai.it@postal.dev',              '+54 3764 000003'),
(4,  'Ulises','Quipildor',     'ulises.q@mate.org',              '3764 444 0004'),
(5,  'Mar',   'Almada-Suarez', 'mar.almada@ventana.com',         '3764-555-0005'),
(6,  'Zoilo', 'Desojo',        'zoilo@dominio.ar',               '+54 9 3764-000006'),
(7,  'Gala',  'Pizzurno',      'gala.p@listamail.net',           '3764 777 0007'),
(8,  'Ezequiel','Bengoechea',  'ez.bengoe@inbox.lat',            '3764-888-0008'),
(9,  'Jazmin','Zarza',         'jazmin.z@pindapinda.io',         '3764-999-0009'),
(10, 'Ian',   'Malfatti',      'ian.malfatti@correo.ar',         '3764-101-0010'),
(11, 'Tiziana','Rettig',       'tizi.r@postbox.gg',              '3764 121 0011'),
(12, 'Fausto','Vattuone',      'fausto.v@domail.cc',             '3764-131-0012'),
(13, 'Barbara','Bermudez',     'barb.bermudez@pmail.app',        '+54 3764 1410013'),
(14, 'Ciro',  'Valdes',        'ciro.valdes@ej.ar',              '3764-151-0014'),
(15, 'Ingrid','Sporle',        'ingrid.s@mix.mx',                '3764-161-0015'),
(16, 'Thiago','Oliden',        'thiago.oliden@laposta.xyz',      '3764-171-0016'),
(17, 'Rocio', 'Diaz Cossio',   'rocio.dc@buzon.email',           '3764-181-0017'),
(18, 'Alejo', 'Goyechea',      'alejo.goye@correo.site',         '+54 9 3764 191-0018'),
(19, 'Iara',  'Pereyra Iraola','iara.pi@idu.ar',                 '3764 202 0019'),
(20, 'Lautaro','Zanotti',      'lautaro.z@elpico.pro',           '3764-212-0020'),
(21, 'Violeta','Capelleti',    'vio.cap@inmail.af',              '3764-222-0021'),
(22, 'Dilan', 'Chazarreta',    'dilan.ch@casimail.pe',           '3764-232-0022'),
(23, 'Maia',  'Gorleri',       'maia.g@esquina.bo',              '3764-242-0023'),
(24, 'Octavio','Risso Patron', 'octa.rp@correo.cat',             '3764-252-0024'),
(25, 'Pia',   'Moyano',        'pia.moyano@bandeja.soy',         '3764-262-0025'),
(26, 'Nicolas','Bacigalupo',   'n.bacigalupo@caja.be',           '3764-272-0026'),
(27, 'Mora',  'Toselli',       'mora.t@buzon.hm',                '3764-282-0027'),
(28, 'Simon', 'Ferrero',       'simon.f@correo.vc',              '3764-292-0028'),
(29, 'Lisel', 'Kovalenko',     'lis.kova@posteo.eu',             '3764-303-0029'),
(30, 'Gael',  'Yofre',         'gael.yofre@cuenta.nz',           '3764-313-0030');

-- =====================================================
-- conductoresactivos — 30 registros (ASCII) con ST_SRID(POINT, 4326)
-- =====================================================
INSERT INTO conductoresactivos (id, nombre, apellido, correo, telefono, licencia, estado, ubicacion) VALUES
(1,  'Ramiro',   'Achaval',        'ramiro.ach@chof.ar',        '+54 9 3764 11-4001', 'MIS-0001-AR', 'conectado',   ST_SRID(POINT(-55.8969, -27.3680), 4326)),
(2,  'Milagros', 'Bidegain',       'mili.bid@chof.ar',          '3764-22-4002',       'MIS-0002-AR', 'desconectado',ST_SRID(POINT(-55.9000, -27.3700), 4326)),
(3,  'Benicio',  'Carignano',      'beni.carig@chof.ar',        '3765-33-4003',       'MIS-0003-AR', 'enviaje',     ST_SRID(POINT(-55.8888, -27.3650), 4326)),
(4,  'Micaela',  'Dromi',          'mica.dromi@chof.ar',        '+54 3765 44 4004',   'MIS-0004-AR', 'conectado',   ST_SRID(POINT(-55.9123, -27.3789), 4326)),
(5,  'Lisandro', 'Etchegorry',     'lisan.etche@chof.ar',       '3764-55-4005',       'MIS-0005-AR', 'conectado',   ST_SRID(POINT(-55.8950, -27.3620), 4326)),
(6,  'Aldana',   'Falotico',       'aldana.falot@chof.ar',      '3765-66-4006',       'MIS-0006-AR', 'desconectado',ST_SRID(POINT(-55.9050, -27.3850), 4326)),
(7,  'Nicolas',  'Gerez',          'n.gerez@chof.ar',           '3764-77-4007',       'MIS-0007-AR', 'conectado',   ST_SRID(POINT(-55.8910, -27.3690), 4326)),
(8,  'Irene',    'Haidar',         'irene.haidar@chof.ar',      '3765-88-4008',       'MIS-0008-AR', 'enviaje',     ST_SRID(POINT(-55.9020, -27.3720), 4326)),
(9,  'Teo',      'Iramain',        'teo.iramain@chof.ar',       '3764-99-4009',       'MIS-0009-AR', 'desconectado',ST_SRID(POINT(-55.8990, -27.3660), 4326)),
(10, 'Ambar',    'Jelin',          'ambar.jelin@chof.ar',       '3764-10-4010',       'MIS-0010-AR', 'conectado',   ST_SRID(POINT(-55.8930, -27.3710), 4326)),
(11, 'Yamila',   'Kresak',         'yam.kresak@chof.ar',        '3765-11-4011',       'MIS-0011-AR', 'conectado',   ST_SRID(POINT(-55.8981, -27.3685), 4326)),
(12, 'Elias',    'Lugones',        'elias.lug@chof.ar',         '3764-12-4012',       'MIS-0012-AR', 'desconectado',ST_SRID(POINT(-55.9011, -27.3705), 4326)),
(13, 'Ariel',    'Mazzocchi',      'ariel.mazzo@chof.ar',       '+54 9 3765 13-4013', 'MIS-0013-AR', 'enviaje',     ST_SRID(POINT(-55.8899, -27.3655), 4326)),
(14, 'Agustina', 'Nocetti',        'agustina.noce@chof.ar',     '3765-14-4014',       'MIS-0014-AR', 'conectado',   ST_SRID(POINT(-55.9134, -27.3799), 4326)),
(15, 'Renata',   'Otaola',         'ren.otaola@chof.ar',        '3765-15-4015',       'MIS-0015-AR', 'conectado',   ST_SRID(POINT(-55.8961, -27.3625), 4326)),
(16, 'Nahir',    'Pintos',         'nahir.pintos@chof.ar',      '3765-16-4016',       'MIS-0016-AR', 'desconectado',ST_SRID(POINT(-55.9061, -27.3855), 4326)),
(17, 'Tadeo',    'Quatrini',       'tadeo.qua@chof.ar',         '3764-17-4017',       'MIS-0017-AR', 'conectado',   ST_SRID(POINT(-55.8921, -27.3695), 4326)),
(18, 'Luna',     'Ruata',          'luna.ruata@chof.ar',        '3764-18-4018',       'MIS-0018-AR', 'enviaje',     ST_SRID(POINT(-55.9031, -27.3725), 4326)),
(19, 'Santino',  'Santamarina',    'santi.santa@chof.ar',       '3764-19-4019',       'MIS-0019-AR', 'desconectado',ST_SRID(POINT(-55.9001, -27.3665), 4326)),
(20, 'Brenda',   'Tarditti',       'brenda.tardi@chof.ar',      '+54 3765 20-4020',   'MIS-0020-AR', 'conectado',   ST_SRID(POINT(-55.8941, -27.3715), 4326)),
(21, 'Julian',   'Ugarteche',      'julian.ugar@chof.ar',       '3765-21-4021',       'MIS-0021-AR', 'conectado',   ST_SRID(POINT(-55.8972, -27.3682), 4326)),
(22, 'Tamara',   'Vercellone',     'tam.vercell@chof.ar',       '3765-22-4022',       'MIS-0022-AR', 'desconectado',ST_SRID(POINT(-55.9002, -27.3702), 4326)),
(23, 'Eluney',   'Williman',       'eluney.will@chof.ar',       '3765-23-4023',       'MIS-0023-AR', 'enviaje',     ST_SRID(POINT(-55.8892, -27.3652), 4326)),
(24, 'Gaspar',   'Xirgu',          'gaspar.x@chof.ar',          '3765-24-4024',       'MIS-0024-AR', 'conectado',   ST_SRID(POINT(-55.9125, -27.3791), 4326)),
(25, 'Oriana',   'Yasky',          'oriana.y@chof.ar',          '3765-25-4025',       'MIS-0025-AR', 'conectado',   ST_SRID(POINT(-55.8952, -27.3622), 4326)),
(26, 'Matilde',  'Zupel',          'matilde.z@chof.ar',         '3764-26-4026',       'MIS-0026-AR', 'desconectado',ST_SRID(POINT(-55.9052, -27.3852), 4326)),
(27, 'Americo',  'Aizpun',         'americo.a@chof.ar',         '3765-27-4027',       'MIS-0027-AR', 'conectado',   ST_SRID(POINT(-55.8912, -27.3692), 4326)),
(28, 'Candel',   'Bock',           'candel.b@chof.ar',          '3764-28-4028',       'MIS-0028-AR', 'enviaje',     ST_SRID(POINT(-55.9022, -27.3722), 4326)),
(29, 'Nazareno', 'Cuneo Libarona', 'naza.cl@chof.ar',           '3765-29-4029',       'MIS-0029-AR', 'desconectado',ST_SRID(POINT(-55.8992, -27.3662), 4326)),
(30, 'Mirko',    'Dahbar',         'mirko.d@chof.ar',           '3765-30-4030',       'MIS-0030-AR', 'conectado',   ST_SRID(POINT(-55.8932, -27.3712), 4326));

-- =====================================================
-- flotavehiculos — 30 registros (ASCII)
-- =====================================================
INSERT INTO flotavehiculos (id, idconductor, marca, modelo, patente, tiposervicio, companiaSeguro, polizaSeguro, seguroValidoHasta) VALUES
(1,  1,  'Fiat',       'Cronos',          'AE 123 AA', 'estándar', 'Seguros Rivadavia',     'POL1001', '2026-05-20'),
(2,  2,  'Volkswagen', 'Gol',             'AD 456 BB', 'estándar', 'La Caja',               'POL1002', '2026-06-15'),
(3,  3,  'Chevrolet',  'Onix',            'AC 789 CC', 'premium',  'Sancor Seguros',        'POL1003', '2026-07-10'),
(4,  4,  'Renault',    'Sandero',         'AB 111 DD', 'estándar', 'Federacion Patronal',   'POL1004', '2026-08-05'),
(5,  5,  'Toyota',     'Etios',           'AA 222 EE', 'xl',       'Mapfre',                'POL1005', '2026-09-01'),
(6,  6,  'Ford',       'Ka',              'AE 333 FF', 'estándar', 'Seguros Rivadavia',     'POL1006', '2026-10-25'),
(7,  7,  'Peugeot',    '208',             'AD 444 GG', 'premium',  'La Caja',               'POL1007', '2026-11-20'),
(8,  8,  'Nissan',     'Versa',           'AC 555 HH', 'estándar', 'Sancor Seguros',        'POL1008', '2026-12-15'),
(9,  9,  'Honda',      'Fit',             'AB 666 II', 'estándar', 'Federacion Patronal',   'POL1009', '2027-01-10'),
(10, 10, 'Citroen',    'C3',              'AA 777 JJ', 'estándar', 'Mapfre',                'POL1010', '2027-02-05'),
(11, 11, 'Fiat',       'Argo',            'AE 888 KK', 'estándar', 'Seguros Rivadavia',     'POL1011', '2027-03-20'),
(12, 12, 'Volkswagen', 'Polo',            'AD 999 LL', 'premium',  'La Caja',               'POL1012', '2027-04-15'),
(13, 13, 'Chevrolet',  'Cruze',           'AC 101 MM', 'xl',       'Sancor Seguros',        'POL1013', '2027-05-10'),
(14, 14, 'Renault',    'Logan',           'AB 202 NN', 'estándar', 'Federacion Patronal',   'POL1014', '2027-06-05'),
(15, 15, 'Toyota',     'Yaris',           'AA 303 OO', 'premium',  'Mapfre',                'POL1015', '2027-07-01'),
(16, 16, 'Ford',       'Fiesta',          'AE 404 PP', 'estándar', 'Seguros Rivadavia',     'POL1016', '2027-08-25'),
(17, 17, 'Peugeot',    '308',             'AD 505 QQ', 'premium',  'La Caja',               'POL1017', '2027-09-20'),
(18, 18, 'Nissan',     'Kicks',           'AC 606 RR', 'xl',       'Sancor Seguros',        'POL1018', '2027-10-15'),
(19, 19, 'Honda',      'City',            'AB 707 SS', 'estándar', 'Federacion Patronal',   'POL1019', '2027-11-10'),
(20, 20, 'Citroen',    'C4 Cactus',       'AA 808 TT', 'premium',  'Mapfre',                'POL1020', '2027-12-05'),
(21, 21, 'Fiat',       'Mobi',            'AE 909 UU', 'estándar', 'Seguros Rivadavia',     'POL1021', '2028-01-20'),
(22, 22, 'Volkswagen', 'Virtus',          'AD 110 VV', 'estándar', 'La Caja',               'POL1022', '2028-02-15'),
(23, 23, 'Chevrolet',  'Tracker',         'AC 211 WW', 'xl',       'Sancor Seguros',        'POL1023', '2028-03-10'),
(24, 24, 'Renault',    'Duster',          'AB 312 XX', 'xl',       'Federacion Patronal',   'POL1024', '2028-04-05'),
(25, 25, 'Toyota',     'Corolla Cross',   'AA 413 YY', 'premium',  'Mapfre',                'POL1025', '2028-05-01'),
(26, 26, 'Ford',       'Ecosport',        'AE 514 ZZ', 'estándar', 'Seguros Rivadavia',     'POL1026', '2028-06-25'),
(27, 27, 'Peugeot',    '2008',            'AD 615 AB', 'premium',  'La Caja',               'POL1027', '2028-07-20'),
(28, 28, 'Nissan',     'Sentra',          'AC 716 AC', 'premium',  'Sancor Seguros',        'POL1028', '2028-08-15'),
(29, 29, 'Honda',      'HR-V',            'AB 817 AD', 'xl',       'Federacion Patronal',   'POL1029', '2028-09-10'),
(30, 30, 'Citroen',    'C5 Aircross',     'AA 918 AE', 'xl',       'Mapfre',                'POL1030', '2028-10-05');

-- =====================================================
-- solicitudesviaje — 30 registros (ASCII; tiempos/estados)
-- =====================================================

-- Completados (1..20)
INSERT INTO solicitudesviaje (idpasajero, idconductor, idvehiculo, estado, solicitadoen, asignadoen, iniciadoen, finalizadoen, direccionorigen, direcciondestino, duracionrealseg, distanciakm, montotarifa) VALUES
(1,  1,  1,  'completado','2025-10-01 08:00:00','2025-10-01 08:01:00','2025-10-01 08:05:00','2025-10-01 08:20:00','Av. Corrientes 123','Av. Santa Fe 456',900, 5.2,1850.50),
(2,  3,  3,  'completado','2025-10-01 09:15:00','2025-10-01 09:16:00','2025-10-01 09:20:00','2025-10-01 09:45:00','Calle Falsa 123','Av. Siempreviva 742',1500,8.1,2400.00),
(5,  4,  4,  'completado','2025-10-02 10:00:00','2025-10-02 10:02:00','2025-10-02 10:06:00','2025-10-02 10:15:00','Plaza San Martin','Terminal de Omnibus',540,3.5,1500.75),
(10, 8,  8,  'completado','2025-10-02 14:30:00','2025-10-02 14:31:00','2025-10-02 14:35:00','2025-10-02 15:00:00','Hospital Madariaga','Costanera de Posadas',1500,7.8,2350.00),
(15, 13, 13, 'completado','2025-10-03 18:00:00','2025-10-03 18:01:00','2025-10-03 18:04:00','2025-10-03 18:30:00','Aeropuerto de Posadas','Hotel Savoy',1560,10.5,3200.00),
(20, 18, 18, 'completado','2025-10-03 20:00:00','2025-10-03 20:02:00','2025-10-03 20:05:00','2025-10-03 20:25:00','Puente Internacional','Centro de la ciudad',1200,6.2,2100.25),
(25, 23, 23, 'completado','2025-10-04 11:00:00','2025-10-04 11:01:00','2025-10-04 11:05:00','2025-10-04 11:35:00','Campus UNaM','Barrio Villa Sarita',1800,9.5,2800.00),
(30, 28, 28, 'completado','2025-10-04 16:45:00','2025-10-04 16:46:00','2025-10-04 16:50:00','2025-10-04 17:05:00','Jardin Botanico','Mercado La Placita',900, 4.8,1780.50),
(3,  5,  5,  'completado','2025-10-05 09:00:00','2025-10-05 09:02:00','2025-10-05 09:05:00','2025-10-05 09:20:00','Av. Uruguay 3450','Av. Mitre 1200',900, 5.5,1900.00),
(7,  7,  7,  'completado','2025-10-05 12:30:00','2025-10-05 12:31:00','2025-10-05 12:34:00','2025-10-05 12:50:00','Sanatorio Boratti','Barrio Aguacates',960,6.0,2050.75),
(11, 10, 10, 'completado','2025-10-06 15:00:00','2025-10-06 15:01:00','2025-10-06 15:05:00','2025-10-06 15:25:00','Posadas Plaza Shopping','Club Nautico',1200,7.2,2250.00),
(16, 14, 14, 'completado','2025-10-06 19:00:00','2025-10-06 19:02:00','2025-10-06 19:06:00','2025-10-06 19:30:00','Casino Club','Restaurante La Rueda',1440,8.8,2600.50),
(21, 17, 17, 'completado','2025-10-07 08:30:00','2025-10-07 08:31:00','2025-10-07 08:35:00','2025-10-07 08:55:00','Anfiteatro Manuel Antonio Ramirez','Puente Roque Gonzalez',1200,6.5,2150.00),
(26, 21, 21, 'completado','2025-10-07 13:00:00','2025-10-07 13:02:00','2025-10-07 13:05:00','2025-10-07 13:20:00','Ministerio de Ecologia','Casa de Gobierno',900,4.2,1680.25),
(4,  24, 24, 'completado','2025-10-08 17:00:00','2025-10-08 17:01:00','2025-10-08 17:04:00','2025-10-08 17:30:00','Parque de la Ciudad','Hipermercado Libertad',1560,9.1,2750.00),
(8,  25, 25, 'completado','2025-10-08 21:00:00','2025-10-08 21:01:00','2025-10-08 21:05:00','2025-10-08 21:25:00','Cine Sunstar','Heladeria El Indiecito',1200,5.8,2000.00),
(12, 27, 27, 'completado','2025-10-09 07:45:00','2025-10-09 07:46:00','2025-10-09 07:50:00','2025-10-09 08:10:00','Gimnasio Full Center','Oficina Centrica',1200,6.3,2100.75),
(18, 30, 30, 'completado','2025-10-09 10:00:00','2025-10-09 10:01:00','2025-10-09 10:05:00','2025-10-09 10:35:00','Barrio El Palomar','Barrio Kennedy',1800,11.2,3400.00),
(24, 2,  2,  'completado','2025-10-09 12:00:00','2025-10-09 12:02:00','2025-10-09 12:06:00','2025-10-09 12:20:00','Rotonda de Posadas','Playa El Brete',840,5.0,1800.00),
(29, 6,  6,  'completado','2025-10-09 14:00:00','2025-10-09 14:01:00','2025-10-09 14:05:00','2025-10-09 14:30:00','Barrio A-4','Centro del Conocimiento',1500,9.8,2900.50);

-- Cancelados (21..25)
INSERT INTO solicitudesviaje (idpasajero, idconductor, idvehiculo, estado, solicitadoen, asignadoen, canceladoen, canceladopor, idmotivocancelacion, direccionorigen, direcciondestino) VALUES
(4,  9,  9, 'cancelado','2025-10-01 11:00:00','2025-10-01 11:02:00','2025-10-01 11:05:00','pasajero',2,'Av. Rademacher 5000','Centro'),
(6,  12, 12,'cancelado','2025-10-02 16:00:00','2025-10-02 16:03:00','2025-10-02 16:10:00','conductor',1,'Calle 147 y 170','Itaembe Mini'),
(13, 16, 16,'cancelado','2025-10-03 22:00:00','2025-10-03 22:01:00','2025-10-03 22:04:00','pasajero',3,'Direccion erronea 123','Lugar correcto 456'),
(19, 19, 19,'cancelado','2025-10-05 18:00:00','2025-10-05 18:02:00','2025-10-05 18:03:00','sistema',  4,'Av. Jauretche y Lavalle','Hospital'),
(28, 29, 29,'cancelado','2025-10-08 14:00:00','2025-10-08 14:02:00','2025-10-08 14:06:00','pasajero',5,'Barrio Itaembe Guazu','Costanera');

-- En curso / asignados / solicitados (26..30)
INSERT INTO solicitudesviaje (idpasajero, idconductor, idvehiculo, estado, solicitadoen, asignadoen, iniciadoen, direccionorigen, direcciondestino) VALUES
(14, 1, 1, 'iniciado',  '2025-10-09 16:00:00','2025-10-09 16:01:00','2025-10-09 16:05:00','Av. Corrientes 123','Av. Santa Fe 456'),
(17, 3, 3, 'iniciado',  '2025-10-09 16:10:00','2025-10-09 16:11:00','2025-10-09 16:14:00','Calle Falsa 123','Av. Siempreviva 742'),
(22, 8, 8, 'asignado',  '2025-10-09 16:15:00','2025-10-09 16:16:00',NULL,'Plaza San Martin','Terminal de Omnibus'),
(27, 4, 4, 'asignado',  '2025-10-09 16:20:00','2025-10-09 16:22:00',NULL,'Hospital Madariaga','Costanera de Posadas');

-- Solicitado sin chofer/vehiculo
INSERT INTO solicitudesviaje (idpasajero, idconductor, idvehiculo, estado, solicitadoen, direccionorigen, direcciondestino)
VALUES (9, NULL, NULL, 'solicitado','2025-10-09 16:25:00','Aeropuerto de Posadas','Hotel Savoy');

-- =====================================================
-- paradasintermedias — 30 registros (ASCII)
-- =====================================================
INSERT INTO paradasintermedias (idviaje, secuencia, direccionparada, latparada, lngparada) VALUES
(1, 1, 'Kiosco 24hs', -27.3688, -55.8931),
(1, 2, 'Farmacia Mitre', -27.3690, -55.8940),
(2, 1, 'Panaderia Mana', -27.3710, -55.8950),
(3, 1, 'Banco Nacion', -27.3722, -55.8965),
(4, 1, 'YPF Lopez y Planes', -27.3733, -55.8972),
(5, 1, 'Supermercado California', -27.3741, -55.8981),
(5, 2, 'Cajero Link Av. Mitre', -27.3748, -55.8990),
(6, 1, 'Plazoleta Guemes', -27.3755, -55.9000),
(7, 1, 'Despensa Don Juan', -27.3762, -55.9010),
(8, 1, 'Plaza San Martin', -27.3770, -55.9020),
(9, 1, 'Cafe del Centro', -27.3781, -55.9030),
(10,1, 'Estacion Shell', -27.3792, -55.9040),
(11,1, 'Club CAPRI', -27.3801, -55.9050),
(12,1, 'Colegio Roque Gonzalez', -27.3812, -55.9060),
(13,1, 'Parador Costanera', -27.3823, -55.9070),
(14,1, 'Rotonda Av. Quaranta', -27.3834, -55.9080),
(15,1, 'Municipalidad', -27.3845, -55.9090),
(16,1, 'Ferreteria Centro', -27.3856, -55.9100),
(17,1, 'Mercado Modelo', -27.3867, -55.9110),
(18,1, 'Parada de Colectivo', -27.3878, -55.9120),
(19,1, 'Plaza 9 de Julio', -27.3889, -55.9130),
(20,1, 'Banco Macro', -27.3899, -55.9140),
(21,1, 'Hospital Fatima', -27.3909, -55.9150),
(22,1, 'Comisaria 3ra', -27.3919, -55.9160),
(23,1, 'Registro Civil', -27.3929, -55.9170),
(24,1, 'Anses', -27.3939, -55.9180),
(25,1, 'IPS', -27.3949, -55.9190),
(26,1, 'Estacion Servicio Axion', -27.3959, -55.9200),
(27,1, 'Gomeria El Pato', -27.3969, -55.9210),
(28,1, 'Heladeria Grido', -27.3979, -55.9220);

-- =====================================================
-- registropagos — 30 registros (ASCII)
-- =====================================================
INSERT INTO registropagos (idviaje, idmetodo, monto, estado, pagadoen, referenciatransaccion) VALUES
(1,  2, 1850.50, 'pagado',    '2025-10-01 08:20:05','TX-0001'),
(2,  3, 2400.00, 'pagado',    '2025-10-01 09:45:10','TX-0002'),
(3,  1, 1500.75, 'pagado',    '2025-10-02 10:15:00','TX-0003'),
(4,  2, 2350.00, 'pagado',    '2025-10-02 15:00:15','TX-0004'),
(5,  3, 3200.00, 'pagado',    '2025-10-03 18:30:20','TX-0005'),
(6,  1, 2100.25, 'pagado',    '2025-10-03 20:25:00','TX-0006'),
(7,  2, 2800.00, 'pagado',    '2025-10-04 11:35:05','TX-0007'),
(8,  3, 1780.50, 'pagado',    '2025-10-04 17:05:10','TX-0008'),
(9,  1, 1900.00, 'pagado',    '2025-10-05 09:20:00','TX-0009'),
(10, 2, 2050.75, 'pagado',    '2025-10-05 12:50:05','TX-0010'),
(11, 3, 2250.00, 'pagado',    '2025-10-06 15:25:10','TX-0011'),
(12, 1, 2600.50, 'pagado',    '2025-10-06 19:30:00','TX-0012'),
(13, 2, 2150.00, 'pagado',    '2025-10-07 08:55:05','TX-0013'),
(14, 3, 1680.25, 'pagado',    '2025-10-07 13:20:10','TX-0014'),
(15, 1, 2750.00, 'pagado',    '2025-10-08 17:30:00','TX-0015'),
(16, 2, 2000.00, 'pagado',    '2025-10-08 21:25:05','TX-0016'),
(17, 3, 2100.75, 'pagado',    '2025-10-09 08:10:10','TX-0017'),
(18, 1, 3400.00, 'pagado',    '2025-10-09 10:35:00','TX-0018'),
(19, 2, 1800.00, 'pagado',    '2025-10-09 12:20:05','TX-0019'),
(20, 3, 2900.50, 'pagado',    '2025-10-09 14:30:10','TX-0020');

-- Reembolsos (pagadoen NULL)
INSERT INTO registropagos (idviaje, idmetodo, monto, estado, pagadoen, referenciatransaccion) VALUES
(21, 1, 0.00, 'reembolsado', NULL, 'TX-0021'),
(22, 2, 0.00, 'reembolsado', NULL, 'TX-0022'),
(23, 3, 0.00, 'reembolsado', NULL, 'TX-0023'),
(24, 1, 0.00, 'reembolsado', NULL, 'TX-0024'),
(25, 2, 0.00, 'reembolsado', NULL, 'TX-0025');

-- Pendientes
INSERT INTO registropagos (idviaje, idmetodo, monto, estado, pagadoen, referenciatransaccion) VALUES
(26, 2, 0.00, 'pendiente', NULL, NULL),
(27, 3, 0.00, 'pendiente', NULL, NULL),
(28, 1, 0.00, 'pendiente', NULL, NULL),
(29, 2, 0.00, 'pendiente', NULL, NULL),
(30, 3, 0.00, 'pendiente', NULL, NULL);

-- =====================================================
-- opinionesconductores — 30 registros (ASCII, variados)
-- =====================================================
INSERT INTO opinionesconductores (idviaje, idconductor, idpasajero, calificacion, comentario) VALUES
(1,  1,  1, 5, 'Arranco con mate listo y Waze afinado: un lujo.'),
(2,  3,  2, 4, 'Buen ritmo, playlist indie patagonica a volumen humano.'),
(3,  4,  5, 5, 'Conocia atajos que ni el mapa del intendente.'),
(4,  8, 10, 5, 'Frenadas suaves, charlas breves y precisas.'),
(5,  13, 15, 3, 'El baul tenia glitter de carnaval. Zafa.'),
(6,  18, 20, 5, 'Llego antes que mi notificacion. Impecable.'),
(7,  23, 25, 4, 'Llevo caramelos de miel. Suma puntos.'),
(8,  28, 30, 5, 'Climatizacion perfecta y cero ruidos.'),
(9,  5,  3, 4, 'Conductor zen: cero bocinazos.'),
(10, 7,  7, 5, 'Atajo perfecto por costanera, sin peajes.'),
(11, 10, 11, 2, 'Se paso dos esquinas; GPS caprichoso.'),
(12, 14, 16, 5, 'Conecto cargador USB-C sin pedirlo. Crack.'),
(13, 17, 21, 5, 'Limpieza de museo y conduccion de rally controlado.'),
(14, 21, 26, 5, 'Ruta quirurgica: cero baches, cero charcos.'),
(15, 24, 4,  4, 'Correcto y amable, sin chachara.'),
(16, 25, 8,  4, 'Radio baja y ventanillas en consenso.'),
(17, 27, 12, 5, 'Fino con los lomos de burro.'),
(18, 30, 18, 5, 'Aire justo, ni artico ni sauna.'),
(19, 2,  24, 4, 'Charlas de futbol sin discusion eterna.'),
(20, 6,  29, 3, 'Falto perfumito al inicio, luego ok.'),
(21, 9,  4,  2, 'Cancelacion anunciada tarde, flojo.'),
(22, 12, 6,  2, 'Se cancelo; la app aviso despues.'),
(23, 16, 13, 3, 'Direccion mal tipeada, empatia presente.'),
(24, 19, 19, 3, 'Clima imposible; decision prudente.'),
(25, 29, 28, 3, 'Preferencias cruzadas, sin drama.'),
(26, 1,  14, 4, 'En curso: prolijo y atento.'),
(27, 4,  27, 4, 'Asignado: confirmo por chat y llego.'),
(28, 8,  22, 4, 'Asignado: puntual como reloj.'),
(29, 6,  29, 5, 'Cierre redondo, cero desvios.'),
(30, 28, 30, 5, 'Remate 10/10: puerta a puerta real.');

-- =====================================================
-- opinionesviajeros — 30 registros (ASCII, variados)
-- =====================================================
INSERT INTO opinionesviajeros (idviaje, idpasajero, idconductor, calificacion, comentario) VALUES
(1,  1,  1, 5, 'Subio con vuelto justo y destino claro.'),
(2,  2,  3, 5, 'Saludo cordial, cinturon puesto sin decir nada.'),
(5,  15, 13, 3, 'Trajo una bolsa de cipa; aroma intenso.'),
(10, 7,  7,  5, 'Conversacion corta y simpatica.'),
(11, 11, 10, 4, 'Apuro por llegar pero respetuosa.'),
(16, 20, 18, 5, 'Pidio bajito el aire; divino.'),
(20, 29, 6,  5, 'Indicaciones claras, cero zigzag.'),
(3,  5,  4, 5, 'Puntualidad suiza con terere en mano.'),
(4,  10, 8, 4, 'Trato correcto, sin dramas.'),
(6,  20, 18, 4, 'Cerro apps al subir, top.'),
(7,  25, 23, 5, 'Buen humor a la siesta.'),
(8,  30, 28, 5, 'Saludo al guardia del barrio: suma.'),
(9,  3,  5, 4, 'Aviso por chat al llegar.'),
(12, 16, 14, 5, 'Cinturon rapido, cero demora.'),
(13, 21, 17, 5, 'Indica calles como brujula humana.'),
(14, 26, 21, 4, 'Silenciosa, viaje calmo.'),
(15, 4,  24, 4, 'Sin vueltas con el pago.'),
(17, 12, 27, 5, 'Agradecida por el desvio corto.'),
(18, 18, 30, 5, 'Pidio musica baja, todo ok.'),
(19, 24, 2,  4, 'Presento documento sin pedirlo.'),
(21, 4,  9,  3, 'Demoras previas a la cancelacion.'),
(22, 6,  12, 3, 'Se reprogramo; quedo en 3.'),
(23, 13, 16, 3, 'Error de direccion, educada igual.'),
(24, 19, 19, 4, 'Acompano decision por lluvia.'),
(25, 28, 29, 3, 'Quiso cambiar destino: regular.'),
(26, 14, 1,  5, 'En curso y prolija.'),
(27, 17, 3,  4, 'Asignada, respondio al toque.'),
(28, 22, 8,  4, 'Asignada, sin sorpresas.'),
(29, 29, 6,  5, 'Cierre con resena feliz.'),
(30, 30, 28, 5, 'Final brillante y agradecida.');
