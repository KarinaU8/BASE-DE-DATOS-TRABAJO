USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'TransporteSurPeruano')
BEGIN
    CREATE DATABASE TransporteSurPeruano;
END
GO

USE TransporteSurPeruano;
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Clientes' AND xtype='U')
BEGIN
    CREATE TABLE Clientes (
        codigo_cliente VARCHAR(10) PRIMARY KEY,
        tipo_cliente VARCHAR(20) CHECK (tipo_cliente IN ('Empresa', 'Particular')),
        razon_social VARCHAR(100),
        nombres VARCHAR(100),
        apellidos VARCHAR(100),
        dni_ruc VARCHAR(11) UNIQUE,
        direccion VARCHAR(200),
        telefono VARCHAR(15),
        correo VARCHAR(100),
        fecha_registro DATETIME DEFAULT GETDATE(),
        activo BIT DEFAULT 1
    );
