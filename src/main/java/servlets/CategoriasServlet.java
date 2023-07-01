package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Categorias;

import java.io.IOException;
import java.util.List;

import dao.DaoCategoria;

@WebServlet("/CategoriasServlet")
public class CategoriasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private DaoCategoria daocate;
    
    public void init() throws ServletException {
        super.init();
     
        try {
        	daocate = new DaoCategoria();
        }catch(Exception e) {
        	throw new ServletException(e);
        }
    }
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comando = request.getParameter("instruccion");
		
		if(comando==null) comando = "listar";
		
		switch(comando) {
		case "listar":
			obtenerCategorias(request, response);
			break;
		case "insertarBBDD":
			agregarCategoria(request, response);
			break;
		case "cargar":
			try {
				cargarCategoria(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "actualizarBBDD":
			try {
				actualizarCategoria(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "eliminar":
			try {
				eliminarCategoria(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		default :
			obtenerCategorias(request, response);
		}
	}

	private void eliminarCategoria(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void actualizarCategoria(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void cargarCategoria(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void agregarCategoria(HttpServletRequest request, HttpServletResponse response) {
		int codigo = Integer.parseInt(request.getParameter("cod_tipo"));
		String nombre = request.getParameter("nom_tipo");
		
		Categorias NuevoTipo =  new Categorias(codigo, nombre);
		
		daocate.agregarNuevaCategoria(NuevoTipo);
		
		obtenerCategorias(request, response);
		
	}

	private void obtenerCategorias(HttpServletRequest request, HttpServletResponse response) {
		List<Categorias> cate;
		try {
			
			cate = daocate.getCategorias();
			
			request.setAttribute("LISTATIPOS", cate);
			
			RequestDispatcher miDispatcher = request.getRequestDispatcher("/ListaCategorias.jsp");
			miDispatcher.forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}


}
