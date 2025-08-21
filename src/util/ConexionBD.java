package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=TiendaAbarrotes;encrypt=false;";
    private static final String USER = "sa";
    private static final String PASSWORD = "123qweasd"; // cambia por tu clave de SQL Server

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
