# Laboratorio DML - Select Queries

Este proyecto contiene scripts SQL para un sistema de gestión de eventos en Supabase (PostgreSQL). Incluye el esquema de la base de datos, datos semilla y queries de ejemplo para practicar operaciones DML (Data Manipulation Language).

## Estructura del Proyecto

```
Laboratorio DML - Select Queries/
├── db_design/
│   ├── schema.sql          # Definiciones de tablas (CREATE TABLE)
│   ├── seed.sql            # Datos semilla (INSERTs para poblar la BD)
│   └── supabase_queries.sql # Queries de ejemplo (SELECT, DELETE, etc.)
└── README.md               # Este archivo
```

## Requisitos

- **Base de datos**: PostgreSQL (compatible con Supabase).
- **Herramientas**:
  - VSCode con extensión "PostgreSQL" instalada.
  - Acceso a una instancia de Supabase o PostgreSQL local.

## Configuración y Uso

### 1. Crear la Base de Datos
1. Abre tu proyecto en Supabase (dashboard web) o conecta a PostgreSQL local.
2. Ejecuta los scripts en este orden:

   - **Primero**: `schema.sql` → Crea las tablas y constraints.
   - **Segundo**: `seed.sql` → Inserta datos de ejemplo.
   - **Opcional**: `supabase_queries.sql` → Prueba las queries (selects, joins, etc.).

### 2. Ejecutar en VSCode
1. Instala la extensión "PostgreSQL" en VSCode.
2. Abre la paleta de comandos (Ctrl+Shift+P) y busca "PostgreSQL: Connect".
3. Configura la conexión con tu URL de Supabase (encuéntrala en Settings > Database en el dashboard de Supabase).
4. Selecciona código en los archivos `.sql` y ejecuta con la extensión.

### 3. Descripción de Tablas
- **persona**: Información básica de personas (nombres, email, dirección).
- **persona_telefono**: Teléfonos asociados a personas (relación 1:N).
- **asistente**: Subtipo de persona (quienes asisten a eventos).
- **organizador**: Subtipo de persona (quienes crean eventos).
- **evento**: Eventos creados por organizadores.
- **inscripcion**: Inscripciones de asistentes a eventos (entidad asociativa).

### Notas
- Los datos semilla incluyen 9 personas, con roles de asistentes y organizadores, y 8 eventos.
- Las queries en `supabase_queries.sql` incluyen ejemplos de selects, joins, deletes y truncates.
- Si necesitas más datos o queries, edita los archivos directamente.

¡Listo para practicar DML en PostgreSQL!