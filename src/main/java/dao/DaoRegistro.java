package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import modelo.Usuario;
import util.MySqlConexion;

public class DaoRegistro {
	public boolean insertarUsuario(Usuario usuario) {
        Connection con = null;
        PreparedStatement pst = null;
        boolean success = false;

        try {
            con = MySqlConexion.getConexion();
            pst = con.prepareStatement("insert into usuario(uname, upwd, uemail, umobile) values(?, ?, ?, ?)");
            pst.setString(1, usuario.getUname());
            pst.setString(2, usuario.getUpwd());
            pst.setString(3, usuario.getUemail());
            pst.setString(4, usuario.getUmobile());

            int rowCount = pst.executeUpdate();
            success = rowCount > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }
}
