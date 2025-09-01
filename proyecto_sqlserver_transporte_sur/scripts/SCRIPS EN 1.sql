IF DB_ID('MantenimientoVehicular') IS NOT NULL
    DROP DATABASE MantenimientoVehicular;
GO

CREATE DATABASE MantenimientoVehicular;
GO

USE MantenimientoVehicular;
GO

CREATE TABLE Clientes (
    codigo_cliente INT PRIMARY KEY,
    nombres NVARCHAR(100),
    apellidos NVARCHAR(100),
    razon_social NVARCHAR(150),
    direccion NVARCHAR(200),
    telefono NVARCHAR(20),
    correo NVARCHAR(100)
);

CREATE TABLE Vehiculos (
    codigo_vehiculo INT PRIMARY KEY,
    codigo_cliente INT,
    placa NVARCHAR(20),
    marca NVARCHAR(50),
    modelo NVARCHAR(50),
    anio INT,
    tipo NVARCHAR(50),
    FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo_cliente)
);

CREATE TABLE Tecnicos (
    codigo_tecnico INT PRIMARY KEY,
    nombres NVARCHAR(100),
    apellidos NVARCHAR(100),
    especialidad NVARCHAR(100),
    telefono NVARCHAR(20),
    correo NVARCHAR(100)
);

CREATE TABLE Mantenimientos (
    codigo_mantenimiento INT PRIMARY KEY,
    codigo_vehiculo INT,
    codigo_tecnico INT,
    tipo_mantenimiento NVARCHAR(100),
    descripcion NVARCHAR(200),
    fecha_programada DATE,
    estado NVARCHAR(50),
    FOREIGN KEY (codigo_vehiculo) REFERENCES Vehiculos(codigo_vehiculo),
    FOREIGN KEY (codigo_tecnico) REFERENCES Tecnicos(codigo_tecnico)
);

INSERT INTO Clientes VALUES
(1, 'Juan', 'Pérez', 'Transporte Pérez SAC', 'Av. Siempre Viva 123', '999111222', 'juanperez@email.com'),
(2, 'María', 'Gonzales', 'Logística Gonzales', 'Jr. Lima 456', '988777444', 'mariagonzales@email.com'),
(3, 'Luis', 'Ramírez', 'Ramírez Cargo', 'Calle Central 789', '977555333', 'luisramirez@email.com'),
(4, 'Carmen', 'Vargas', 'Vargas Transportes', 'Av. Principal 1020', '966111999', 'carmenvargas@email.com'),
(5, 'José', 'Torres', 'Torres Distribuciones', 'Jr. Comercio 654', '955222888', 'josetorres@email.com');
