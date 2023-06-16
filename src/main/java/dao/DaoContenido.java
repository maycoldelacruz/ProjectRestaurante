package dao;

import modelo.Contenido;
import util.MySqlConexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoContenido {

    public static boolean agregarContenido(Contenido contenido) {
        Connection con = MySqlConexion.getConexion();
        boolean exito = false;

        try {
            String query = "INSERT INTO contenido (titulo, descripcion, archivo, nombre_archivo, fecha_creacion, usuario_id) " +
                    "VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, contenido.getTitulo());
            ps.setString(2, contenido.getDescripcion());
            ps.setBytes(3, contenido.getArchivo());
            ps.setString(4, contenido.getNombreArchivo());
            ps.setInt(5, contenido.getUsuarioId());

            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                exito = true;
            }

            ps.close();
        } catch (SQLException e) {
            System.err.println("Error al agregar el contenido: " + e.getMessage());
        } finally {
            MySqlConexion.closeConexion(con);
        }

        return exito;
    }

    public static boolean actualizarContenido(Contenido contenido) {
        Connection con = MySqlConexion.getConexion();
        boolean exito = false;

        try {
            String query = "UPDATE contenido SET titulo = ?, descripcion = ?, archivo = ?, nombre_archivo = ? WHERE id_contenido = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, contenido.getTitulo());
            ps.setString(2, contenido.getDescripcion());
            ps.setBytes(3, contenido.getArchivo());
            ps.setString(4, contenido.getNombreArchivo());
            ps.setInt(5, contenido.getIdContenido());

            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                exito = true;
            }

            ps.close();
        } catch (SQLException e) {
            System.err.println("Error al actualizar el contenido: " + e.getMessage());
        } finally {
            MySqlConexion.closeConexion(con);
        }

        return exito;
    }

    public static boolean eliminarContenido(int idContenido) {
        Connection con = MySqlConexion.getConexion();
        boolean exito = false;

        try {
            String query = "DELETE FROM contenido WHERE id_contenido = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idContenido);

            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                exito = true;
            }

            ps.close();
        } catch (SQLException e) {
            System.err.println("Error al eliminar el contenido: " + e.getMessage());
        } finally {
            MySqlConexion.closeConexion(con);
        }

        return exito;
    }

    public static List<Contenido> listarContenidos() {
        Connection con = MySqlConexion.getConexion();
        List<Contenido> contenidos = new ArrayList<>();

        try {
            String query = "call listarContenidosConNomUsuario()";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Contenido contenido = new Contenido();
                contenido.setIdContenido(rs.getInt("id_contenido"));
                contenido.setTitulo(rs.getString("titulo"));
                contenido.setDescripcion(rs.getString("descripcion"));
                contenido.setArchivo(rs.getBytes("archivo"));
                contenido.setNombreArchivo(rs.getString("nombre_archivo"));
                contenido.setFechaCreacion(rs.getDate("fecha_creacion"));
                //contenido.setUsuarioId(rs.getInt("usuario_id"));
                contenido.setUNAME(rs.getString("nombre_usuario"));

                contenidos.add(contenido);
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.err.println("Error al listar los contenidos: " + e.getMessage());
        } finally {
            MySqlConexion.closeConexion(con);
        }

        return contenidos;
    }

    public static Contenido obtenerContenido(int idContenido) {
        Connection con = MySqlConexion.getConexion();
        Contenido contenido = null;

        try {
            String query = "SELECT * FROM contenido WHERE id_contenido = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idContenido);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                contenido = new Contenido();
                contenido.setIdContenido(rs.getInt("id_contenido"));
                contenido.setTitulo(rs.getString("titulo"));
                contenido.setDescripcion(rs.getString("descripcion"));
                contenido.setArchivo(rs.getBytes("archivo"));
                contenido.setNombreArchivo(rs.getString("nombre_archivo"));
                contenido.setFechaCreacion(rs.getDate("fecha_creacion"));
                contenido.setUsuarioId(rs.getInt("usuario_id"));
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.err.println("Error al obtener el contenido: " + e.getMessage());
        } finally {
            MySqlConexion.closeConexion(con);
        }

        return contenido;
    }
}
