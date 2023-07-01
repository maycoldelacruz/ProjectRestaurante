package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Proveedores;

import java.io.IOException;
import java.util.List;


import dao.DaoProveedores;

/**
 * Servlet implementation class ProveedorServlet
 */
@WebServlet("/ProveedorServlet")
public class ProveedorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DaoProveedores daoprov;
	
	public void init() throws ServletException {
        super.init();
     
        try {
        	daoprov = new DaoProveedores();
        }catch(Exception e) {
        	throw new ServletException(e);
        }
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comando = request.getParameter("instruccion");
		
		if(comando==null) comando = "listar";
		
		switch(comando) {
		case "listar":
			obtenerProveedores(request, response);
			break;
		case "insertarBBDD":
			agregarProveedor(request, response);
			break;
		case "cargar":
			try {
				cargaProveedores(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "actualizarBBDD":
			try {
				actualizarProveedor(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "insertarInsumo":
				agregarInsumo(request, response);
			break;
		case "eliminar":
			try {
				eliminarProveedor(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		default :
			obtenerProveedores(request, response);
		}
	}


	private void agregarInsumo(HttpServletRequest request, HttpServletResponse response) {
		int codProv = Integer.parseInt(request.getParameter("cod_prov"));
		int codIns = Integer.parseInt(request.getParameter("cod_ins"));
		
		Proveedores NuevoInsumoProveedor = new Proveedores(codProv, codIns);
		
		daoprov.agregarNuevoInsumoProveedor(NuevoInsumoProveedor);
		
		obtenerProveedores(request, response);
		
	}

	private void actualizarProveedor(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int CodProveedor = Integer.parseInt(request.getParameter("cod_prov"));
		String Nombre = request.getParameter("nombre");
		String telefono = request.getParameter("numerotel");
		String Estado = request.getParameter("estado");
		
		Proveedores provActualizado  = new Proveedores(CodProveedor, Nombre, telefono, Estado);
		
		daoprov.actualizarProveedor(provActualizado);
		
		obtenerProveedores(request, response);
	}

	private void eliminarProveedor(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int codProv = Integer.parseInt(request.getParameter("CProveedor"));
		int codIns = Integer.parseInt(request.getParameter("CInsumo"));
		
		daoprov.eliminarProveedor(codProv, codIns);
		
		obtenerProveedores(request, response);
		
	}

	private void agregarProveedor(HttpServletRequest request, HttpServletResponse response) {
		String Nombre = request.getParameter("nombre");
		String telefono = request.getParameter("numerotel");
		String Estado = request.getParameter("estado");
		
		Proveedores NuevoProveedor = new Proveedores(Nombre, telefono, Estado);
		
		daoprov.agregarNuevoProveedor(NuevoProveedor);
		
		obtenerProveedores(request, response);
		
	}

	private void cargaProveedores(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int codigoProv= Integer.parseInt(request.getParameter("CProveedor"));
		
		Proveedores prov = daoprov.getProveedor(codigoProv);
		
		request.setAttribute("ProveedorActualizar", prov);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarProveedor.jsp");
		dispatcher.forward(request, response);
		
	}

	private void obtenerProveedores(HttpServletRequest request, HttpServletResponse response) {
		List<Proveedores> proveedores;
		try {
			proveedores = daoprov.getProveedores();
			
			request.setAttribute("LISTARPROVEEDORES", proveedores);
			
			RequestDispatcher miDispatcher = request.getRequestDispatcher("/ListarProveedores.jsp");
			miDispatcher.forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
}
