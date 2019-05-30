<%-- 
    Document   : validaUsuario
    Created on : 15-may-2019, 8:36:37
    Author     : FABIO
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.DriverManager"%> 
<%@page import="java.sql.Connection"%>
<%@include file = "ConectividadBaseDeDatos.jsp"%>


<%    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conexion = DriverManager.getConnection(NombreBaseDatos, nombre, Contrasena);
    
    Statement s = conexion.createStatement();
    
    String UsuarioIntro = request.getParameter("Usuario");
    
    ResultSet listado = s.executeQuery("SELECT  usuario , contrasena FROM usuario "
            + "where id = (select id from usuario where usuario =  '" + UsuarioIntro + "')");
    
    String ContrasenaIntro = DigestUtils.md5Hex(request.getParameter("Contrasena"));
    String user = "";
    String ContrasenaUsu = "";
    
    while (listado.next()) {
        user = listado.getString("usuario");
        ContrasenaUsu = listado.getString("contrasena");
        
    }
    if (user.equals(UsuarioIntro) && ContrasenaIntro.equals(ContrasenaUsu)) {
        session.setAttribute("Usuario", UsuarioIntro);
        response.sendRedirect("index.jsp");
    } else {
        
        session.setAttribute("error", "Nombre de usuario o contraseña incorrectos. Por favor intentelo de nuevo");
        response.sendRedirect("login.jsp");
    }
    
%>