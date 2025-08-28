USE TransporteSur;
GO


SELECT * FROM Clientes;
GO


SELECT c.nombres, c.apellidos, v.placa, v.anio_fabricacion, v.color
FROM Clientes c
INNER JOIN Vehiculos v ON c.codigo = v.codigo_cliente;
GO


SELECT pm.codigo, pm.tipo, pm.fecha, pm.costo,
       t.nombres AS tecnico, v.placa AS vehiculo, c.nombres AS cliente
FROM PlanesMantenimiento pm
INNER JOIN Tecnicos t ON pm.codigo_tecnico = t.codigo
INNER JOIN Vehiculos v ON pm.codigo_vehiculo = v.codigo
INNER JOIN Clientes c ON v.codigo_cliente = c.codigo
ORDER BY pm.fecha DESC;
GO


SELECT * FROM Tecnicos
WHERE especialidad = 'Mecánica General'
ORDER BY apellidos ASC;
GO


SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Clientes';
GO
