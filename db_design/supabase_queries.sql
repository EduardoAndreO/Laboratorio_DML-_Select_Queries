select * from inscripcion;

-- Limpiar tablas con DML: DELETE
BEGIN;
DELETE FROM inscripcion;
DELETE FROM evento;
DELETE FROM asistente;
COMMIT;

-- Limpiar tablas con DDL: TRUNCATE y reinicio de ids
TRUNCATE TABLE
  inscripcion,
  evento,
  asistente,
  organizador,
  persona_telefono,
  persona
RESTART IDENTITY;

TRUNCATE TABLE
  persona
RESTART IDENTITY
CASCADE;

--A) CREAR DATOS
INSERT INTO persona (nombres, apellidos, email, fecha_nacimiento, dir_calle, dir_ciudad, dir_departamento, dir_pais)
VALUES ('Marcos', 'Paz Rivera', 'marcos@gmail.com', '2001-09-09', '14 calle', 'Tegucigalpa','Fco. Morazan', 'Honduras')

SELECT * FROM persona
WHERE dir_ciudad = 'Tegucigalpa';

SELECT email, persona_id FROM persona
WHERE email = 'marcos@gmail.com';

--Agregar telefonos a persona existente
INSERT INTO persona_telefono(persona_id, telefono)
VALUES (61, '98801928')

--select: el que quiero obtener? en que vista?
--from: de donde obtengo la informacion?
--where: qué informacion quiero filtrar
SELECT * FROM persona_telefono
WHERE persona_id = 61;

--SELECT JOIN
SELECT p.persona_id, p.nombres, p.apellidos, pt.telefono
FROM persona p
JOIN persona_telefono pt
  --que une a estas dos tablas?
  ON pt.persona_id = p.persona_id
WHERE p.nombres = 'Daniela'

-- ver quienes son asistentes
SELECT p.nombres, p.apellidos, a.tipo_membresia, a.fecha_registro
FROM persona p
JOIN asistente a ON a.persona_id = p.persona_id
ORDER BY a.fecha_registro ASC

--ver organizadores y su organizacion
SELECT p.nombres, p.apellidos, org.nombre AS organizacion
FROM persona p
JOIN organizador o ON o.persona_id = p.persona_id
JOIN organizacion org ON org.organizacion_id = o.organizacion_id
ORDER BY p.apellidos, p.nombres;

--Listas eventos con su organizador
SELECT e.titulo, e.fecha_evento, p.nombres, p.apellidos, o.organizacion
FROM evento e
JOIN organizador o ON o.persona_id = e.organizador_id
JOIN persona p ON p.persona_id = o.persona_id
ORDER BY e.fecha_evento DESC;

-- ver inscripciones con evento y asistente: id de inscripcion, titulo de evento,
-- fecha de evento, nombre y apellido de asistente, codigo qr
SELECT  i.inscripcion_id, e.titulo AS titulo_evento, e.fecha_evento, p.nombres AS nombre_asistente, p.apellidos AS apellido_asistente, i.codigo_qr
FROM inscripcion i
JOIN evento e ON i.evento_id = e.evento_id
JOIN asistente a ON i.asistente_id = a.asistente_id
JOIN persona p ON a.persona_id = p.persona_id
ORDER BY e.fecha_evento ASC, i.inscripcion_id;

select * from persona
select * from persona_telefono