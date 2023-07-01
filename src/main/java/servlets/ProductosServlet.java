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


@WebServlet("/ProductosServlet")
public class ProductosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private DaoProductos daoProd;

	
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.print(action);
        if (action != null) {
            switch (action) {
                case "create":
                    agregarProductos(request, response);;
                    break;
                case "update":
                	//actualizarProducto(request, response);
                    break;
                case "delete":
                	//eliminarProductos(request, response);
                    break;
                default:
                    mostrarError(response, "Acción inválida Post");
                    break;
            }
        } else {
            mostrarError(response, "Acción no especificada Post");
        }
    }
  
    
	private void mostrarError(HttpServletResponse response, String mensaje) throws IOException {
		System.err.println("Error: " + mensaje);
        response.sendRedirect("Footer.jsp");
	}



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action !=null) {
		
			switch(action) {
			case "listar":
				listarProductos(request, response);
				break;
			case "delete":
				eliminarProductos(request,response);
			default :
				mostrarError(response, "Acción inválida get ");
	            break;
			}
	}else {
			mostrarError(response, "Acción no especificada get ");
	}
}
	
	
	private void eliminarProductos(HttpServletRequest request, HttpServletResponse response) throws IOException{
		int codProducto= Integer.parseInt(request.getParameter("IdProducto"));
		boolean exito = DaoProductos.eliminarProducto(codProducto);
		if (exito) {
			response.sendRedirect("ProductosServlet?action=listar");			
		}else {
			mostrarError(response, "Error al Eliminar");
		}
	}




/*

	private void actualizarProducto(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int cod_prod = Integer.parseInt(request.getParameter("codi"));
		String nomb = request.getParameter("nomb");
		double prec = Double.parseDouble(request.getParameter("prec"));
		int stoc = Integer.parseInt(request.getParameter("stoc"));
		String estad = request.getParameter("esta");
		
		Productos proActualizado = new Productos( cod_prod, nomb, prec, stoc, estad);
		
		daoProd.actualizarProducto(proActualizado);
		obtenerProductos(request, response);

	}*/






	private void cargarProducto(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		
		int codigo = Integer.parseInt(request.getParameter("IdProducto"));
		
		Productos prod = daoProd.getProducto(codigo);
		
		
		request.setAttribute("ProductoActualizar", prod);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarProducto.jsp");
		dispatcher.forward(request, response);
		
	}





	
	
	
	
	
	
	

	private void agregarProductos(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String  nomb = request.getParameter("nomb");
		System.out.print(nomb);
		double prec = Double.parseDouble(request.getParameter("prec"));
		int stoc = Integer.parseInt(request.getParameter("stoc"));
		String estad = request.getParameter("esta");
		
		Productos np = new Productos();
		np.setNomb(nomb);
		np.setPrec(prec);
		np.setStoc(stoc);
		np.setEstad(estad);
		
		boolean exito=DaoProductos.agregarNuevoProducto(np);
		
		if (exito) {
            response.sendRedirect("ProductosServlet?action=listar");
        } else {
            mostrarError(response, "Error al agregar el contenido");
        }
			
	}






	private void listarProductos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Productos> productos=DaoProductos.listarProductos();
		request.setAttribute("productos", productos);
		request.getRequestDispatcher("ListarProducto.jsp").forward(request,response);
	}

}
