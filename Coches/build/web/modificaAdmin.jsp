<%-- 
    Document   : modificaAdmin
    Created on : 30-may-2019, 9:05:19
    Author     : FABIO
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
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
        <%            request.setCharacterEncoding("UTF-8");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(NombreBaseDatos, nombre, Contrasena);

            Statement s = conexion.createStatement();
            String actualizacion = "UPDATE usuario SET usuario='";
            actualizacion += request.getParameter("usuario");
            actualizacion += "',contrasena='";
            actualizacion += DigestUtils.md5Hex(request.getParameter("contrasena"));
            actualizacion += "' WHERE id =";
            actualizacion += request.getParameter("id");

            s.execute(actualizacion);
            conexion.close();

        %>

        <script>
            //Redirecciona a la página principal
            location.replace("index.jsp");
        </script>
    </body>
</html>