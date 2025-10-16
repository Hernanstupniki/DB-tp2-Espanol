DROP DATABASE IF EXISTS movilidadurbana;
CREATE DATABASE movilidadurbana;
USE movilidadurbana;

CREATE TABLE tipospago (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL UNIQUE,
  descripcion VARCHAR(200),
  creadoen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eliminadoen DATETIME NULL
);

CREATE TABLE motivocancelacion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(30) NOT NULL UNIQUE,
  descripcion VARCHAR(200) NOT NULL,
  creadoen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eliminadoen DATETIME NULL
);

CREATE TABLE usuariosviajeros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL,
  apellido VARCHAR(60) NOT NULL,
  correo VARCHAR(120) NOT NULL UNIQUE,
  telefono VARCHAR(30) NOT NULL,
  creadoen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eliminadoen DATETIME NULL
);

CREATE TABLE conductoresactivos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL,
  apellido VARCHAR(60) NOT NULL,
  correo VARCHAR(120) NOT NULL UNIQUE,
  telefono VARCHAR(30) NOT NULL,
  licencia VARCHAR(40) NOT NULL UNIQUE,
  estado ENUM('desconectado','conectado','enviaje','pendienteaprobacion','suspendido') NOT NULL DEFAULT 'desconectado',
  ubicacion POINT SRID 4326 NOT NULL,
  creadoen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eliminadoen DATETIME NULL,
  SPATIAL INDEX ixconductoresubicacion (ubicacion)
);

CREATE TABLE flotavehiculos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  idconductor INT NOT NULL,
  marca VARCHAR(60) NOT NULL,
  modelo VARCHAR(60) NOT NULL,
  patente VARCHAR(20) NOT NULL UNIQUE,
  tiposervicio ENUM('estándar','premium','xl','moto') NOT NULL DEFAULT 'estándar',
  companiaSeguro VARCHAR(80) NOT NULL,
  polizaSeguro VARCHAR(40) NOT NULL,
  seguroValidoHasta DATE NOT NULL,
  creadoen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eliminadoen DATETIME NULL,
  CONSTRAINT fkvehiculosconductor
    FOREIGN KEY (idconductor) REFERENCES conductoresactivos(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT uqvehiculosconductor UNIQUE (idconductor),
  CONSTRAINT ckvehiculosegurofecha CHECK (seguroValidoHasta >= DATE(creadoen))
);

