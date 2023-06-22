package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.Publicacion;
import util.MySqlConexion;

public class DaoPublicacion {
	public static boolean agregarPublicacion(Publicacion publicacion) {
        Connection con = MySqlConexion.getConexion();
        boolean exito = false;

        try {
            String query = "INSERT INTO publicacion (contenido_id, fecha_publicacion, estado) " +
                    "VALUES (?, CURRENT_TIMESTAMP, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, publicacion.getIdContenido());
            ps.setString(2, publicacion.getEstado());
            

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

	public static List<Publicacion> listarPublicacionesPublicadas(){
		Connection con= MySqlConexion.getConexion();
		List<Publicacion> publicaciones=new ArrayList<>();
		try {
			String query="call ListarPublicacionesPublicadas()";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while (rs.next()) {
				Publicacion publicacion = new Publicacion();
				publicacion.setIdPublicacion(rs.getInt("id_publicacion"));
				publicacion.setTitulo(rs.getString("titulo"));
                publicacion.setArchivo(rs.getBytes("archivo"));
                publicacion.setFechapublicacion(rs.getDate("fecha_publicacion"));
                publicacion.setEstado(rs.getString("estado"));
                
				publicaciones.add(publicacion);
			}
			rs.close();
			ps.close();
		}catch (Exception e) {
			System.err.println("Error al listar los contenidos "+ e.getMessage());
		}finally {
			MySqlConexion.closeConexion(con);
		}
		
		
		return publicaciones;
	}
	
	public static List<Publicacion> listarPublicacionesProgramadas(){
		Connection con= MySqlConexion.getConexion();
		List<Publicacion> publicaciones=new ArrayList<>();
		try {
			String query="call ListarPublicacionesPendientes()";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while (rs.next()) {
				Publicacion publicacion = new Publicacion();
				publicacion.setIdPublicacion(rs.getInt("id_publicacion"));
				publicacion.setTitulo(rs.getString("titulo"));
                publicacion.setArchivo(rs.getBytes("archivo"));
                publicacion.setFechapublicacion(rs.getDate("fecha_publicacion"));
                publicacion.setEstado(rs.getString("estado"));
                
				publicaciones.add(publicacion);
			}
			rs.close();
			ps.close();
		}catch (Exception e) {
			System.err.println("Error al listar los contenidos "+ e.getMessage());
		}finally {
			MySqlConexion.closeConexion(con);
		}
		
		
		return publicaciones;
	}

	public static boolean eliminarPublicacion(int idPublicacion) {
		Connection con = MySqlConexion.getConexion();
        boolean exito = false;

        try {
            String query = "DELETE FROM publicacion WHERE id_publicacion = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idPublicacion);

            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                exito = true;
            }

            ps.close();
        } catch (SQLException e) {
            System.err.println("Error al eliminar el publicación: " + e.getMessage());
        } finally {
            MySqlConexion.closeConexion(con);
        }

        return exito;
	}
	
}
