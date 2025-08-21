# Tienda de Abarrotes

Proyecto simple en Java con SQL Server y archivos TXT.

## Archivos importantes
- `Main.java`: menú principal.
- `ConexionBD.java`: conexión a SQL Server.
- `Producto.java`: clase de producto.
- `usuarios.txt`: usuarios para login (ejemplo: admin,123qweasd).
- `productos.txt`: archivo donde se guardan productos.
- `tienda_abarrotes.sql`: script para crear la base de datos.

## Ejecución
1. Crear la base en SQL Server con `tienda_abarrotes.sql`.
2. Editar `ConexionBD.java` con tu usuario y clave de SQL Server.
3. Compilar:
   ```bash
   javac Main.java ConexionBD.java Producto.java
   ```
4. Ejecutar:
   ```bash
   java Main
   ```

Usuario por defecto: `admin`  
Clave: `123qweasd`
