package autenticacion;

import java.util.Scanner;

public class Autenticacion {
    private final String USUARIO = "admin";
    private final String CLAVE = "123qweasd";

    public boolean login() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Usuario: ");
        String user = sc.nextLine();
        System.out.print("Clave: ");
        String pass = sc.nextLine();

        return user.equals(USUARIO) && pass.equals(CLAVE);
    }
}
