package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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

}
