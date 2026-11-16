
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Producto"%>

<%
    List<Producto> listaProductos =
            (List<Producto>) request.getAttribute("listaProductos");

    String mensaje = request.getParameter("mensaje");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos - Naturvida</title>
</head>
<body>

    <h1>Naturvida</h1>
    <h2>Listado de productos</h2>

    <% if ("registrado".equals(mensaje)) { %>
        <p>Producto registrado correctamente.</p>
    <% } else if ("actualizado".equals(mensaje)) { %>
        <p>Producto actualizado correctamente.</p>
    <% } else if ("eliminado".equals(mensaje)) { %>
        <p>Producto eliminado correctamente.</p>
    <% } %>

    <table border="1" cellpadding="10">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Categoría</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Acciones</th>
            </tr>
        </thead>

        <tbody>
            <% if (listaProductos != null && !listaProductos.isEmpty()) { %>

                <% for (Producto producto : listaProductos) { %>
                    <tr>
                        <td><%= producto.getIdProducto() %></td>
                        <td><%= producto.getNombre() %></td>
                        <td><%= producto.getCategoria() %></td>
                        <td><%= producto.getPrecio() %></td>
                        <td><%= producto.getStock() %></td>

                        <td>
                            <a href="<%= request.getContextPath() %>/ProductoServlet?accion=editar&id=<%= producto.getIdProducto() %>">
                                Editar
                            </a>

                            <form action="<%= request.getContextPath() %>/ProductoServlet"
                                  method="POST"
                                  style="display:inline;"
                                  onsubmit="return confirm('¿Estás segura de eliminar este producto?');">

                                <input type="hidden" name="accion" value="eliminar">

                                <input type="hidden" name="idProducto"
                                       value="<%= producto.getIdProducto() %>">

                                <button type="submit">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                <% } %>

            <% } else { %>
                <tr>
                    <td colspan="6">No hay productos registrados.</td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <br>

    <a href="registrarProducto.html">Registrar nuevo producto</a>

</body>
</html>
