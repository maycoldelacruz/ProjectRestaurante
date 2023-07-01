package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Insumos;


import java.io.IOException;
import java.util.List;

import dao.DaoInsumos;

/**
 * Servlet implementation class InsumosServlet
 */
public class InsumosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DaoInsumos daoIns;
	
	public void init() throws ServletException {
        super.init();
     
        try {
        	daoIns = new DaoInsumos();
        }catch(Exception e) {
        	throw new ServletException(e);
        }
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comando = request.getParameter("instruccion");
		
		if(comando==null) comando = "listar";
		
		switch(comando) {
		case "listar":
			obtenerInsumos(request, response);
			break;
		case "insertarBBDD":
			agregarInsumos(request, response);
			break;
		case "cargar":
			try {
				cargarInsumos(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "actualizarBBDD":
			try {
				actualizarInsumo(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "eliminar":
			try {
				eliminarInsumo(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		default :
			obtenerInsumos(request, response);
		}
	}
	private void eliminarInsumo(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int codIns = Integer.parseInt(request.getParameter("IdInsumo"));
		
		daoIns.eliminarInsumo(codIns);
		
		obtenerInsumos(request, response);
	}

	private void actualizarInsumo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int CodInsumo = Integer.parseInt(request.getParameter("cod_ins"));
		String Nombre = request.getParameter("nombre");
		int stk_min = Integer.parseInt(request.getParameter("stk_min"));
		int stk_act = Integer.parseInt(request.getParameter("stk_act"));
		double precio_k = Double.parseDouble(request.getParameter("preciok"));
		int codTipo = Integer.parseInt(request.getParameter("cod_tipo"));
		
		Insumos insActualizado  = new Insumos(CodInsumo, stk_min, stk_act, Nombre, codTipo, precio_k);
		
		daoIns.actualizarInsumo(insActualizado);
		
		obtenerInsumos(request, response);
	}
	
	private void cargarInsumos(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int codigo= Integer.parseInt(request.getParameter("IdInsumo"));
		
		Insumos ins = daoIns.getInsumo(codigo);
		
		request.setAttribute("InsumoActualizar", ins);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarInsumo.jsp");
		dispatcher.forward(request, response);
		
	}
	private void agregarInsumos(HttpServletRequest request, HttpServletResponse response) {
		String Nombre = request.getParameter("nombre");
		int stk_min = Integer.parseInt(request.getParameter("stk_min"));
		int tipo = Integer.parseInt(request.getParameter("cod_tipo"));
		double precio = Double.parseDouble(request.getParameter("preciok"));
		int actual = Integer.parseInt(request.getParameter("stk_act"));
		
		Insumos NuevoInsumo =  new Insumos(stk_min, actual, Nombre, precio, tipo);
		
		daoIns.agregarNuevoInsumo(NuevoInsumo);
		
		obtenerInsumos(request, response);
		
	}
	private void obtenerInsumos(HttpServletRequest request, HttpServletResponse response) {
		List<Insumos> insumos;
		try {
			insumos = daoIns.getInsumos();
			
			request.setAttribute("LISTAINSUMOS", insumos);
			
			RequestDispatcher miDispatcher = request.getRequestDispatcher("/ListarInsumos.jsp");
			miDispatcher.forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	
}
