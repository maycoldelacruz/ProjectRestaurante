package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import modelo.Productos;

import java.io.IOException;
import java.util.List;

import dao.DaoProductos;


public class ProductosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private DaoProductos daoProd;
	
	
    
    public void init() throws ServletException {
        super.init();
        
        try {
			daoProd = new DaoProductos();
		} catch (Exception e) {
			throw new ServletException(e);
		}
   
    }

	
    
    
  
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comando = request.getParameter("instruccion");
		
		if(comando==null) comando = "listar";
		
		switch(comando) {
		case "listar":
			obtenerProductos(request, response);
			break;
		case "insertarBBDD":
			agregarProductos(request, response);
			break;
		case "cargar":
			try {
			cargarProducto(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "actualizarBBDD":
			try {
				actualizarProducto(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case"eliminar":
			try {
				eliminarProductos(request,response);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		default :
			obtenerProductos(request, response);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private void eliminarProductos(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int codProducto= Integer.parseInt(request.getParameter("IdProducto"));
		daoProd.eliminarProducto(codProducto);
		obtenerProductos(request, response);
	}






	private void actualizarProducto(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int cod_prod = Integer.parseInt(request.getParameter("codi"));
		String nomb = request.getParameter("nomb");
		double prec = Double.parseDouble(request.getParameter("prec"));
		int stoc = Integer.parseInt(request.getParameter("stoc"));
		String estad = request.getParameter("esta");
		
		Productos proActualizado = new Productos( cod_prod, nomb, prec, stoc, estad);
		
		daoProd.actualizarProducto(proActualizado);
		obtenerProductos(request, response);

	}






	private void cargarProducto(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		
		int codigo = Integer.parseInt(request.getParameter("IdProducto"));
		
		Productos prod = daoProd.getProducto(codigo);
		
		
		request.setAttribute("ProductoActualizar", prod);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarProducto.jsp");
		dispatcher.forward(request, response);
		
	}





	
	
	
	
	
	
	

	private void agregarProductos(HttpServletRequest request, HttpServletResponse response) {
		int cod_prod = Integer.parseInt(request.getParameter("codi"));
		String  nomb = request.getParameter("nomb");
		double prec = Double.parseDouble(request.getParameter("prec"));
		int stoc = Integer.parseInt(request.getParameter("stoc"));
		String estad = request.getParameter("esta");
		
		Productos NuevoProducto = new Productos(cod_prod, nomb, prec, stoc, estad);
		daoProd.agregarNuevoProducto(NuevoProducto);
		
		obtenerProductos(request, response);
			
	}






	private void obtenerProductos(HttpServletRequest request, HttpServletResponse response) {
		List<Productos> productos;
		
		try {
			productos = daoProd.getProductos();
			
			request.setAttribute("LISTAPRODUCTOS", productos);
			
			RequestDispatcher miDispatcher = request.getRequestDispatcher("/ListarProducto.jsp");
			miDispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}




	
	
	
	
	
	
	
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
