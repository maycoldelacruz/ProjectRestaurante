package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.GenerarPedido;
import modelo.Insumos;
import modelo.Pedido;
import modelo.Proveedores;

import java.io.IOException;
import java.util.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import dao.DaoGenerarPedido;

/**
 * Servlet implementation class GenerarPedidoServlet
 */
@WebServlet("/GenerarPedidoServlet")
public class GenerarPedidoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private DaoGenerarPedido daopedido;
    
    public void init() throws ServletException {
        super.init();
     
        try {
        	daopedido = new DaoGenerarPedido();
        }catch(Exception e) {
        	throw new ServletException(e);
        }
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comando = request.getParameter("instruccion");
		System.out.print(comando);
		if(comando==null) comando = "listar";
		
		switch(comando) {
		case "listar":
			try {
				obtenerPedido(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "insertar":
			try {
				agregarPedido(request, response);
			} catch (SQLException | IOException e4) {
				// TODO Auto-generated catch block
				e4.printStackTrace();
			}
			break;
		case "eliminar":
			try {
				eliminarFila(request, response);
			} catch (ServletException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			} catch (IOException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			} catch (SQLException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}
			break;
		case "actualizarBBDD":
			try {
				actualizarPedido(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "buscarInsumo":
			try {
				BuscarIns(request, response);
			} catch (ServletException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			} catch (IOException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			break;
		case "addtolist":
			try {
				agregarLista(request, response);
			} catch (ServletException | IOException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}          
			break;
		case "details":
			try {
				obtenerPedidoDetallado(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "detailss":
			try {
				obtenerListaPedidoDetallado(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		case "visualizar":
			try {
				obtenerPedidos(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
			
		default :
			try {
				obtenerPedido(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
			break;
		}
	}

	private void eliminarFila(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int insumo = Integer.parseInt(request.getParameter("IdInsumo"));
		int provee = Integer.parseInt(request.getParameter("IdProveedor"));
		
		daopedido.elimarfila(insumo, provee);
		
		obtenerPedido(request, response);
	}

	private void obtenerPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		List<GenerarPedido> temporal;
		try {
			temporal = daopedido.getPedidoTemp();
			
			request.setAttribute("LISTAPEDIDO", temporal);
			
			RequestDispatcher miDispatcher = request.getRequestDispatcher("/GenerarPedido.jsp");
			miDispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	private void agregarLista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int codIns = Integer.parseInt(request.getParameter("codIns"));
		int codProv = Integer.parseInt(request.getParameter("cod_prov"));
		int cantidad = Integer.parseInt(request.getParameter("cant"));
		double precio = Double.parseDouble(request.getParameter("precio"));
		
		GenerarPedido gp = new GenerarPedido(codIns, codProv, cantidad, precio);
				
		daopedido.listadoPedido(gp);
		
		obtenerPedido(request, response);
	}

	private void BuscarIns(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("cod_ins"));
		
		Insumos ins = daopedido.buscarInsumo(id);
		
		request.setAttribute("InsumoBuscado", ins);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/GenerarPedido.jsp");
		dispatcher.forward(request, response);
		
		obtenerPedido(request, response);
	}

	private void actualizarPedido(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void agregarPedido(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		List <GenerarPedido> pedido = daopedido.getPedidoTemp();
		
		String fpedido = request.getParameter("fecha_pedido");
		String fentrega = request.getParameter("fecha_entrega");
		
		SimpleDateFormat fecha = new SimpleDateFormat("yyyy-MM-dd");
		
		Date datum1 = null;
		Date datum2 = null;
		
		try {
		      datum1 = fecha.parse(fpedido);
		      datum2 = fecha.parse(fentrega);
		    } catch (ParseException e) {
		      e.printStackTrace();
		    }
		
		daopedido.nuevoPedido(pedido, datum1, datum2);
		
		response.sendRedirect("GenerarPedidoServlet?instruccion=visualizar");
	}

	private void obtenerListaPedidoDetallado(HttpServletRequest request, HttpServletResponse response) {
		List<GenerarPedido> pedidode;
		int idPedido = Integer.parseInt(request.getParameter("NroPedido"));
		try {
			pedidode = daopedido.getPedidosDetallados(idPedido);
			
			request.setAttribute("LISTADET_PEDIDOS", pedidode);
			
			RequestDispatcher miDispatcher = request.getRequestDispatcher("/PedidoDetalle.jsp");
			miDispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	private void obtenerPedidoDetallado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idPedido = Integer.parseInt(request.getParameter("NroPedido"));
		
		GenerarPedido pe = daopedido.getDetails(idPedido);
		
		request.setAttribute("Pedido", pe);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/PedidoDetalle.jsp");
		
		dispatcher.forward(request, response);
	}

	private void obtenerPedidos(HttpServletRequest request, HttpServletResponse response) {
		List<Pedido> pedidosre;
		try {
			pedidosre = daopedido.getPedidos();
			
			request.setAttribute("LISTASEG_PEDIDOS", pedidosre);
			
			RequestDispatcher miDispatcher = request.getRequestDispatcher("/PedidosRealizados.jsp");
			miDispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
