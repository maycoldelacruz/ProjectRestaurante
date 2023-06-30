package servlets;

import jakarta.servlet.RequestDispatcher;
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

/**
 * Servlet implementation class ClienteServlet
 */
public class ClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DaoClients daoCl;
    /**
     * @see HttpServlet#HttpServlet()
     */
	 public void init() throws ServletException {
	        super.init();
	        
	        try {
				daoCl = new DaoClients();
			} catch (Exception e) {
				throw new ServletException(e);
			}
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String comando = request.getParameter("instruccion");
		
		if(comando==null) comando = "listar";
		
		switch(comando) {
		case "listar":
			obtenerClientes(request, response);
			break;
		case "insertarBBDD":
			agregarClientes(request, response);
			break;
		case "cargar":
			try {
			cargarClientes(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}	
			break;
		case "actualizarBBDD":
			try {
				actualizarCliente(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case"eliminar":
			try {
				eliminarClientes(request,response);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			break;
		default :
			obtenerClientes(request, response);
		}
	}

	private void eliminarClientes(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		int cod_Cli= Integer.parseInt(request.getParameter("IdCliente"));
		 daoCl.eliminarCliente(cod_Cli);
		 obtenerClientes(request, response);
		
	}

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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
