CREATE DATABASE tienda_abarrotes;
GO
USE tienda_abarrotes;
GO
CREATE TABLE productos (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    stock INT
);
