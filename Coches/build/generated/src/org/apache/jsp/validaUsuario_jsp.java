package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class validaUsuario_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/ConectividadBaseDeDatos.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write(" \n");
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

          
          
           String NombreBaseDatos = "jdbc:mysql://localhost:3306/coches1" ;
           String nombre =  "root";
           String Contrasena = "";
           
        
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
    String UsuarioIntro = request.getParameter("Usuario");
    String ContrasenaIntro = request.getParameter("Contrasena");

    Class.forName("com.mysql.jdbc.Driver");

    Connection conexion = DriverManager.getConnection(NombreBaseDatos, nombre, Contrasena);

    Statement s = conexion.createStatement();

    ResultSet listado = s.executeQuery("SELECT  usuario , contrasena FROM usuario "
            + "where id=   (select id from usuario where usuario =  ' " + UsuarioIntro + "')");

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


    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
