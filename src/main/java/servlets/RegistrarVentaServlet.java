package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import dao.DaoClients;
import modelo.Clientes;
import modelo.Productos;
import dao.DaoProductos;
import modelo.Venta;
import util.GenerarSerie;
import dao.DaoVenta;

import java.util.ArrayList;
import java.util.List;




/**
 * Servlet implementation class RegistrarVentaServlet
 */


public class RegistrarVentaServlet extends HttpServlet {
       
	String numeroserie;
	
	DaoClients pcli = new DaoClients();

    /**
     * @see HttpServlet#HttpServlet()
     */
	DaoProductos pdao = new DaoProductos();
	
	Productos p = new Productos();	
	
	Venta v= new Venta();
	List<Venta>lista=new ArrayList<>();
	int item;
	int cod;
	String descripcion;
	double precio;
	int cant;
	double subtotal;
	
	
	
	
	
	
	
	private DaoVenta daoVent;
	
    public void init() throws ServletException {
        super.init();
        try {
			daoVent = new DaoVenta();
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
        
    }

    	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String comando = request.getParameter("accion");
		if(comando==null) comando = "BuscarProducto";
		switch(comando) {
		case "BuscarProducto":
			try {
				obtenerProductos(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			break;
		case "BuscarCliente":
			obtenerCliente(request, response);	
			break;	
		case "Agregar":
				agregarProductos(request, response);	
			break;
		case "Nserie":
			try {
				Nserie(request, response);
			} catch (Exception e) {
				
			}
			break;	
		default:
			
			
			
		}
		
		
}
		private void obtenerCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Clientes c = new Clientes();	
			
			String dni = request.getParameter("dni");
			
			c=pcli.BuscarCliente(dni);
			request.setAttribute("clienteseleccionado", c);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/RegistrarVenta.jsp");
			dispatcher.forward(request, response);
		
	}


		private void Nserie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			numeroserie=daoVent.GenerarSerie();
			if(numeroserie==null) {
				numeroserie="00000001";
				request.setAttribute("nserie", numeroserie);		
			}
			else{
				int incrementar=Integer.parseInt(numeroserie);
				GenerarSerie gs= new GenerarSerie();
				numeroserie=gs.NumeroSerie(incrementar);
				request.setAttribute("nserie", numeroserie);
			}
			request.getRequestDispatcher("/RegistrarVenta.jsp").forward(request, response);
		// TODO Auto-generated method stub
		
	}


		private void agregarProductos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			item = item+1;
			cod = p.getCod_prod();
			descripcion = request.getParameter("nomproductos");
			precio = Double.parseDouble(request.getParameter("precio"));
			subtotal=precio*cant;
			
			v.setItem(item);
			v.setId(cod);
			v.setDescripcion(descripcion);
			v.setPrecio(precio);
			v.setCantidad(cant);
			v.setSubtotal(subtotal);
			lista.add(v);			
			request.setAttribute("LISTA", lista);
			request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
			
	} 


		private void obtenerProductos(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		Productos p = new Productos();	
		int codigoproducto = Integer.parseInt(request.getParameter("codigoproducto"));
		
		p=pdao.BuscarProducto(codigoproducto);
		request.setAttribute("productoseleccionado", p);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/RegistrarVenta.jsp");
		dispatcher.forward(request, response);
		
		
	}

	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);

	}

}
