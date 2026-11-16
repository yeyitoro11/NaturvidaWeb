
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import dao.ProductoDAO;
import modelo.Producto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {

    // CONSULTAR PRODUCTOS O BUSCAR UNO PARA EDITAR
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        ProductoDAO dao = new ProductoDAO();

        if ("editar".equals(accion)) {

            try {
                int id = Integer.parseInt(request.getParameter("id"));

                Producto producto = dao.buscarProductoPorId(id);

                if (producto == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND,
                            "Producto no encontrado.");
                    return;
                }

                request.setAttribute("producto", producto);
                request.getRequestDispatcher("/editarProducto.jsp")
                        .forward(request, response);

            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                        "El ID del producto no es válido.");
            }

        } else {

            List<Producto> listaProductos = dao.consultarProductos();

            request.setAttribute("listaProductos", listaProductos);

            request.getRequestDispatcher("/productos.jsp")
                    .forward(request, response);
        }
    }

    // REGISTRAR, ACTUALIZAR O ELIMINAR
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");

        // REGISTRAR PRODUCTO
        if (accion == null || accion.isEmpty() || "registrar".equals(accion)) {

            String nombre = request.getParameter("nombre");
            String categoria = request.getParameter("categoria");
            String precioTexto = request.getParameter("precio");
            String stockTexto = request.getParameter("stock");

            try {
                double precio = Double.parseDouble(precioTexto);
                int stock = Integer.parseInt(stockTexto);

                if (nombre == null || nombre.trim().isEmpty()
                        || categoria == null || categoria.trim().isEmpty()
                        || precio < 0 || stock < 0) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                            "Verifica los datos del producto.");
                    return;
                }

                Producto producto = new Producto();
                producto.setNombre(nombre);
                producto.setCategoria(categoria);
                producto.setPrecio(precio);
                producto.setStock(stock);

                ProductoDAO dao = new ProductoDAO();
                boolean guardado = dao.insertarProducto(producto);

                if (guardado) {
                    response.sendRedirect(request.getContextPath()
                            + "/ProductoServlet?mensaje=registrado");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                            "No se pudo registrar el producto.");
                }

            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                        "El precio y el stock deben tener valores numéricos válidos.");
            }

        // ACTUALIZAR PRODUCTO
        } else if ("actualizar".equals(accion)) {

            try {
                int id = Integer.parseInt(request.getParameter("idProducto"));
                String nombre = request.getParameter("nombre");
                String categoria = request.getParameter("categoria");
                double precio = Double.parseDouble(request.getParameter("precio"));
                int stock = Integer.parseInt(request.getParameter("stock"));

                if (nombre == null || nombre.trim().isEmpty()
                        || categoria == null || categoria.trim().isEmpty()
                        || precio < 0 || stock < 0) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                            "Verifica los datos del producto.");
                    return;
                }

                Producto producto = new Producto();
                producto.setIdProducto(id);
                producto.setNombre(nombre);
                producto.setCategoria(categoria);
                producto.setPrecio(precio);
                producto.setStock(stock);

                ProductoDAO dao = new ProductoDAO();
                boolean actualizado = dao.actualizarProducto(producto);

                if (actualizado) {
                    response.sendRedirect(request.getContextPath()
                            + "/ProductoServlet?mensaje=actualizado");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                            "No se pudo actualizar el producto.");
                }

            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                        "Los datos numéricos no son válidos.");
            }

        // ELIMINAR PRODUCTO
        } else if ("eliminar".equals(accion)) {

            try {
                int id = Integer.parseInt(request.getParameter("idProducto"));

                ProductoDAO dao = new ProductoDAO();
                boolean eliminado = dao.eliminarProducto(id);

                if (eliminado) {
                    response.sendRedirect(request.getContextPath()
                            + "/ProductoServlet?mensaje=eliminado");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                            "No se pudo eliminar el producto.");
                }

            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                        "El ID del producto no es válido.");
            }

        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "La acción solicitada no es válida.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gestionar los productos de Naturvida";
    }
}

