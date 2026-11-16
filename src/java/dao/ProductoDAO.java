
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import modelo.Producto;
import ConexionBD.ConexionBD;

public class ProductoDAO {

    private Connection conexion;

    public ProductoDAO() {
        conexion = ConexionBD.conectar();
    }

    // CONSULTAR TODOS LOS PRODUCTOS
    public List<Producto> consultarProductos() {

        List<Producto> listaProductos = new ArrayList<>();

        String sql = "SELECT * FROM tblproducto";

        if (conexion == null) {
            System.out.println("No hay conexión con la base de datos.");
            return listaProductos;
        }

        try (PreparedStatement sentencia = conexion.prepareStatement(sql);
             ResultSet resultado = sentencia.executeQuery()) {

            while (resultado.next()) {

                Producto producto = new Producto();

                producto.setIdProducto(resultado.getInt("ProId_Producto"));
                producto.setNombre(resultado.getString("ProNombre"));
                producto.setCategoria(resultado.getString("ProCategoria"));
                producto.setPrecio(resultado.getDouble("ProPrecio"));
                producto.setStock(resultado.getInt("ProStock"));

                listaProductos.add(producto);
            }

        } catch (SQLException e) {
            System.out.println("Error al consultar productos: " + e.getMessage());
        }

        return listaProductos;
    }

    // REGISTRAR UN PRODUCTO
    public boolean insertarProducto(Producto producto) {

        String sql = "INSERT INTO tblproducto "
                + "(ProNombre, ProCategoria, ProPrecio, ProStock) "
                + "VALUES (?, ?, ?, ?)";

        if (conexion == null) {
            return false;
        }

        try (PreparedStatement sentencia = conexion.prepareStatement(sql)) {

            sentencia.setString(1, producto.getNombre());
            sentencia.setString(2, producto.getCategoria());
            sentencia.setDouble(3, producto.getPrecio());
            sentencia.setInt(4, producto.getStock());

            int filasInsertadas = sentencia.executeUpdate();

            return filasInsertadas > 0;

        } catch (SQLException e) {
            System.out.println("Error al insertar producto: " + e.getMessage());
            return false;
        }
    }

    // BUSCAR UN PRODUCTO POR SU ID
    public Producto buscarProductoPorId(int idProducto) {

        String sql = "SELECT * FROM tblproducto WHERE ProId_Producto = ?";

        if (conexion == null) {
            return null;
        }

        try (PreparedStatement sentencia = conexion.prepareStatement(sql)) {

            sentencia.setInt(1, idProducto);

            try (ResultSet resultado = sentencia.executeQuery()) {

                if (resultado.next()) {

                    Producto producto = new Producto();

                    producto.setIdProducto(resultado.getInt("ProId_Producto"));
                    producto.setNombre(resultado.getString("ProNombre"));
                    producto.setCategoria(resultado.getString("ProCategoria"));
                    producto.setPrecio(resultado.getDouble("ProPrecio"));
                    producto.setStock(resultado.getInt("ProStock"));

                    return producto;
                }
            }

        } catch (SQLException e) {
            System.out.println("Error al buscar producto: " + e.getMessage());
        }

        return null;
    }

    // ACTUALIZAR UN PRODUCTO
    public boolean actualizarProducto(Producto producto) {

        String sql = "UPDATE tblproducto SET "
                + "ProNombre = ?, "
                + "ProCategoria = ?, "
                + "ProPrecio = ?, "
                + "ProStock = ? "
                + "WHERE ProId_Producto = ?";

        if (conexion == null) {
            return false;
        }

        try (PreparedStatement sentencia = conexion.prepareStatement(sql)) {

            sentencia.setString(1, producto.getNombre());
            sentencia.setString(2, producto.getCategoria());
            sentencia.setDouble(3, producto.getPrecio());
            sentencia.setInt(4, producto.getStock());
            sentencia.setInt(5, producto.getIdProducto());

            int filasActualizadas = sentencia.executeUpdate();

            return filasActualizadas > 0;

        } catch (SQLException e) {
            System.out.println("Error al actualizar producto: " + e.getMessage());
            return false;
        }
    }

    // ELIMINAR UN PRODUCTO
    public boolean eliminarProducto(int idProducto) {

        String sql = "DELETE FROM tblproducto WHERE ProId_Producto = ?";

        if (conexion == null) {
            return false;
        }

        try (PreparedStatement sentencia = conexion.prepareStatement(sql)) {

            sentencia.setInt(1, idProducto);

            int filasEliminadas = sentencia.executeUpdate();

            return filasEliminadas > 0;

        } catch (SQLException e) {
            System.out.println("Error al eliminar producto: " + e.getMessage());
            return false;
        }
    }
}
