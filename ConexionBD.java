import java.sql.*;

public class ConexionBD {
    public static Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://localhost:1433;databaseName=tienda_abarrotes;encrypt=false;";
        String user = "Tomo"; 
        String pass = "123456"; 
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, user, pass);
    }
}
