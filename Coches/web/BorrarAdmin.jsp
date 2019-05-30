<%-- 
    Document   : BorrarAdmin
    Created on : 30-may-2019, 9:08:53
    Author     : FABIO
--%>


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file = "ConectividadBaseDeDatos.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(NombreBaseDatos, nombre, Contrasena);

            Statement s = conexion.createStatement();

            String borrado = "DELETE FROM usuario WHERE id=";
            borrado += request.getParameter("id");

            s.execute(borrado);
            conexion.close();
        %>

        <script>
            //Redirecciona a la página principal
            location.replace("index.jsp");
        </script>
    </body>
</html>