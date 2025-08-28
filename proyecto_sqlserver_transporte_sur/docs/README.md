# Proyecto Base de Datos: Transporte Sur Peruano

Este proyecto fue desarrollado en **SQL Server** basándose en el trabajo previo en Java (clases Cliente, Vehículo, Técnico, Usuario y PlanMantenimiento).

## Contenido

### 📂 scripts/
- **01_crear_bd.sql** → Creación de la base de datos y tablas con PK/FK.
- **02_insertar_datos.sql** → Inserción de datos de ejemplo en todas las tablas.
- **03_consultas_demo.sql** → Consultas SQL (SELECT, INNER JOIN, WHERE, ORDER BY, metadata).

### 📂 docs/
- **diagrama_ER.png** → Diagrama Entidad-Relación.
- **README.md** → Explicación paso a paso.

## Pasos de ejecución
1. Abrir **SQL Server Management Studio** (SSMS).
2. Ejecutar `01_crear_bd.sql` para crear la BD y tablas.
3. Ejecutar `02_insertar_datos.sql` para cargar datos.
4. Ejecutar `03_consultas_demo.sql` para probar consultas de ejemplo.

## Relación con la teoría (PPTs)
- Modelo ER → Tablas y relaciones.
- CREATE DATABASE, CREATE TABLE → Script 01.
- INSERT INTO → Script 02.
- SELECT, INNER JOIN, WHERE, ORDER BY → Script 03.
- INFORMATION_SCHEMA → Metadata (Script 03).
