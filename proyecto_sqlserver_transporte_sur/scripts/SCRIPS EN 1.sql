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

INSERT INTO Clientes (codigo_cliente, tipo_cliente, razon_social, nombres, apellidos, dni_ruc, direccion, telefono, correo) VALUES
('CLI001', 'Empresa', 'MINERA ANDINA SAC', NULL, NULL, '20123456789', 'Av. Los Mineros 123', '0144112233', 'contacto@mineraandina.com'),
('CLI002', 'Particular', NULL, 'Juan', 'Pérez García', '12345678', 'Jr. Lima 456', '999888777', 'juan.perez@email.com'),
('CLI003', 'Empresa', 'TRANSPORTES SUR PERUANO', NULL, NULL, '20234567890', 'Carretera Panamericana Km 25', '0144556677', 'info@transportsur.com'),
('CLI004', 'Particular', NULL, 'María', 'Gómez López', '87654321', 'Av. Arequipa 789', '999777666', 'maria.gomez@email.com');

INSERT INTO Vehiculos (codigo_vehiculo, placa, marca, modelo, año_fabricacion, color, numero_serie, tipo_vehiculo, kilometraje_actual, codigo_cliente, fecha_compra, estado) VALUES
('VH001', 'ABC-123', 'Volvo', 'FH16', 2022, 'Blanco', 'VIN123456789', 'Camion', 125000, 'CLI001', '2022-03-15', 'Operativo'),
('VH002', 'DEF-456', 'Toyota', 'Hilux', 2021, 'Negro', 'VIN987654321', 'Pickup', 45000, 'CLI002', '2021-05-20', 'Operativo'),
('VH003', 'GHI-789', 'Mercedes', 'Actros', 2020, 'Azul', 'VIN456789123', 'Camion', 185000, 'CLI003', '2020-02-10', 'Mantenimiento'),
('VH004', 'JKL-012', 'Nissan', 'NP300', 2023, 'Rojo', 'VIN321654987', 'Pickup', 22000, 'CLI004', '2023-01-08', 'Operativo'),
('VH005', 'MNO-345', 'CAT', '777D', 2019, 'Amarillo', 'VIN654987321', 'Volquete', 95000, 'CLI001', '2019-11-25', 'Operativo');

INSERT INTO Tecnicos (codigo_tecnico, dni, nombres, apellidos, especialidad, telefono, correo, fecha_contratacion, experiencia_años, salario_base) VALUES
('TEC001', '12345678', 'Luis', 'Torres García', 'Motor', '987654321', 'luis.torres@talleres.com', '2018-03-15', 6, 3500.00),
('TEC002', '87654321', 'Ana', 'Mendoza López', 'Electricidad', '987123456', 'ana.mendoza@talleres.com', '2020-06-20', 4, 2800.00),
('TEC003', '45678912', 'Pedro', 'Silva Rojas', 'Suspension', '987456789', 'pedro.silva@talleres.com', '2019-11-10', 5, 3200.00),
('TEC004', '23456789', 'Carmen', 'Vargas Díaz', 'Frenos', '987789123', 'carmen.vargas@talleres.com', '2022-02-28', 2, 2200.00);

INSERT INTO Mantenimientos (codigo_mantenimiento, codigo_vehiculo, codigo_tecnico, tipo_mantenimiento, descripcion, fecha_programada, fecha_inicio, fecha_fin, kilometraje, costo_estimado, costo_real, estado, observaciones) VALUES
('MAN001', 'VH001', 'TEC001', 'Preventivo', 'Cambio de aceite y filtros', '2024-01-15', '2024-01-15', '2024-01-15', 125000, 250.00, 230.00, 'Completado', 'Mantenimiento rutinario completado sin novedades'),
('MAN002', 'VH003', 'TEC002', 'Correctivo', 'Reparación sistema eléctrico', '2024-02-20', '2024-02-20', NULL, 185000, 480.00, NULL, 'En Proceso', 'Se detectó falla en alternador, en espera de repuesto'),
('MAN003', 'VH002', 'TEC003', 'Preventivo', 'Rotación de llantas y alineamiento', '2024-03-10', NULL, NULL, 45000, 180.00, NULL, 'Pendiente', 'Programado para próxima semana'),
('MAN004', 'VH005', 'TEC001', 'Correctivo', 'Reparación de transmisión', '2024-01-25', '2024-01-25', '2024-01-27', 95000, 1200.00, 1350.00, 'Completado', 'Se cambió conjunto de embrague completo'),
('MAN005', 'VH004', 'TEC004', 'Preventivo', 'Revisión de frenos', '2024-02-05', '2024-02-05', '2024-02-05', 22000, 150.00, 120.00, 'Completado', 'Pastillas en buen estado, solo ajuste');

SELECT * FROM Clientes;
SELECT * FROM Vehiculos;
SELECT * FROM Tecnicos;
SELECT * FROM Mantenimientos;

SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Vehiculos';

SELECT v.codigo_vehiculo, v.placa, c.nombres, c.apellidos, c.razon_social
FROM Vehiculos v
INNER JOIN Clientes c ON v.codigo_cliente = c.codigo_cliente
WHERE v.estado = 'Operativo'
ORDER BY v.kilometraje_actual DESC;
