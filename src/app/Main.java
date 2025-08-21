package app;

import autenticacion.Autenticacion;
import gestor.GestorTienda;

public class Main {
    public static void main(String[] args) {
        Autenticacion auth = new Autenticacion();
        if (auth.login()) {
            GestorTienda gestor = new GestorTienda();
            gestor.menu();
        } else {
            System.out.println("Credenciales incorrectas. Cerrando...");
        }
    }
}
