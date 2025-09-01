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
