USE TransporteSur;
GO

-- 1) Todos los clientes
SELECT * FROM Clientes;
GO

-- 2) Vehículos por cliente (INNER JOIN)
SELECT c.nombres, c.apellidos, v.placa, v.anio_fabricacion, v.color
FROM Clientes c
INNER JOIN Vehiculos v ON c.codigo = v.codigo_cliente;
GO

-- 3) Planes de mantenimiento con técnico, vehículo y cliente
SELECT pm.codigo, pm.tipo, pm.fecha, pm.costo,
       t.nombres AS tecnico, v.placa AS vehiculo, c.nombres AS cliente
FROM PlanesMantenimiento pm
INNER JOIN Tecnicos t ON pm.codigo_tecnico = t.codigo
INNER JOIN Vehiculos v ON pm.codigo_vehiculo = v.codigo
INNER JOIN Clientes c ON v.codigo_cliente = c.codigo
ORDER BY pm.fecha DESC;
GO

-- 4) Técnicos Mecánica General (WHERE + ORDER BY)
SELECT * FROM Tecnicos
WHERE especialidad = 'Mecánica General'
ORDER BY apellidos ASC;
GO

-- 5) Metadata de tabla Clientes
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Clientes';
GO
