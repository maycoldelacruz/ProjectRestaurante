package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelo.Venta;
import util.MySqlConexion;
import java.sql.Timestamp;

public class DaoVenta {
	public void AgregarNuevaVenta(Venta nuevaVenta) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into ventas (IdCliente, NumeroSerie, FechaVentas, Monto, Estado) VALUES (?, ?, ?, ?, ?)";
		try {
			con = MySqlConexion.getConexion();
			ps = con.prepareStatement(sql);
			ps.setInt(1, nuevaVenta.getIdcliente());
			ps.setString(2, nuevaVenta.getNumeroserie());
			ps.setTimestamp(3, Timestamp.valueOf(nuevaVenta.getFecha()));
			ps.setDouble(4, nuevaVenta.getMonto());
			ps.setString(5, nuevaVenta.getEstado());
			ps.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void GuardarDetalleVenta(Venta nuevaVenta) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into detalle_venta (IdVentas, IdProducto, Cantidad, PrecioVenta) VALUES (?, ?, ?, ?)";
		try {
			con = MySqlConexion.getConexion();
			ps = con.prepareStatement(sql);
			ps.setInt(1, nuevaVenta.getIdventa());
			ps.setInt(2, nuevaVenta.getIdproducto());
			ps.setInt(3, nuevaVenta.getCantidad());
			ps.setDouble(4, nuevaVenta.getPrecio());
			ps.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public String IdVentas() {
		String idventas = "";
		String sql = "select max(IdVentas) from ventas";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = MySqlConexion.getConexion();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				idventas = rs.getString(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return idventas;
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
			e.printStackTrace();
		}
		return numeroserie;
	}

	public void elimarfila(int codprod) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		conn = MySqlConexion.getConexion();
		String sql = "DELETE FROM PEDIDO_TEMPO WHERE IdProducto = ?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1, codprod);
		ps.execute();
	}
}