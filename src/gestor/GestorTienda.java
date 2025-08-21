package gestor;

import entidades.Producto;
import util.ConexionBD;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class GestorTienda {
    private Scanner sc = new Scanner(System.in);

    public void menu() {
        int opcion;
        do {
            System.out.println("\n--- Menú Tienda de Abarrotes ---");
            System.out.println("1. Listar productos");
            System.out.println("2. Registrar producto");
            System.out.println("0. Salir");
            System.out.print("Elige opción: ");
            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion) {
                case 1 -> listarProductos();
                case 2 -> registrarProducto();
                case 0 -> System.out.println("Saliendo...");
                default -> System.out.println("Opción inválida");
            }
        } while (opcion != 0);
    }

    private void listarProductos() {
        List<Producto> lista = new ArrayList<>();
        try (Connection conn = ConexionBD.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM Productos")) {

            while (rs.next()) {
                Producto p = new Producto(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getDouble("precio"),
                        rs.getInt("stock")
                );
                lista.add(p);
            }

            System.out.println("\n--- Lista de Productos ---");
            for (Producto p : lista) {
                System.out.println(p.getId() + " | " + p.getNombre() + " | S/" + p.getPrecio() + " | Stock: " + p.getStock());
            }

        } catch (SQLException e) {
            System.out.println("Error al listar productos: " + e.getMessage());
        }
    }

    private void registrarProducto() {
        System.out.print("Nombre: ");
        String nombre = sc.nextLine();
        System.out.print("Precio: ");
        double precio = sc.nextDouble();
        System.out.print("Stock: ");
        int stock = sc.nextInt();
        sc.nextLine();

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO Productos(nombre, precio, stock) VALUES (?, ?, ?)")) {

            ps.setString(1, nombre);
            ps.setDouble(2, precio);
            ps.setInt(3, stock);
            ps.executeUpdate();
            System.out.println("Producto registrado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al registrar producto: " + e.getMessage());
        }
    }
}