CREATE TABLE solicitudesviaje (
  id INT AUTO_INCREMENT PRIMARY KEY,
  idpasajero INT NOT NULL,
  idconductor INT NULL,
  idvehiculo INT NULL,
  estado ENUM('solicitado','asignado','iniciado','completado','cancelado') NOT NULL DEFAULT 'solicitado',
  solicitadoen DATETIME NOT NULL,
  asignadoen DATETIME NULL,
  iniciadoen DATETIME NULL,
  finalizadoen DATETIME NULL,
  direccionorigen VARCHAR(200) NOT NULL,
  latorigen DECIMAL(9,6) NULL,
  lngorigen DECIMAL(9,6) NULL,
  direcciondestino VARCHAR(200) NOT NULL,
  latdestino DECIMAL(9,6) NULL,
  lngdestino DECIMAL(9,6) NULL,
  duracionrealseg INT UNSIGNED NULL,
  distanciakm DECIMAL(6,2) NULL,
  montotarifa DECIMAL(10,2) NULL,
  canceladoen DATETIME NULL,
  canceladopor ENUM('pasajero','conductor','sistema') NULL,
  idmotivocancelacion INT NULL,
  creadoen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eliminadoen DATETIME NULL,
  CONSTRAINT fkviajespasajero
    FOREIGN KEY (idpasajero) REFERENCES usuariosviajeros(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fkviajesconductor
    FOREIGN KEY (idconductor) REFERENCES conductoresactivos(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fkviajesvehiculo
    FOREIGN KEY (idvehiculo) REFERENCES flotavehiculos(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fkviajesmotivocancelacion
    FOREIGN KEY (idmotivocancelacion) REFERENCES motivocancelacion(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT ckviajescoordenadas CHECK (
    (latorigen BETWEEN -90 AND 90 OR latorigen IS NULL) AND
    (lngorigen BETWEEN -180 AND 180 OR lngorigen IS NULL) AND
    (latdestino BETWEEN -90 AND 90 OR latdestino IS NULL) AND
    (lngdestino BETWEEN -180 AND 180 OR lngdestino IS NULL)
  ),
  CONSTRAINT ckviajesordentiempo CHECK (
    (asignadoen IS NULL OR asignadoen >= solicitadoen) AND
    (iniciadoen IS NULL OR iniciadoen >= COALESCE(asignadoen, solicitadoen)) AND
    (finalizadoen IS NULL OR finalizadoen >= COALESCE(iniciadoen, asignadoen, solicitadoen))
  ),
  CONSTRAINT ckviajesnonegativos CHECK (
    (duracionrealseg IS NULL OR duracionrealseg >= 0) AND
    (distanciakm IS NULL OR distanciakm >= 0) AND
    (montotarifa IS NULL OR montotarifa >= 0)
  ),
  CONSTRAINT ckviajescancelacionlogica CHECK (
    (estado <> 'cancelado' AND canceladoen IS NULL AND canceladopor IS NULL)
    OR
    (estado = 'cancelado' AND canceladoen IS NOT NULL AND canceladopor IS NOT NULL)
  )
);

CREATE INDEX ixviajesconductorinicio ON solicitudesviaje (idconductor, iniciadoen);
CREATE INDEX ixviajespasajeroinicio ON solicitudesviaje (idpasajero, iniciadoen);
CREATE INDEX ixviajesestado ON solicitudesviaje (estado);
CREATE INDEX ixviajessolicitado ON solicitudesviaje (solicitadoen);
CREATE INDEX ixviajesestadotiempo ON solicitudesviaje (estado, solicitadoen);
CREATE INDEX ixviajesconductorestadotiempo ON solicitudesviaje (idconductor, estado, solicitadoen);
CREATE INDEX ixviajespasajerotiempo ON solicitudesviaje (idpasajero, solicitadoen);

CREATE TABLE paradasintermedias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  idviaje INT NOT NULL,
  secuencia SMALLINT UNSIGNED NOT NULL,
  direccionparada VARCHAR(200) NOT NULL,
  latparada DECIMAL(9,6) NULL,
  lngparada DECIMAL(9,6) NULL,
  creadoen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eliminadoen DATETIME NULL,
  CONSTRAINT fkparadasviaje
    FOREIGN KEY (idviaje) REFERENCES solicitudesviaje(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT uqparadasviaje UNIQUE (idviaje, secuencia),
  CONSTRAINT ckparadascoordenadas CHECK (
    (latparada BETWEEN -90 AND 90 OR latparada IS NULL) AND
    (lngparada BETWEEN -180 AND 180 OR lngparada IS NULL)
  )
);

CREATE TABLE opinionesconductores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  idviaje INT NOT NULL,
  idconductor INT NOT NULL,
  idpasajero INT NOT NULL,
  calificacion TINYINT NOT NULL,
  comentario VARCHAR(1000),
  creadoen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eliminadoen DATETIME NULL,
  CONSTRAINT fkresenasconductorviaje
    FOREIGN KEY (idviaje) REFERENCES solicitudesviaje(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fkresenasconductorconductor
    FOREIGN KEY (idconductor) REFERENCES conductoresactivos(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fkresenasconductorpasajero
    FOREIGN KEY (idpasajero) REFERENCES usuariosviajeros(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT ckresenasconductorpuntaje CHECK (calificacion BETWEEN 1 AND 5),
  CONSTRAINT uqresenasconductorunica UNIQUE (idviaje, idpasajero, idconductor)
);

CREATE INDEX ixresenasconductorfecha ON opinionesconductores (idconductor, creadoen);

CREATE TABLE opinionesviajeros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  idviaje INT NOT NULL,
  idpasajero INT NOT NULL,
  idconductor INT NOT NULL,
  calificacion TINYINT NOT NULL,
  comentario VARCHAR(1000),
  creadoen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eliminadoen DATETIME NULL,
  CONSTRAINT fkresenaspasajeroviaje
    FOREIGN KEY (idviaje) REFERENCES solicitudesviaje(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fkresenaspasajeropasajero
    FOREIGN KEY (idpasajero) REFERENCES usuariosviajeros(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fkresenaspasajeroconductor
    FOREIGN KEY (idconductor) REFERENCES conductoresactivos(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT ckresenaspasajeropuntaje CHECK (calificacion BETWEEN 1 AND 5),
  CONSTRAINT uqresenaspasajerounica UNIQUE (idviaje, idconductor, idpasajero)
);

CREATE INDEX ixresenaspasajerofecha ON opinionesviajeros (idpasajero, creadoen);
CREATE FULLTEXT INDEX ftresenasconductorcomentario ON opinionesconductores(comentario);
CREATE FULLTEXT INDEX ftresenaspasajerocomentario ON opinionesviajeros(comentario);

CREATE TABLE registropagos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  idviaje INT NOT NULL,
  idmetodo INT NOT NULL,
  monto DECIMAL(10,2) NOT NULL,
  estado ENUM('pendiente','pagado','fallido','reembolsado') NOT NULL DEFAULT 'pendiente',
  referenciatransaccion VARCHAR(80),
  pagadoen DATETIME NULL,
  creadoen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eliminadoen DATETIME NULL,
  CONSTRAINT fkpagosviaje
    FOREIGN KEY (idviaje) REFERENCES solicitudesviaje(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fkpagosmetodo
    FOREIGN KEY (idmetodo) REFERENCES tipospago(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT ckpagosmonto CHECK (monto >= 0),
  CONSTRAINT ckpagoslogicapago CHECK (
    (estado = 'pagado' AND pagadoen IS NOT NULL)
    OR
    (estado IN ('pendiente','fallido','reembolsado') AND pagadoen IS NULL)
  )
);

CREATE INDEX ixpagosestado ON registropagos (estado);
CREATE INDEX ixpagospagadoen ON registropagos (pagadoen);
CREATE INDEX ixpagosmetodotiempo ON registropagos (idmetodo, pagadoen);

CREATE INDEX ixpasajerosapellidonombre ON usuariosviajeros (apellido, nombre);
CREATE INDEX ixconductoresapellidonombre ON conductoresactivos (apellido, nombre);
