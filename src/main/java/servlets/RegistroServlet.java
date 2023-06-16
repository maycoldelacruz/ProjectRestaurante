package servlets;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Usuario;
import util.MySqlConexion;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.DaoRegistro;

/**
 * Servlet implementation class RegistroServlet
 */
@WebServlet("/register")
public class RegistroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*PrintWriter out = response.getWriter();
		out.print("Work");*/
		
		String uname=request.getParameter("name");
		String uemail=request.getParameter("email");
		String upwd=request.getParameter("pass");
		String umobile=request.getParameter("contact");
		Usuario usuario = new Usuario(uname, uemail, upwd, umobile);
        DaoRegistro usuarioDAO = new DaoRegistro();
        boolean success = usuarioDAO.insertarUsuario(usuario);

        if (success) {
            request.setAttribute("status", "success");
        } else {
            request.setAttribute("status", "failed");
        }

        request.getRequestDispatcher("registration.jsp").forward(request, response);
    
		
	}

}
