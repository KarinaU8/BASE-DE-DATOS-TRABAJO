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
