package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.sql.Timestamp;

import dao.DaoClients;
import modelo.Clientes;

import modelo.Productos;
import dao.DaoProductos;
import modelo.Venta;
import util.GenerarSerie;
import dao.DaoVenta;

import java.util.ArrayList;
import java.util.List;


@WebServlet("/RegistrarVentaServlet")

public class RegistrarVentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String numeroserie;
	DaoClients pcli = new DaoClients();
	DaoProductos pdao = new DaoProductos();
	Productos p = new Productos();	
	private DaoVenta daoVent;
	
	// Variables globales
	Venta v = new Venta();
	Clientes c = new Clientes();
    List<Venta> lista = new ArrayList<Venta>();
    int item;
    int cod;
    String descripcion;
    double precio;
    int cant;
    double subtotal;
    double totalPagar;
    String nroSerie;

    public void init() throws ServletException {
        super.init();
        try {
			daoVent = new DaoVenta();
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
    }
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String comando = request.getParameter("accion");
		if(comando==null) comando = "Nserie";
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
		
		case "GenerarVenta":
			try {
				GenerarVenta(request, response);
			} catch (SQLException | ServletException | IOException e) {
				e.printStackTrace();
			}
			break;
		
			/*
		case "eliminar":
			try {
				eliminarFila(request, response);
			} catch (ServletException e3) {
				e3.printStackTrace();
			} catch (IOException e3) {
				e3.printStackTrace();
			} catch (SQLException e3) {
				e3.printStackTrace();
			}
			break;		
			*/

		case "addtolist":
			try {
				agregarLista(request, response);
			} catch (ServletException | IOException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;

		case "Nserie":
			try {
				Nserie(request, response);
			} catch (Exception e) {
			}
			break;	

		default:
			try {
				Nserie(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		}
	}
	
		private void GenerarVenta(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
			// Guardar Venta
			v.setIdcliente(c.getCod_Cli());
			v.setNumeroserie(numeroserie);
			v.setFecha(LocalDateTime.now());
			v.setMonto(totalPagar);
			v.setEstado("S");
			daoVent.AgregarNuevaVenta(v);
			
			int idv = Integer.parseInt(daoVent.IdVentas());
			for (int i = 0; i < lista.size(); i++) {
				v = new Venta();
				v.setIdventa(idv);
				v.setIdproducto(lista.get(i).getIdproducto());
				v.setCantidad(lista.get(i).getCantidad());
				v.setPrecio(lista.get(i).getPrecio());
				daoVent.GuardarDetalleVenta(v);
			}
			
			String baseUrl = request.getRequestURL().toString();
			System.out.println(baseUrl);
			response.sendRedirect(baseUrl);
		}

		private void agregarLista(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
			item += 1;
			cod = Integer.parseInt(request.getParameter("codigoproducto"));
			precio = Double.parseDouble(request.getParameter("precio"));
			cant = Integer.parseInt(request.getParameter("cant"));
			subtotal = precio * cant;
			totalPagar = 0.0;

			v = new Venta();
			v.setItem(item);
			v.setIdproducto(cod);
			v.setPrecio(precio);
			v.setCantidad(cant);
			v.setSubtotal(subtotal);
			lista.add(v);
			for (int i = 0; i < lista.size(); i++) {
				totalPagar += lista.get(i).getSubtotal();
			}
			request.setAttribute("totalPagar", totalPagar);
			request.setAttribute("lista", lista);
			request.setAttribute("clienteseleccionado", c);
			request.setAttribute("productoseleccionado", p);
			request.setAttribute("nserie", numeroserie);		
			RequestDispatcher miDispatcher = request.getRequestDispatcher("/RegistrarVenta.jsp");
			miDispatcher.forward(request, response);
		}


		private void obtenerCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String dni = request.getParameter("dni");
			c = pcli.BuscarCliente(dni);
			request.setAttribute("clienteseleccionado", c);
			request.setAttribute("nserie", numeroserie);		
			RequestDispatcher dispatcher = request.getRequestDispatcher("/RegistrarVenta.jsp");
			dispatcher.forward(request, response);
		}


		private void Nserie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			numeroserie = daoVent.GenerarSerie();
			if (numeroserie == null) {
				numeroserie = "00000001";
			} else {
				int incrementar = Integer.parseInt(numeroserie);
				GenerarSerie gs= new GenerarSerie();
				numeroserie = gs.NumeroSerie(incrementar);
			}
			request.setAttribute("nserie", numeroserie);		
			request.getRequestDispatcher("/RegistrarVenta.jsp").forward(request, response);
		}


		private void obtenerProductos(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int codigoproducto = Integer.parseInt(request.getParameter("codigoproducto"));
			p=pdao.BuscarProducto(codigoproducto);
			request.setAttribute("nserie", numeroserie);		
			request.setAttribute("productoseleccionado", p);
			request.setAttribute("lista", lista);
			request.setAttribute("totalPagar", totalPagar);
			request.setAttribute("clienteseleccionado", c);
		} catch (Exception ex) {
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/RegistrarVenta.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}