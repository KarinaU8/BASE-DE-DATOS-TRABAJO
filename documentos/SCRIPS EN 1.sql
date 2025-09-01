
CREATE DATABASE MantenimientoVehicular;
GO

USE MantenimientoVehicular;
GO

CREATE TABLE Clientes (
    codigo_cliente INT PRIMARY KEY,
    nombres NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    razon_social NVARCHAR(150),
    direccion NVARCHAR(200),
    telefono NVARCHAR(20),
    correo NVARCHAR(100)
);

CREATE TABLE Vehiculos (
    codigo_vehiculo INT PRIMARY KEY,
    codigo_cliente INT NOT NULL,
    placa NVARCHAR(20) NOT NULL,
    marca NVARCHAR(50) NOT NULL,
    modelo NVARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    tipo NVARCHAR(50),
    FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo_cliente)
);

CREATE TABLE Tecnicos (
    codigo_tecnico INT PRIMARY KEY,
    nombres NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    especialidad NVARCHAR(100),
    telefono NVARCHAR(20),
    correo NVARCHAR(100)
);

CREATE TABLE Mantenimientos (
    codigo_mantenimiento INT PRIMARY KEY,
    codigo_vehiculo INT NOT NULL,
    codigo_tecnico INT NOT NULL,
    tipo_mantenimiento NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200),
    fecha_programada DATE NOT NULL,
    estado NVARCHAR(50) NOT NULL,
    FOREIGN KEY (codigo_vehiculo) REFERENCES Vehiculos(codigo_vehiculo),
    FOREIGN KEY (codigo_tecnico) REFERENCES Tecnicos(codigo_tecnico)
);

INSERT INTO Clientes VALUES
(1, 'Juan', 'Pérez', 'Transporte Pérez SAC', 'Av. Siempre Viva 123', '999111222', 'juanperez@email.com'),
(2, 'María', 'Gonzales', 'Logística Gonzales', 'Jr. Lima 456', '988777444', 'mariagonzales@email.com'),
(3, 'Luis', 'Ramírez', 'Ramírez Cargo', 'Calle Central 789', '977555333', 'luisramirez@email.com'),
(4, 'Carmen', 'Vargas', 'Vargas Transportes', 'Av. Principal 1020', '966111999', 'carmenvargas@email.com'),
(5, 'José', 'Torres', 'Torres Distribuciones', 'Jr. Comercio 654', '955222888', 'josetorres@email.com'),
(6, 'Elena', 'Morales', 'Morales Express', 'Av. Industrial 202', '933444555', 'elenamorales@email.com'),
(7, 'Andrés', 'Flores', 'Flores Cargo', 'Jr. Libertad 321', '944555666', 'andresflores@email.com'),
(8, 'Rosa', 'Martínez', 'Martínez SAC', 'Calle Unión 808', '955666777', 'rosamartinez@email.com'),
(9, 'Diego', 'Castillo', 'Castillo Transportes', 'Av. Sur 110', '977888999', 'diegocastillo@email.com'),
(10, 'Lucía', 'Mendoza', 'Mendoza Logistics', 'Jr. Comercio 222', '988999000', 'luciamendoza@email.com');

INSERT INTO Vehiculos VALUES
(1, 1, 'ABC123', 'Toyota', 'Hilux', 2019, 'Camioneta'),
(2, 1, 'XYZ987', 'Hyundai', 'Santa Fe', 2020, 'SUV'),
(3, 2, 'LMN456', 'Volvo', 'FH16', 2018, 'Camión'),
(4, 3, 'QWE789', 'Mercedes', 'Sprinter', 2021, 'Van'),
(5, 4, 'JKL321', 'Nissan', 'Navara', 2017, 'Pick-up'),
(6, 5, 'OPQ654', 'Scania', 'R450', 2022, 'Camión'),
(7, 2, 'RST852', 'Isuzu', 'NQR', 2016, 'Camión Mediano'),
(8, 3, 'UVW963', 'Ford', 'Transit', 2019, 'Van'),
(9, 6, 'HJK741', 'Chevrolet', 'D-Max', 2020, 'Camioneta'),
(10, 7, 'BNM258', 'MAN', 'TGX', 2021, 'Camión'),
(11, 8, 'PLQ369', 'Renault', 'Kangoo', 2019, 'Furgón'),
(12, 9, 'GHJ147', 'Kia', 'Sportage', 2018, 'SUV'),
(13, 10, 'VBN753', 'Mitsubishi', 'Fuso', 2022, 'Camión'),
(14, 6, 'YUI852', 'Peugeot', 'Partner', 2020, 'Furgoneta'),
(15, 7, 'TRE963', 'Volkswagen', 'Crafter', 2019, 'Van');

