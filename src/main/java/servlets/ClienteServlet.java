package servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import modelo.Clientes;

import dao.DaoClients;
@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ClienteServlet() {
		super();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String action = request.getParameter("action");
		
		if(action !=null) {
		
			switch(action) {
				case "listar":
					listarClientes(request, response);
					break;
				case "delete":
					//eliminarClientes(request, response);
					break;
				default :
					mostrarError(response, "Acción inválida get ");
		            break;
				}
		}else {
				mostrarError(response, "Acción no especificada get ");
		}
	}

	private void mostrarError(HttpServletResponse response, String mensaje) throws IOException {
		System.err.println("Error: " + mensaje);
        response.sendRedirect("Footer.jsp");
	}

	private void listarClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Clientes> clientes= DaoClients.listarClientes();
		request.setAttribute("clientes", clientes);
		request.getRequestDispatcher("ListarCliente.jsp").forward(request, response);
		
	}

	private void eliminarClientes(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int codcliente= Integer.parseInt(request.getParameter("IdCliente"));
		boolean exito=DaoClients.eliminarCliente(codcliente);
		 if(exito) {
			 response.sendRedirect("ClienteServlet?action=listar");
		 }else {
	            mostrarError(response, "Error al eliminar la Cliente");
	        }
		
	}
/*
	private void actualizarCliente(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		int cod_prod = Integer.parseInt(request.getParameter("codi"));
		String dni = request.getParameter("dni");
		String nomb = request.getParameter("nomb");
		String direcci = request.getParameter("dire");
		String estad = request.getParameter("esta");
		
		Clientes cliActualizado = new Clientes( cod_prod, dni, nomb, direcci, estad);
		
		daoCl.actualizarCliente(cliActualizado);
		obtenerClientes(request, response);
		
	}

	private void cargarClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int codigo = Integer.parseInt(request.getParameter("IdCliente"));
		
		Clientes cli = daoCl.getCliente(codigo);
		
		
		request.setAttribute("ClienteActualizar", cli);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarCliente.jsp");
		dispatcher.forward(request, response);
		
	}

	private void agregarClientes(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int cod_Cli = Integer.parseInt(request.getParameter("codi"));
		String  dni = request.getParameter("dni");
		String nomb =  request.getParameter("nomb");
		String direcci = request.getParameter("direc");
		String estad = request.getParameter("esta");
		
		Clientes NuevoCliente = new Clientes(cod_Cli, dni, nomb, direcci, estad);
		daoCl.agregarNuevoCliente(NuevoCliente);
		
		obtenerClientes(request, response);
			
		
	}

	private void obtenerClientes(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
			List<Clientes> clientes;
		
		try {
			clientes = daoCl.getClientes();
			
			request.setAttribute("LISTACLIENTES", clientes);
			
			RequestDispatcher miDispatcher = request.getRequestDispatcher("/ListarCliente.jsp");
			miDispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}

	*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
