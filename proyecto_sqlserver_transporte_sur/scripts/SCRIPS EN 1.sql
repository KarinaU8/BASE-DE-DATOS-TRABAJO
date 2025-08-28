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
('C002', 'María', 'López', 'Jr. Los Olivos 456', 'F', 'maria.lopez@correo.com', '912345678'),
('C003', 'Pedro', 'García', 'Av. Los Pinos 789', 'M', 'pedro.garcia@correo.com', '934567890'),
('C004', 'Ana', 'Martínez', 'Jr. Las Flores 321', 'F', 'ana.martinez@correo.com', '945678901'),
('C005', 'Luis', 'Rodríguez', 'Calle Real 654', 'M', 'luis.rodriguez@correo.com', '956789012'),
('C006', 'Carmen', 'Sánchez', 'Av. Central 987', 'F', 'carmen.sanchez@correo.com', '967890123'),
('C007', 'Jorge', 'Hernández', 'Jr. Libertad 456', 'M', 'jorge.hernandez@correo.com', '978901234');
GO

INSERT INTO Vehiculos VALUES
('V001', 'ABC-123', 'SN123456', 2018, 'Rojo', 4, 1.60, 'C001'),
('V002', 'XYZ-789', 'SN789012', 2020, 'Negro', 4, 2.00, 'C002'),
('V003', 'DEF-456', 'SN345678', 2019, 'Azul', 4, 1.80, 'C003'),
('V004', 'GHI-789', 'SN456789', 2021, 'Blanco', 2, 2.50, 'C004'),
('V005', 'JKL-012', 'SN567890', 2017, 'Verde', 4, 1.60, 'C005'),
('V006', 'MNO-345', 'SN678901', 2022, 'Gris', 4, 2.00, 'C006'),
('V007', 'PQR-678', 'SN789012', 2020, 'Plateado', 2, 3.00, 'C007');
GO

INSERT INTO Tecnicos VALUES
('T001', 'Carlos', 'Ramos', 'Calle 1', 'M', 'carlos.ramos@correo.com', '900111222', 'Mecánica General', 5),
('T002', 'Luisa', 'Gómez', 'Calle 2', 'F', 'luisa.gomez@correo.com', '900333444', 'Electricidad Auto', 3),
('T003', 'Miguel', 'Torres', 'Av. Tecnológica 123', 'M', 'miguel.torres@correo.com', '911222333', 'Suspensión y Dirección', 7),
('T004', 'Elena', 'Castro', 'Calle Mecánica 456', 'F', 'elena.castro@correo.com', '922333444', 'Transmisión', 4),
('T005', 'Roberto', 'Mendoza', 'Jr. Motor 789', 'M', 'roberto.mendoza@correo.com', '933444555', 'Frenos', 6),
('T006', 'Sofía', 'Rojas', 'Av. Automotriz 321', 'F', 'sofia.rojas@correo.com', '944555666', 'Aire Acondicionado', 3);
GO

INSERT INTO Usuarios VALUES
('admin', '123qweasd'),
('user1', 'abc123'),
('tecnico1', 'tec123'),
('tecnico2', 'tec456'),
('supervisor', 'sup789'),
('recepcion', 'rec012');
GO

INSERT INTO PlanesMantenimiento VALUES
('PM001', 'T001', 'V001', 'Cambio de aceite', 45000, 'Rutina', '2025-08-01', 120.00),
('PM002', 'T002', 'V002', 'Revisión eléctrica', 30000, 'Luces fallan', '2025-08-10', 180.00),
('PM003', 'T003', 'V003', 'Alineación y balanceo', 52000, 'Vibración al conducir', '2025-08-15', 150.00),
('PM004', 'T004', 'V004', 'Cambio de transmisión', 28000, 'Problemas al cambiar marchas', '2025-08-20', 350.00),
('PM005', 'T005', 'V005', 'Revisión de frenos', 61000, 'Ruido al frenar', '2025-08-25', 200.00),
('PM006', 'T006', 'V006', 'Mantenimiento de aire acondicionado', 19000, 'No enfría', '2025-09-01', 180.00),
('PM007', 'T001', 'V007', 'Cambio de bujías', 43000, 'Pérdida de potencia', '2025-09-05', 130.00);
GO

-- Consultas
SELECT * FROM Clientes;

SELECT c.nombres, c.apellidos, v.placa, v.anio_fabricacion, v.color
FROM Clientes c
INNER JOIN Vehiculos v ON c.codigo = v.codigo_cliente;

SELECT pm.codigo, pm.tipo, pm.fecha, pm.costo,
       t.nombres AS tecnico, v.placa AS vehiculo, c.nombres AS cliente
FROM PlanesMantenimiento pm
INNER JOIN Tecnicos t ON pm.codigo_tecnico = t.codigo
INNER JOIN Vehiculos v ON pm.codigo_vehiculo = v.codigo
INNER JOIN Clientes c ON v.codigo_cliente = c.codigo;
GO
