-- 1) Tabla persona (supertipo)
CREATE TABLE IF NOT EXISTS persona (
  persona_id BIGSERIAL PRIMARY KEY,
  nombres VARCHAR(80) NOT NULL,
  apellidos VARCHAR(80) NOT NULL,
  email VARCHAR(80) NOT NULL UNIQUE,
  fecha_nacimiento date NOT NULL,

  -- Direccion: atributo compuesto
  dir_calle VARCHAR(120) NOT NULL,
  dir_ciudad VARCHAR(120) NOT NULL,
  dir_departamento VARCHAR(60) NOT NULL,
  dir_pais VARCHAR(60) NOT NULL DEFAULT 'Honduras', -- DEFAULT: valor por defecto si no lo envian

  creado_en TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS persona_telefono (
  persona_id BIGINT NOT NULL, --FK hacia entidad persona
  telefono VARCHAR(30) NOT NULL,

  --PK compuesta:evitar duplicar el mismo telefono para la misma persona
  CONSTRAINT pk_persona_telefono PRIMARY KEY (persona_id, telefono),
  CONSTRAINT fk_tel_persona FOREIGN KEY (persona_id)
  REFERENCES persona(persona_id)
  ON DELETE CASCADE -- si se eimina la persona, se eliminan sus telefonos
);

-- 3) Tabla Asisente: Subtipo de persona (generalizacion)
-- una persona puede ser asistente, usamos persona_id como PK y FK
-- esto permite "Overlap": una persona puede ser asistente y organizador al mismo tiempo
CREATE TABLE IF NOT EXISTS asistente(
  persona_id BIGINT PRIMARY KEY,
  tipo_membresia VARCHAR(20) NOT NULL,
  fecha_registro DATE NOT NULL DEFAULT current_date,

  CONSTRAINT fk_asistente_persona FOREIGN KEY (persona_id)
   REFERENCES persona(persona_id)
   ON DELETE CASCADE --si se elimina persona, se elimina su rol "Asistente"
);

-- 4) Tabla Organizador: Subtipo de persona (generalizacion)
-- una persona puede ser organizador y asistente
CREATE TABLE IF NOT EXISTS organizador(
  persona_id BIGINT PRIMARY KEY,
  organizacion VARCHAR(120) NOT NULL,
  sitio_web VARCHAR(120), --opcional

  CONSTRAINT fk_organizador_persona FOREIGN KEY (persona_id)
   REFERENCES persona(persona_id)
   ON DELETE CASCADE
);

-- 5) Evento
-- cada eveto es creado por un organizador
CREATE TABLE IF NOT EXISTS evento(
  evento_id BIGSERIAL PRIMARY KEY, --PK autoincremental

  titulo VARCHAR(150) NOT NULL,
  categoria VARCHAR(60) NOT NULL,
  fecha_evento DATE NOT NULL,
  cupo_maximo INT NOT NULL CHECK (cupo_maximo > 0), --check no permite cupo maximo < = 0

  organizador_id BIGINT NOT NULL, --FK al organizador creador del evento

  CONSTRAINT fk_evento_organizador FOREIGN KEY (organizador_id)
   REFERENCES organizador(persona_id)
   ON DELETE RESTRICT --evita borrar organizador si aun tiene eventos pendientes
);

-- 6) inscripcion (entidad asociativa)
CREATE TABLE IF NOT EXISTS inscripcion(
  inscripcion_id BIGSERIAL PRIMARY KEY, --PK autoincremental
  evento_id BIGINT NOT NULL, --FK
  asistente_id BIGINT NOT NULL, --FK a asistente

  fecha_compra DATE NOT NULL DEFAULT current_date,
  precio_pagado NUMERIC(10,2) NOT NULL CHECK (precio_pagado > 0),
  codigo_qr VARCHAR(30) NOT NULL UNIQUE,

  CONSTRAINT uq_evento_asistente UNIQUE (evento_id, asistente_id),

  CONSTRAINT fk_inscripcion_evento FOREIGN KEY (evento_id)
   REFERENCES evento(evento_id)
   ON DELETE CASCADE, --si se borra evento, se borra sus inscripciones relacionadas

  CONSTRAINT fk_inscripcion_asistente FOREIGN KEY (asistente_id)
   REFERENCES asistente(persona_id)
   ON DELETE CASCADE --si se borra el asistente (persona), se eliminan sus inscripciones
);