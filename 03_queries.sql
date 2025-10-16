USE movilidadurbana;

SELECT
    s.id                              AS IdViaje,
    s.solicitadoen                    AS FechaSolicitud,
    CONCAT(u.nombre,' ',u.apellido)   AS Pasajero,
    CONCAT(c.nombre,' ',c.apellido)   AS Conductor,
    s.montotarifa                     AS Monto
FROM solicitudesviaje s
JOIN usuariosviajeros   u ON s.idpasajero = u.id
JOIN conductoresactivos c ON s.idconductor = c.id
WHERE s.estado = 'completado'
ORDER BY s.solicitadoen DESC;

SELECT
    c.id                                                    AS IdConductor,
    CONCAT(c.nombre,' ',c.apellido)                         AS Conductor,
    COUNT(oc.id)                                            AS TotalResenas,
    ROUND(AVG(oc.calificacion),2)                           AS Promedio
FROM conductoresactivos c
JOIN opinionesconductores oc ON c.id = oc.idconductor
GROUP BY c.id, c.nombre, c.apellido
HAVING COUNT(oc.id) > 0
ORDER BY Promedio DESC, TotalResenas DESC
LIMIT 5;

SELECT
    u.id, u.nombre, u.apellido, u.correo
FROM usuariosviajeros u
WHERE u.id IN (
    SELECT DISTINCT s.idpasajero
    FROM solicitudesviaje s
    JOIN flotavehiculos v ON s.idvehiculo = v.id
    WHERE v.tiposervicio IN ('premium','xl')
);

SELECT
    DATE(p.pagadoen) AS Fecha,
    SUM(p.monto)     AS RecaudadoTotal,
    COUNT(p.id)      AS CantidadPagos
FROM registropagos p
WHERE p.estado = 'pagado'
GROUP BY DATE(p.pagadoen)
ORDER BY Fecha ASC;

SELECT
    c.id, c.nombre, c.apellido, c.telefono
FROM conductoresactivos c
LEFT JOIN solicitudesviaje s
  ON c.id = s.idconductor
 AND s.estado IN ('asignado','iniciado')
WHERE c.estado = 'conectado'
  AND s.id IS NULL
ORDER BY c.apellido, c.nombre;

SELECT
    s.id                                   AS IdViaje,
    s.solicitadoen                         AS FechaSolicitud,
    CONCAT(u.nombre,' ',u.apellido)        AS CanceloPasajero,
    m.descripcion                          AS Motivo
FROM solicitudesviaje s
JOIN usuariosviajeros    u ON s.idpasajero           = u.id
JOIN motivocancelacion   m ON s.idmotivocancelacion  = m.id
WHERE s.estado      = 'cancelado'
  AND s.canceladopor = 'pasajero'
  AND m.codigo       = 'DRIVER_TOO_LATE'
ORDER BY s.solicitadoen;

SELECT
    s.id, s.montotarifa
FROM solicitudesviaje s
WHERE s.estado = 'completado'
  AND s.montotarifa > (
        SELECT AVG(montotarifa)
        FROM solicitudesviaje
        WHERE estado = 'completado'
      )
ORDER BY s.montotarifa DESC;

SELECT
    u.id,
    CONCAT(u.nombre,' ',u.apellido) AS Pasajero,
    SUM(p.monto)                    AS GastoTotal
FROM usuariosviajeros u
JOIN solicitudesviaje s ON u.id = s.idpasajero
JOIN registropagos   p ON s.id = p.idviaje
WHERE p.estado = 'pagado'
GROUP BY u.id, u.nombre, u.apellido
HAVING GastoTotal > 2500
ORDER BY GastoTotal DESC;

SELECT
    v.marca, v.modelo, oc.calificacion, oc.comentario
FROM opinionesconductores oc
JOIN solicitudesviaje s ON oc.idviaje   = s.id
JOIN flotavehiculos   v ON s.idvehiculo = v.id
WHERE v.marca = 'Toyota'
ORDER BY oc.calificacion DESC;

SELECT
    s.id            AS IdViaje,
    s.distanciakm,
    s.montotarifa,
    CASE
      WHEN s.distanciakm IS NULL THEN 'SinDatos'
      WHEN s.distanciakm <= 5    THEN 'Corta'
      WHEN s.distanciakm <= 10   THEN 'Media'
      ELSE 'Larga'
    END AS Categoria
FROM solicitudesviaje s
WHERE s.estado = 'completado'
ORDER BY (s.distanciakm IS NULL), s.distanciakm;

CREATE OR REPLACE VIEW vconductoresdisponibles AS
SELECT
  c.id,
  c.nombre,
  c.apellido,
  c.telefono,
  c.ubicacion
FROM conductoresactivos c
LEFT JOIN solicitudesviaje s
  ON c.id = s.idconductor
 AND s.estado IN ('asignado','iniciado')
WHERE c.estado = 'conectado'
  AND s.id IS NULL;


-- Vista
SELECT
  id,
  nombre,
  apellido,
  telefono,
  ST_X(ubicacion) AS longitud,
  ST_Y(ubicacion) AS latitud
FROM vconductoresdisponibles;


