import java.io.*;
import java.sql.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        boolean salir = false;

        if(!login()) {
            System.out.println("Usuario o clave incorrectos.");
            return;
        }

        while(!salir) {
            System.out.println("\n--- MENU TIENDA ABARROTES ---");
            System.out.println("1. Agregar producto");
            System.out.println("2. Listar productos");
            System.out.println("3. Salir");
            System.out.print("Elige una opcion: ");
            int op = sc.nextInt();
            sc.nextLine();

            switch(op) {
                case 1:
                    agregarProducto(sc);
                    break;
                case 2:
                    listarProductos();
                    break;
                case 3:
                    salir = true;
                    break;
                default:
                    System.out.println("Opcion no valida.");
            }
        }
    }

    private static boolean login() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Usuario: ");
        String user = sc.nextLine();
        System.out.print("Clave: ");
        String pass = sc.nextLine();

        try(BufferedReader br = new BufferedReader(new FileReader("usuarios.txt"))) {
            String linea;
            while((linea = br.readLine()) != null) {
                String[] datos = linea.split(",");
                if(datos.length == 2) {
                    if(datos[0].equals(user) && datos[1].equals(pass)) {
                        return true;
                    }
                }
            }
        } catch(IOException e) {
            System.out.println("Error leyendo usuarios.txt");
        }
        return false;
    }

    private static void agregarProducto(Scanner sc) {
        try {
            System.out.print("Nombre: ");
            String nombre = sc.nextLine();
            System.out.print("Precio: ");
            double precio = sc.nextDouble();
            System.out.print("Stock: ");
            int stock = sc.nextInt();
            sc.nextLine();

            Producto p = new Producto(nombre, precio, stock);

            // Guardar en archivo
            try(PrintWriter pw = new PrintWriter(new FileWriter("productos.txt", true))) {
                pw.println(p.getNombre() + "," + p.getPrecio() + "," + p.getStock());
            }

            // Guardar en BD
            Connection con = ConexionBD.getConnection();
            String sql = "INSERT INTO productos(nombre, precio, stock) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setDouble(2, precio);
            ps.setInt(3, stock);
            ps.executeUpdate();
            con.close();

            System.out.println("Producto agregado.");
        } catch(Exception e) {
            System.out.println("Error al agregar producto: " + e.getMessage());
        }
    }

    private static void listarProductos() {
        System.out.println("\n--- Productos en archivo ---");
        try(BufferedReader br = new BufferedReader(new FileReader("productos.txt"))) {
            String linea;
            while((linea = br.readLine()) != null) {
                System.out.println(linea);
            }
        } catch(IOException e) {
            System.out.println("No hay productos en archivo.");
        }

        System.out.println("\n--- Productos en BD ---");
        try {
            Connection con = ConexionBD.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM productos");
            while(rs.next()) {
                System.out.println(rs.getInt("id") + " - " +
                                   rs.getString("nombre") + " - " +
                                   rs.getDouble("precio") + " - " +
                                   rs.getInt("stock"));
            }
            con.close();
        } catch(Exception e) {
            System.out.println("Error al listar productos BD: " + e.getMessage());
        }
    }
}