INSERT INTO Tecnicos VALUES
(1, 'Carlos', 'Lopez', 'Mecánica General', '955111333', 'carloslopez@email.com'),
(2, 'Ana', 'Torres', 'Electrónica', '955222444', 'anatorres@email.com'),
(3, 'Pedro', 'Sánchez', 'Motor Diesel', '955333555', 'pedrosanchez@email.com'),
(4, 'Lucía', 'Fernández', 'Frenos y Suspensión', '955444666', 'luciafernandez@email.com'),
(5, 'Miguel', 'Castro', 'Transmisiones', '955555777', 'miguelcastro@email.com'),
(6, 'Sofía', 'García', 'Electricidad Automotriz', '955666888', 'sofiagarcia@email.com'),
(7, 'Hugo', 'Ramírez', 'Chapa y Pintura', '955777999', 'hugoramirez@email.com'),
(8, 'Patricia', 'Reyes', 'Diagnóstico Computarizado', '955888000', 'patriciareyes@email.com');

INSERT INTO Mantenimientos VALUES
(1, 1, 1, 'Preventivo', 'Cambio de aceite y filtros', '2025-09-10', 'Pendiente'),
(2, 2, 2, 'Correctivo', 'Reparación sistema eléctrico', '2025-09-15', 'Pendiente'),
(3, 3, 3, 'Preventivo', 'Revisión general motor', '2025-09-20', 'Pendiente'),
(4, 4, 4, 'Correctivo', 'Cambio de frenos', '2025-09-25', 'Pendiente'),
(5, 5, 5, 'Preventivo', 'Revisión suspensión', '2025-09-28', 'Pendiente'),
(6, 6, 6, 'Correctivo', 'Reparación transmisión', '2025-10-02', 'Pendiente'),
(7, 7, 2, 'Preventivo', 'Chequeo eléctrico', '2025-10-05', 'Pendiente'),
(8, 8, 3, 'Correctivo', 'Cambio de inyectores', '2025-10-08', 'Pendiente'),
(9, 9, 7, 'Correctivo', 'Pintura general', '2025-10-12', 'Pendiente'),
(10, 10, 8, 'Preventivo', 'Diagnóstico computarizado', '2025-10-15', 'Pendiente'),
(11, 11, 1, 'Correctivo', 'Revisión de caja de cambios', '2025-10-18', 'Pendiente'),
(12, 12, 4, 'Preventivo', 'Cambio de pastillas de freno', '2025-10-20', 'Pendiente'),
(13, 13, 5, 'Correctivo', 'Reparación de embrague', '2025-10-22', 'Pendiente'),
(14, 14, 6, 'Preventivo', 'Revisión eléctrica', '2025-10-25', 'Pendiente'),
(15, 15, 8, 'Correctivo', 'Revisión computadora de abordo', '2025-10-28', 'Pendiente');

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

SELECT v.placa, m.tipo_mantenimiento, m.descripcion, m.estado
FROM Mantenimientos m
INNER JOIN Vehiculos v ON m.codigo_vehiculo = v.codigo_vehiculo
WHERE m.tipo_mantenimiento = 'Correctivo';

SELECT placa, marca, modelo, anio
FROM Vehiculos
ORDER BY anio DESC;

SELECT estado, COUNT(*) AS total
FROM Mantenimientos
GROUP BY estado;
