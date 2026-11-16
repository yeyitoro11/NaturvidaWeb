
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Producto"%>

<%
    Producto producto = (Producto) request.getAttribute("producto");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar producto - Naturvida</title>
</head>
<body>

    <h1>Naturvida</h1>
    <h2>Editar producto</h2>

    <form action="<%= request.getContextPath() %>/ProductoServlet" method="POST">

        <input type="hidden" name="accion" value="actualizar">

        <input type="hidden" name="idProducto"
               value="<%= producto.getIdProducto() %>">

        <label for="nombre">Nombre del producto:</label><br>
        <input type="text" id="nombre" name="nombre"
               value="<%= producto.getNombre() %>" required>
        <br><br>

        <label for="categoria">Categoría:</label><br>
        <input type="text" id="categoria" name="categoria"
               value="<%= producto.getCategoria() %>" required>
        <br><br>

        <label for="precio">Precio:</label><br>
        <input type="number" id="precio" name="precio"
               value="<%= producto.getPrecio() %>"
               min="0" step="0.01" required>
        <br><br>

        <label for="stock">Stock:</label><br>
        <input type="number" id="stock" name="stock"
               value="<%= producto.getStock() %>"
               min="0" step="1" required>
        <br><br>

        <button type="submit">Guardar cambios</button>

    </form>

    <br>

    <a href="<%= request.getContextPath() %>/ProductoServlet">
        Volver al listado de productos
    </a>

</body>
</html>
