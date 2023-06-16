package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Contenido;
import modelo.Publicacion;

import java.io.IOException;
import java.util.Date;

import dao.DaoContenido;
import dao.DaoPublicacion;

@WebServlet("/PublicacionServlet")
public class PublicacionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicacionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
        if (action != null) {
            switch (action) {
            
                case "llevar":
                    generarPublicacion(request, response);
                    break;
            

                default:
                    mostrarError(response, "Acción inválida get ");
                    break;
            }
        } else {
            mostrarError(response, "Acción no especificada get ");
        }
    }	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
        if (action != null) {
            switch (action) {
                case "create":
                    crearPublicacion(request, response);
                    break;
                /*case "update":
                    actualizarContenido(request, response);
                    break;
                case "delete":
                    eliminarContenido(request, response);
                    break;*/
                default:
                    mostrarError(response, "Acción inválida Post");
                    break;
            }
        } else {
            mostrarError(response, "Acción no especificada Post");
        }
	}

	private void crearPublicacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String idContenido= request.getParameter("idContenido");
		System.out.println(idContenido);
		int idCont=Integer.parseInt(idContenido);
		System.out.println(idCont);
		Publicacion publicacion= new Publicacion();
		
		publicacion.setIdContenido(idCont);
		publicacion.setFechapublicacion(new Date());
		publicacion.setEstado("Publicado");
		
		boolean exito =DaoPublicacion.agregarPublicacion(publicacion);
		
		if (exito) {
			response.sendRedirect("ContenidoServlet?action=list");
		}else {
			mostrarError(response, "Error al agregar contenido");
		}
		
	}

	private void generarPublicacion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idContenido = Integer.parseInt(request.getParameter("idContenido"));
        System.out.println(idContenido);
        Contenido contenido = DaoContenido.obtenerContenido(idContenido);

        if (contenido != null) {
            request.setAttribute("contenido", contenido);
            request.getRequestDispatcher("PublicarContenido.jsp").forward(request, response);
        } else {
            mostrarError(response, "El contenido no existe");
        }
    }
	
	private void mostrarError(HttpServletResponse response, String mensaje) throws IOException {
        System.err.println("Error: " + mensaje);
        response.sendRedirect("Footer.jsp");
    }
}
