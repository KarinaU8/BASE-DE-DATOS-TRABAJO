CREATE DATABASE TransporteSur;
GO
USE TransporteSur;
GO

CREATE TABLE Clientes (
    codigo NVARCHAR(20) PRIMARY KEY,
    nombres NVARCHAR(100),
    apellidos NVARCHAR(100),
    direccion NVARCHAR(150),
    sexo NVARCHAR(10),
    correo NVARCHAR(100),
    celular NVARCHAR(20)
);
GO

CREATE TABLE Vehiculos (
    codigo NVARCHAR(20) PRIMARY KEY,
    placa NVARCHAR(20) NOT NULL,
    numero_serie NVARCHAR(50),
    anio_fabricacion INT,
    color NVARCHAR(30),
    cantidad_puertas INT,
    cilindrada DECIMAL(5,2),
    codigo_cliente NVARCHAR(20) NOT NULL,
    CONSTRAINT FK_Vehiculo_Cliente FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo)
);
GO

CREATE TABLE Tecnicos (
    codigo NVARCHAR(20) PRIMARY KEY,
    nombres NVARCHAR(100),
    apellidos NVARCHAR(100),
    direccion NVARCHAR(150),
    sexo NVARCHAR(10),
    correo NVARCHAR(100),
    celular NVARCHAR(20),
    especialidad NVARCHAR(100),
    tiempo_servicio INT
);
GO

CREATE TABLE Usuarios (
    nombre_usuario NVARCHAR(50) PRIMARY KEY,
    contrasena NVARCHAR(100)
);
GO

CREATE TABLE PlanesMantenimiento (
    codigo NVARCHAR(20) PRIMARY KEY,
    codigo_tecnico NVARCHAR(20) NOT NULL,
    codigo_vehiculo NVARCHAR(20) NOT NULL,
    tipo NVARCHAR(50),
    kilometraje INT,
    falla NVARCHAR(200),
    fecha DATE,
    costo DECIMAL(10,2),
    CONSTRAINT FK_PM_Tecnico FOREIGN KEY (codigo_tecnico) REFERENCES Tecnicos(codigo),
    CONSTRAINT FK_PM_Vehiculo FOREIGN KEY (codigo_vehiculo) REFERENCES Vehiculos(codigo)
);
GO
