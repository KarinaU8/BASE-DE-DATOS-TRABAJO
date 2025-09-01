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
END
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Vehiculos' AND xtype='U')
BEGIN
    CREATE TABLE Vehiculos (
        codigo_vehiculo VARCHAR(10) PRIMARY KEY,
        placa VARCHAR(10) UNIQUE NOT NULL,
        marca VARCHAR(50) NOT NULL,
        modelo VARCHAR(50) NOT NULL,
        año_fabricacion INT CHECK (año_fabricacion > 1990),
        color VARCHAR(20),
        numero_serie VARCHAR(30) UNIQUE,
        tipo_vehiculo VARCHAR(30) CHECK (tipo_vehiculo IN ('Camion', 'Volquete', 'Furgoneta', 'Pickup', 'Automovil')),
        kilometraje_actual INT DEFAULT 0,
        codigo_cliente VARCHAR(10) NOT NULL,
        fecha_compra DATE,
        estado VARCHAR(20) DEFAULT 'Operativo' CHECK (estado IN ('Operativo', 'Mantenimiento', 'Inoperativo')),
        fecha_registro DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo_cliente)
    );
END
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Tecnicos' AND xtype='U')
BEGIN
    CREATE TABLE Tecnicos (
        codigo_tecnico VARCHAR(10) PRIMARY KEY,
        dni VARCHAR(8) UNIQUE NOT NULL,
        nombres VARCHAR(100) NOT NULL,
        apellidos VARCHAR(100) NOT NULL,
        especialidad VARCHAR(50) CHECK (especialidad IN ('Motor', 'Transmision', 'Frenos', 'Electricidad', 'Suspension', 'General')),
        telefono VARCHAR(15),
        correo VARCHAR(100),
        fecha_contratacion DATE,
        experiencia_años INT DEFAULT 0,
        salario_base DECIMAL(8,2),
        activo BIT DEFAULT 1,
        fecha_registro DATETIME DEFAULT GETDATE()
    );
END
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Mantenimientos' AND xtype='U')
BEGIN
    CREATE TABLE Mantenimientos (
        codigo_mantenimiento VARCHAR(10) PRIMARY KEY,
        codigo_vehiculo VARCHAR(10) NOT NULL,
        codigo_tecnico VARCHAR(10) NOT NULL,
        tipo_mantenimiento VARCHAR(50) CHECK (tipo_mantenimiento IN ('Preventivo', 'Correctivo', 'Predictivo')),
        descripcion VARCHAR(200) NOT NULL,
        fecha_programada DATE NOT NULL,
        fecha_inicio DATE NULL,
        fecha_fin DATE NULL,
        kilometraje INT NOT NULL,
        costo_estimado DECIMAL(10,2),
        costo_real DECIMAL(10,2) NULL,
        estado VARCHAR(20) DEFAULT 'Pendiente' CHECK (estado IN ('Pendiente', 'En Proceso', 'Completado', 'Cancelado')),
        observaciones TEXT,
        fecha_registro DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (codigo_vehiculo) REFERENCES Vehiculos(codigo_vehiculo),
        FOREIGN KEY (codigo_tecnico) REFERENCES Tecnicos(codigo_tecnico)
    );
END
GO
