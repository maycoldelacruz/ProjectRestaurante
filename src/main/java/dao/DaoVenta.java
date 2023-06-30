package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Venta;
import util.MySqlConexion;



public class DaoVenta {
	public void AgregarNuevaVenta(Venta nuevaVenta) {
	
	}
	
	
	
	
	
	
	
	
	public String GenerarSerie() {
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs;

		String numeroserie="";
		try {

			String sql="select max(NumeroSerie) from ventas";
			cn=MySqlConexion.getConexion();
			ps=cn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				numeroserie=rs.getString(1);
				
			}
			
			
		} catch (Exception e) {
			
		}
		return numeroserie;
	}
}
	
	


