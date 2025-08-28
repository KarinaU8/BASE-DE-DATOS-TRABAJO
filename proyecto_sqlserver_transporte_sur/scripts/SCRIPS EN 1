IF EXISTS (SELECT name FROM sys.databases WHERE name = 'TransporteSur')
    DROP DATABASE TransporteSur;
GO

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

INSERT INTO Clientes VALUES
('C001', 'Juan', 'Pérez', 'Av. Siempre Viva 123', 'M', 'juan.perez@correo.com', '987654321'),
('C002', 'María', 'López', 'Jr. Los Olivos 456', 'F', 'maria.lopez@correo.com', '912345678');
GO

INSERT INTO Vehiculos VALUES
('V001', 'ABC-123', 'SN123456', 2018, 'Rojo', 4, 1.60, 'C001'),
('V002', 'XYZ-789', 'SN789012', 2020, 'Negro', 4, 2.00, 'C002');
GO

INSERT INTO Tecnicos VALUES
('T001', 'Carlos', 'Ramos', 'Calle 1', 'M', 'carlos.ramos@correo.com', '900111222', 'Mecánica General', 5),
('T002', 'Luisa', 'Gómez', 'Calle 2', 'F', 'luisa.gomez@correo.com', '900333444', 'Electricidad Auto', 3);
GO

INSERT INTO Usuarios VALUES
('admin', '123qweasd'),
('user1', 'abc123');
GO

INSERT INTO PlanesMantenimiento VALUES
('PM001', 'T001', 'V001', 'Cambio de aceite', 45000, 'Rutina', '2025-08-01', 120.00),
('PM002', 'T002', 'V002', 'Revisión eléctrica', 30000, 'Luces fallan', '2025-08-10', 180.00);
GO

SELECT * FROM Clientes;

SELECT c.nombres, c.apellidos, v.placa, v.anio_fabricacion, v.color
FROM Clientes c
INNER JOIN Vehiculos v ON c.codigo = v.codigo_cliente;

SELECT pm.codigo, pm.tipo, pm.fecha, pm.costo,
       t.nombres AS tecnico, v.placa AS vehiculo, c.nombres AS cliente
FROM PlanesMantenimiento pm
INNER JOIN Tecnicos t ON pm.cod
