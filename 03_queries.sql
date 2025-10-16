USE movilidadurbana;

-- -----------------------------------------------------
-- CONSIGNA 7: 10 CONSULTAS CLAVE
-- (JOINs, agregaciones, subconsultas, condiciones)
-- -----------------------------------------------------

-- 1) Historial de viajes completados con nombres (JOINs + filtro)
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

-- 2) Top 5 conductores por calificación promedio (agregación + HAVING)
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

-- 3) Pasajeros que usaron vehículos Premium o XL (subconsulta)
SELECT
    u.id, u.nombre, u.apellido, u.correo
FROM usuariosviajeros u
WHERE u.id IN (
    SELECT DISTINCT s.idpasajero
    FROM solicitudesviaje s
    JOIN flotavehiculos v ON s.idvehiculo = v.id
    WHERE v.tiposervicio IN ('premium','xl')
);

-- 4) Total recaudado por día (solo pagos 'pagado') (agregación)
SELECT
    DATE(p.pagadoen) AS Fecha,
    SUM(p.monto)     AS RecaudadoTotal,
    COUNT(p.id)      AS CantidadPagos
FROM registropagos p
WHERE p.estado = 'pagado'
GROUP BY DATE(p.pagadoen)
ORDER BY Fecha ASC;

-- 5) Conductores conectados y SIN viaje asignado/en curso (LEFT JOIN + condición)
SELECT
    c.id, c.nombre, c.apellido, c.telefono
FROM conductoresactivos c
LEFT JOIN solicitudesviaje s
  ON c.id = s.idconductor
 AND s.estado IN ('asignado','iniciado')
WHERE c.estado = 'conectado'
  AND s.id IS NULL
ORDER BY c.apellido, c.nombre;

-- 6) Viajes cancelados por el pasajero con motivo "conductor tarde"
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

-- 7) Viajes más caros que el promedio de los completados (subconsulta escalar)
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

-- 8) Pasajeros con mayor gasto total (pagos 'pagado') (JOIN + agregación + HAVING)
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

-- 9) Reseñas de viajes en vehículos de una marca (ej.: Toyota) (multi-join + filtro)
SELECT
    v.marca, v.modelo, oc.calificacion, oc.comentario
FROM opinionesconductores oc
JOIN solicitudesviaje s ON oc.idviaje   = s.id
JOIN flotavehiculos   v ON s.idvehiculo = v.id
WHERE v.marca = 'Toyota'
ORDER BY oc.calificacion DESC;

-- 10) Reporte categorizado por distancia (CASE + orden lógico)
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

-- -----------------------------------------------------
-- CONSIGNA 8: VISTA de disponibilidad de conductores
-- -----------------------------------------------------
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

-- Ejemplo de uso de la vista (extrae coordenadas)
SELECT
  id,
  nombre,
  apellido,
  telefono,
  ST_X(ubicacion) AS longitud,
  ST_Y(ubicacion) AS latitud
FROM vconductoresdisponibles;

SELECT id, nombre, apellido
FROM conductoresactivos
WHERE ST_Within(
  ubicacion,
  ST_GeomFromText('POLYGON((-55.905 -27.368,-55.895 -27.368,-55.895 -27.362,-55.905 -27.362,-55.905 -27.368))',4326)
);
