BEGIN;
-- SEED.SQL
-- Insercion de datos semilla en orden para respetar FK
INSERT INTO persona (nombres, apellidos, email, fecha_nacimiento, dir_calle, dir_ciudad, dir_departamento, dir_pais)
VALUES
('Ana Sofia','Mejia Lopez','ana.mejia@gmail.com','2000-01-02', 'Blvd Morazan','Tegucigalpa','Francisco Morazan','Honduras'),
('Carlos Andres','Rivera Herrera','crivera@gmail.com','1998-03-15','Col. Kennedy Bloque 5','Tegucigalpa','Francisco Morazan','Honduras'),
('Maria Jose','Aguilar Soto','maguilar@yahoo.com','2001-07-22','Res. Las Lomas #12','San Pedro Sula', 'Cortes','Honduras'),
('Luis Fernando','Zuniga Padilla','lzuniga@hotmail.com','1999-11-08','Col. Palmira Av. 3','Tegucigalpa','Francisco Morazan','Honduras'),
('Valeria','Orellana Cruz','vorellana@gmail.com','2002-05-30','Barrio La Granja #7','Choloma','Cortes','Honduras'),
('Jorge Eduardo','Flores Mendez','jflores@outlook.com','1997-09-14','Col. Trejo Calle 2','La Ceiba','Atlantida','Honduras'),
('Daniela Paola','Pineda Fuentes','dpineda@gmail.com','2003-02-18','Res. El Pinar #45','Comayagua','Comayagua','Honduras'),
('Roberto Carlos','Santos Reyes','rsantos@gmail.com','1996-12-03','Barrio Abajo #33','Danli','El Paraiso','Honduras'),
('Alejandra','Bustillo Morales','abustillo@yahoo.com','2000-06-25','Col. San Miguel #8','Santa Rosa de Copan','Copan','Honduras');
COMMIT;

--a) consulta intermedia: obteniendo ID's de personas generadas en transaccion anterior
SELECT persona_id, email FROM persona;

--2) PERSONA_TELEFONO: PK compuesta: evita dplicados por persona
INSERT INTO persona_telefono (persona_id, telefono) VALUES
(1,'9980-8080'),
(2,'9812-3456'),
(3,'3321-7890'),
(3,'9654-0011'),
(3,'8891-4422'),
(4,'9654-2211'),
(5,'3478-9900'),
(5,'9301-5544'),
(6,'9123-4567'),
(7,'3567-8812'),
(7,'9788-3300'),
(7,'3102-6677'),
(8,'9345-6678'),
(9,'3890-1234'),
(9,'9412-8899');

--3) ASISTENTE
INSERT INTO asistente (persona_id, tipo_membresia, fecha_registro) VALUES
(1,'premium','2025-09-21'),
(2,'basica','2025-01-10'),
(3,'premium','2025-02-14'),
(4,'estandar','2025-03-05'),
(5,'basica','2025-03-18'),
(6,'premium','2025-04-02'),
(7,'estandar','2025-04-27'),
(8,'basica','2025-05-09'),
(9,'premium','2025-06-15');

--4) ORGANIZADOR
INSERT INTO organizador (persona_id, organizacion, sitio_web) VALUES
(1,'Eventos Capital','https://eventoscapital.hn'),
(3,'Expo Norte SPS','https://exponortesps.com'),
(5,'Cultura Viva HN','https://culturaviva.hn'),
(7,'TechHub Honduras','https://techhubhonduras.com'),
(9,'Gestión & Negocios','https://gestionnegocios.hn');

--5) EVENTOS
INSERT INTO evento (titulo, categoria, fecha_evento, cupo_maximo, organizador_id)
VALUES
('Feria Tecnológica Honduras 2025','Tecnología','2025-03-15',200, 1),
('Congreso de Emprendimiento Nacional','Negocios','2025-04-10',150, 3),
('Festival Cultural Tegucigalpa','Cultura','2025-05-01',500, 5),
('Expo Salud y Bienestar HN','Salud','2025-05-22',100, 7),
('Hackathon UNAH 2025','Tecnología','2025-06-07',80, 9),
('Cumbre de Liderazgo Juvenil','Educación','2025-07-18',120, 1),
('Festival Gastronómico del Norte','Gastronomía','2025-08-03',350, 3),
('Taller de Marketing Digital','Negocios','2025-08-25',60, 5);

COMMIT;