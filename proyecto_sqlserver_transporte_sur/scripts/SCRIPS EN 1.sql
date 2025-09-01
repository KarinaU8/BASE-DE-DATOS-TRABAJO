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

INSERT INTO Vehiculos VALUES
(1, 1, 'ABC123', 'Toyota', 'Hilux', 2019, 'Camioneta'),
(2, 1, 'XYZ987', 'Hyundai', 'Santa Fe', 2020, 'SUV'),
(3, 2, 'LMN456', 'Volvo', 'FH16', 2018, 'Camión'),
(4, 3, 'QWE789', 'Mercedes', 'Sprinter', 2021, 'Van'),
(5, 4, 'JKL321', 'Nissan', 'Navara', 2017, 'Pick-up'),
(6, 5, 'OPQ654', 'Scania', 'R450', 2022, 'Camión'),
(7, 2, 'RST852', 'Isuzu', 'NQR', 2016, 'Camión Mediano'),
(8, 3, 'UVW963', 'Ford', 'Transit', 2019, 'Van');

INSERT INTO Tecnicos VALUES
(1, 'Carlos', 'Lopez', 'Mecánica General', '955111333', 'carloslopez@email.com'),
(2, 'Ana', 'Torres', 'Electrónica', '955222444', 'anatorres@email.com'),
(3, 'Pedro', 'Sánchez', 'Motor Diesel', '955333555', 'pedrosanchez@email.com'),
(4, 'Lucía', 'Fernández', 'Frenos y Suspensión', '955444666', 'luciafernandez@email.com'),
(5, 'Miguel', 'Castro', 'Transmisiones', '955555777', 'miguelcastro@email.com');

INSERT INTO Mantenimientos VALUES
(1, 1, 1, 'Preventivo', 'Cambio de aceite y filtros', '2025-09-10', 'Pendiente'),
(2, 2, 2, 'Correctivo', 'Reparación sistema eléctrico', '2025-09-15', 'Pendiente'),
(3, 3, 3, 'Preventivo', 'Revisión general motor', '2025-09-20', 'Pendiente'),
(4, 4, 1, 'Correctivo', 'Cambio de frenos', '2025-09-25', 'Pendiente'),
(5, 5, 4, 'Preventivo', 'Revisión suspensión', '2025-09-28', 'Pendiente'),
(6, 6, 5, 'Correctivo', 'Reparación transmisión', '2025-10-02', 'Pendiente'),
(7, 7, 2, 'Preventivo', 'Chequeo eléctrico', '2025-10-05', 'Pendiente'),
(8, 8, 3, 'Correctivo', 'Cambio de inyectores', '2025-10-08', 'Pendiente');

SELECT * FROM Clientes;
SELECT * FROM Vehiculos;
SELECT * FROM Tecnicos;
SELECT * FROM Mantenimientos;

SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Clientes';

SELECT c.nombres, c.apellidos, v.placa, v.marca, v.modelo
FROM Clientes c
INNER JOIN Vehiculos v ON c.codigo_cliente = v.codigo_cliente;

SELECT c.nombres, v.placa, m.tipo_mantenimiento, m.estado, t.nombres AS tecnico
FROM Mantenimientos m
INNER JOIN Vehiculos v ON m.codigo_vehiculo = v.codigo_vehiculo
INNER JOIN Clientes c ON v.codigo_cliente = c.codigo_cliente
INNER JOIN Tecnicos t ON m.codigo_tecnico = t.codigo_tecnico;

SELECT * FROM Mantenimientos
WHERE estado = 'Pendiente'
ORDER BY fecha_programada ASC;
