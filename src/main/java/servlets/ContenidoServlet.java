package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import modelo.Contenido;
import dao.DaoContenido;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/ContenidoServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ContenidoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "create":
                    crearContenido(request, response);
                    break;
                case "update":
                    actualizarContenido(request, response);
                    break;
                case "delete":
                    eliminarContenido(request, response);
                    break;
                default:
                    mostrarError(response, "Acción inválida Post");
                    break;
            }
        } else {
            mostrarError(response, "Acción no especificada Post");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        if (action != null) {
            switch (action) {
                case "list":
                    listarContenidos(request, response);
                    break;
                case "edit":
                    mostrarFormularioEdicion(request, response);
                    break;
                case "delete":
                    eliminarContenido(request, response);
                    break;
                case "update":
                    actualizarContenido(request, response);
                    break;

                default:
                    mostrarError(response, "Acción inválida get ");
                    break;
            }
        } else {
            mostrarError(response, "Acción no especificada get ");
        }
    }

    private void crearContenido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        System.out.println(titulo);
        String descripcion = request.getParameter("descripcion");

        Part archivoPart = request.getPart("imagen");
        String archivoNombre = obtenerNombreArchivo(archivoPart);

        if (archivoNombre != null) {
            byte[] archivoBytes = archivoPart.getInputStream().readAllBytes();

            Contenido contenido = new Contenido();
            contenido.setTitulo(titulo);
            contenido.setDescripcion(descripcion);
            contenido.setArchivo(archivoBytes);
            contenido.setNombreArchivo(archivoNombre);
            contenido.setFechaCreacion(new Date());
            contenido.setUsuarioId(1);

            boolean exito = DaoContenido.agregarContenido(contenido);

            if (exito) {
                response.sendRedirect("ContenidoServlet?action=list");
            } else {
                mostrarError(response, "Error al agregar el contenido");
            }
        } else {
            mostrarError(response, "No se pudo obtener el nombre del archivo");
        }
    }


    private void actualizarContenido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idContenidoStr = request.getParameter("idContenido");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        Part archivoPart = request.getPart("imagen");

        if (idContenidoStr == null || idContenidoStr.isEmpty()) {
            mostrarError(response, "El ID de contenido es inválido o vacío");
            return;
        }

        int idContenido;
        try {
            idContenido = Integer.parseInt(idContenidoStr);
        } catch (NumberFormatException e) {           
            mostrarError(response, "El ID de contenido no es válido");
            return;
        }

        Contenido contenido = DaoContenido.obtenerContenido(idContenido);
        if (contenido == null) {
            mostrarError(response, "El contenido no existe");
            return;
        }

        // Verificar si se seleccionó un nuevo archivo
        if (archivoPart != null && archivoPart.getSize() > 0) {
            byte[] archivoBytes = archivoPart.getInputStream().readAllBytes();
            String archivoNombre = obtenerNombreArchivo(archivoPart);
            contenido.setArchivo(archivoBytes);
            contenido.setNombreArchivo(archivoNombre);
        }

        contenido.setTitulo(titulo);
        contenido.setDescripcion(descripcion);

        boolean exito = DaoContenido.actualizarContenido(contenido);

        if (exito) {
            response.sendRedirect("ContenidoServlet?action=list");
        } else {
            mostrarError(response, "Error al actualizar el contenido");
        }
    }



    private void eliminarContenido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idContenido = Integer.parseInt(request.getParameter("idContenido"));
        boolean exito = DaoContenido.eliminarContenido(idContenido);

        if (exito) {
            response.sendRedirect("ContenidoServlet?action=list");
        } else {
            mostrarError(response, "Error al eliminar el contenido");
        }
    }

    private void listarContenidos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Contenido> contenidos = DaoContenido.listarContenidos();

        request.setAttribute("contenidos", contenidos);
        request.getRequestDispatcher("Listar_Contenido.jsp").forward(request, response);
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idContenido = Integer.parseInt(request.getParameter("idContenido"));
        System.out.println(idContenido);
        Contenido contenido = DaoContenido.obtenerContenido(idContenido);

        if (contenido != null) {
            request.setAttribute("contenido", contenido);
            request.getRequestDispatcher("EditarContenido.jsp").forward(request, response);
        } else {
            mostrarError(response, "El contenido no existe");
        }
    }


    private String obtenerNombreArchivo(Part part) {
        if (part != null) {
            String contenidoHeader = part.getHeader("content-disposition");
            System.out.println(contenidoHeader);
            String[] elementos = contenidoHeader.split(";");

            for (String elemento : elementos) {
                if (elemento.trim().startsWith("filename")) {
                    return elemento.substring(elemento.indexOf('=') + 1).trim().replace("\"", "");
                }
            }
        }

        return null;
    }


    private void mostrarError(HttpServletResponse response, String mensaje) throws IOException {
        System.err.println("Error: " + mensaje);
        response.sendRedirect("Footer.jsp");
    }
}
