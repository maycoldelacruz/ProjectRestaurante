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
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
                case "llevarpro":
                    generarProgramacion(request, response);
                    break;
                case "listarpublic":
                	listarPublicacionesPublicadas(request,response);
                	break;
                case "listarprogra":
                	listarPublicacionesProgramadas(request,response);
                	break;
                case "delete":
                    eliminarPublicacion(request, response);
                    break;
                case "verpublic":
                	verPublicacionesPublicadas(request,response);
                	break;
                default:
                    mostrarError(response, "Acción inválida get ");
                    break;
            }
        } else {
            mostrarError(response, "Acción no especificada get ");
        }
    }	

	private void verPublicacionesPublicadas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Publicacion> publicaciones=DaoPublicacion.listarPublicacionesPublicadas();
		request.setAttribute("publicaciones", publicaciones);
		request.getRequestDispatcher("Promociones.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
        if (action != null) {
            switch (action) {
                case "create":
                    crearPublicacion(request, response);
                    break;
                case "program":
                    programarContenido(request, response);
                    break;
                
                default:
                    mostrarError(response, "Acción inválida Post");
                    break;
            }
        } else {
            mostrarError(response, "Acción no especificada Post");
        }
	}
	
	private void eliminarPublicacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int idPublicacion = Integer.parseInt(request.getParameter("idPublicacion"));
        boolean exito = DaoPublicacion.eliminarPublicacion(idPublicacion);

        if (exito) {
            response.sendRedirect("PublicacionServlet?action=listarpublic");
        } else {
            mostrarError(response, "Error al eliminar la Publicación");
        }
	}

	private void programarContenido(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    String idContenido = request.getParameter("idContenido");
	    String fecha = request.getParameter("fecha");
	    int idCont = Integer.parseInt(idContenido);
	    DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
	    LocalDateTime fechaHora = LocalDateTime.parse(fecha, formato);

	    System.out.println(idCont);
	    Publicacion publicacion = new Publicacion();

	    publicacion.setIdContenido(idCont);
	    Date fechaPublicacion = Date.from(fechaHora.atZone(ZoneId.systemDefault()).toInstant());
	    publicacion.setFechapublicacion(fechaPublicacion);
	    publicacion.setEstado("Pendiente");

	    boolean exito = DaoPublicacion.agregarPublicacion(publicacion);

	    if (exito) {
	        response.sendRedirect("ContenidoServlet?action=list");
	    } else {
	        mostrarError(response, "Error al agregar contenido");
	    }
	}



	private void listarPublicacionesProgramadas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Publicacion> publicaciones=DaoPublicacion.listarPublicacionesProgramadas();
		request.setAttribute("publicaciones", publicaciones);
		request.getRequestDispatcher("ListarPromosProgra.jsp").forward(request,response);
	}

	private void generarProgramacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int idContenido = Integer.parseInt(request.getParameter("idContenido"));
	        System.out.println(idContenido);
	        Contenido contenido = DaoContenido.obtenerContenido(idContenido);

	        if (contenido != null) {
	            request.setAttribute("contenido", contenido);
	            request.getRequestDispatcher("ProgramarPublicacion.jsp").forward(request, response);
	        } else {
	            mostrarError(response, "El contenido no existe");
	        }
	}

	private void listarPublicacionesPublicadas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Publicacion> publicaciones=DaoPublicacion.listarPublicacionesPublicadas();
		request.setAttribute("publicaciones", publicaciones);
		request.getRequestDispatcher("ListarPromosPubli.jsp").forward(request,response);
		
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
			response.sendRedirect("PublicacionServlet?action=listarpublic");
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
