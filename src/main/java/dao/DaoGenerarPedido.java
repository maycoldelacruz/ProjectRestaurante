package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelo.GenerarPedido;
import modelo.Insumos;
import util.MySqlConexion;

public class DaoGenerarPedido {

	public Insumos getInsumos(int codigo) throws Exception{
		Insumos ins = null;
		Connection miConexion = null;
		PreparedStatement miStatement = null;
		ResultSet miResultSet = null;
		int codigoIns = codigo;
		
		try {
			miConexion = MySqlConexion.getConexion();
			
			String SQL = "SELECT COD_INS, NOMBRE FROM INSUMOS WHERE COD_INS = ?";
			
			miStatement=miConexion.prepareStatement(SQL);
			
			miStatement.setInt(1, codigoIns);
			
			miResultSet = miStatement.executeQuery();
			
			if(miResultSet.next()) {
				String nombre_i = miResultSet.getString("NOMBRE");
				int cod_ins = miResultSet.getInt("COD_INS");
				
				ins = new Insumos(cod_ins, nombre_i);
				
			}else {
				throw new Exception ("No encontramos el insumo con código "+ codigoIns);
			}
		}catch(Exception e) {
			
		}
		return ins;
	}

	public Insumos buscarInsumo(int id) {
		Insumos ins = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = MySqlConexion.getConexion();
			
			String SQL = "SELECT * FROM INSUMOS WHERE COD_INS = ?";
			
			ps = con.prepareStatement(SQL);
			
			ps.setInt(1,id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				int cod = rs.getInt("COD_INS");
				int stk_act = rs.getInt("STK_ACT");
				int stk_min = rs.getInt("STKMIN");
				String nom = rs.getString("NOMBRE");
				double precio = rs.getDouble("PRECIOXKILO");
				
				ins = new Insumos(cod, stk_min, stk_act, nom, precio);
				
			}else {
				throw new Exception ("No encontramos el insumo con código "+ id);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return ins;
	}

	public void listadoPedido(GenerarPedido gp) {
		Connection conn = null;
		PreparedStatement ps= null;
	
		try {
			conn = MySqlConexion.getConexion();
			
			String SQL = "INSERT INTO PEDIDO_TEMP(COD_INS, COD_PROV, CANTIDAD, PRECIO) VALUES(?,?,?,?)";
			ps = conn.prepareStatement(SQL);
		
			ps.setInt(1, gp.getCod_ins());
			ps.setInt(2, gp.getCod_prov());
			ps.setInt(3, gp.getCantidad());
			ps.setDouble(4, gp.getPrecio());
			
			ps.execute();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	public List<GenerarPedido> getPedidoTemp() throws SQLException {
		List <GenerarPedido> tempo = new ArrayList<>();
		
		Connection conn = null;
		Statement st  = null;
		ResultSet rs = null;
		
		conn = MySqlConexion.getConexion();
		
		String sql = "SELECT PP.COD_INS, I.NOMBRE AS INS, PP.COD_PROV, P.NOMBRE AS PROV, PP.CANTIDAD, PP.PRECIO FROM PEDIDO_TEMP PP "
				+ "INNER JOIN INSUMOS I ON I.COD_INS = PP.COD_INS "
				+ "INNER JOIN PROVEEDOR P ON P.COD_PROV = PP.COD_PROV";
		
		st = conn.createStatement();
		
		rs = st.executeQuery(sql);
		
		while(rs.next()) {
			String nomIns = rs.getString("INS");
			int codIns = rs.getInt("COD_INS");
			String nomProv = rs.getString("PROV");
			int codProv = rs.getInt("COD_PROV");
			int cantidad = rs.getInt("CANTIDAD");
			double precio = rs.getDouble("PRECIO");
			
			GenerarPedido tempPed = new GenerarPedido(codIns, nomIns, codProv, nomProv, cantidad, precio);
			tempo.add(tempPed);
		}
		
		return tempo;	
	}

	public void elimarfila(int insumo, int provee) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		conn = MySqlConexion.getConexion();
		
		String sql = "DELETE FROM PEDIDO_TEMP WHERE COD_PROV = ? AND COD_INS = ?";
		
		ps = conn.prepareStatement(sql);
			
		ps.setInt(1, provee);
		ps.setInt(2, insumo);
		
		ps.execute();
	}

	public void nuevoPedido(List<GenerarPedido> pedido, java.util.Date datum1, java.util.Date datum2) throws SQLException {
		Connection conn =  null;
		PreparedStatement ps = null;
		double total = 0;
		
		for (GenerarPedido temp : pedido) {
			total += temp.getCantidad() * temp.getPrecio();
		}
		
		conn = MySqlConexion.getConexion();
		String sql = "INSERT INTO PEDIDO_PROV (fecha_pedido, fecha_entrega, total) VALUES (?,?,?)";
		ps = conn.prepareStatement(sql);
		
		ps.setDate(1, new Date(datum1.getTime()));
	    ps.setDate(2, new Date(datum2.getTime()));
		ps.setDouble(3, total);
		
		ps.execute();
		
		ps.close();
		ps = null;
		
		sql = "INSERT INTO DETALLE_PEDIDO_PROV (NRO_PEDIDO, COD_INS, COD_PROV, CANTIDAD, PRECIO_KILO) VALUES (?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		
		int numOrden = NumOrden();
		for (GenerarPedido temp : pedido) {
			ps.setInt(1, numOrden);
			ps.setInt(2, temp.getCod_ins());
			ps.setInt(3, temp.getCod_prov());
			ps.setInt(4, temp.getCantidad());
			ps.setDouble(5, temp.getPrecio());
			ps.execute();
		}
		
		ps.close();
		ps = null;
		
		sql = "DELETE FROM PEDIDO_TEMP";
		ps = conn.prepareStatement(sql);
		ps.execute();
			
	}
	
	public int NumOrden() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int num = 0;
		
		con = MySqlConexion.getConexion();
		
		String sql = "SELECT * FROM PEDIDO_PROV";
		
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
				
		while(rs.next()) {
			num = rs.getInt("nro_pedido");
		}
		
		return num;
	}


}
