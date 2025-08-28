USE TransporteSur;
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
