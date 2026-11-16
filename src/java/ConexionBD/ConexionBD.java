
package ConexionBD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    private static final String URL = "jdbc:mysql://localhost:3306/tienda_naturista";
    private static final String USUARIO = "root";
    private static final String CONTRASEÑA =
        System.getenv().getOrDefault("DB_PASSWORD", "CAMBIAR_CONTRASEÑA");

    public static Connection conectar() {
        Connection conexion = null;

        try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    conexion = DriverManager.getConnection(URL, USUARIO, CONTRASEÑA);
    System.out.println("Conexion exitosa a la base de datos.");

} catch (ClassNotFoundException | SQLException e) {
    System.out.println("Error de conexion: " + e.getMessage());
}

        return conexion;
    }
}
