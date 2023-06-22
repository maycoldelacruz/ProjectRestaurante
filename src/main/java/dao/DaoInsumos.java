package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelo.Insumos;
import util.MySqlConexion;

public class DaoInsumos {
	public List <Insumos> getInsumos () throws Exception {
		List <Insumos> insumo = new ArrayList<>();
		
		Connection miConexion = null;
		Statement miStatement = null;
		ResultSet miResultSet = null;
		
		miConexion = MySqlConexion.getConexion();
		
		String instruccionSql = "select * FROM INSUMOS";
		
		miStatement  = miConexion.createStatement();
		
		miResultSet = miStatement.executeQuery(instruccionSql);
		
		while(miResultSet.next()) {
			String nombre_i = miResultSet.getString("NOMBRE");
			int cod_ins = miResultSet.getInt("COD_INS");
			int stk_min = miResultSet.getInt("STKMIN");
			int stk_act = miResultSet.getInt("STK_ACT");
			int cod_tipo = miResultSet.getInt("COD_TIPO");
			double precio = miResultSet.getDouble("PRECIOXKILO");
			
			Insumos tempIns = new Insumos(cod_ins, stk_min, stk_act, nombre_i, cod_tipo, precio);
			insumo.add(tempIns);
		}
		return insumo;
	}

	public void agregarNuevoInsumo(Insumos nuevoInsumo) {
		Connection miConexion = null;
		PreparedStatement miStatement = null;
		
		try {
			miConexion = MySqlConexion.getConexion();
			String SQL = "INSERT INTO INSUMOS(COD_INS, NOMBRE, STKMIN, STK_ACT, COD_TIPO, PRECIOXKILO) VALUES(?,?,?,?,?,?)";
			miStatement = miConexion.prepareStatement(SQL);
			
			miStatement.setInt(1, nuevoInsumo.getCod_ins());
			miStatement.setString(2, nuevoInsumo.getNombre());
			miStatement.setInt(3, nuevoInsumo.getStk_min());
			miStatement.setInt(4, nuevoInsumo.getStk_act());
			miStatement.setInt(5, nuevoInsumo.getCod_tipo());
			miStatement.setDouble(6, nuevoInsumo.getPrecioXkilo());
			
			miStatement.execute();
		}catch(Exception e){
			
		}
	}

	public Insumos getInsumo(int codigo) throws Exception{
		Insumos ins = null;
		Connection miConexion = null;
		PreparedStatement miStatement = null;
		ResultSet miResultSet = null;
		int codigoIns = codigo;
		
		try {
			miConexion = MySqlConexion.getConexion();
			
			String SQL = "SELECT * FROM INSUMOS WHERE COD_INS = ?";
			
			miStatement=miConexion.prepareStatement(SQL);
			
			miStatement.setInt(1, codigoIns);
			
			miResultSet = miStatement.executeQuery();
			
			if(miResultSet.next()) {
				String nombre_i = miResultSet.getString("NOMBRE");
				int cod_ins = miResultSet.getInt("COD_INS");
				int stk_min = miResultSet.getInt("STKMIN");
				int stk_act = miResultSet.getInt("STK_ACT");
				int cod_tipo = miResultSet.getInt("COD_TIPO");
				double precio = miResultSet.getDouble("PRECIOXKILO");
				
				ins = new Insumos(cod_ins, stk_min, stk_act, nombre_i, cod_tipo, precio);
				
			}else {
				throw new Exception ("No encontramos el insumo con código "+ codigoIns);
			}
		}catch(Exception e) {
			
		}
		return ins;
	}

	public void actualizarInsumo(Insumos insActualizado) throws Exception {
		Connection miConexion =  null;
		PreparedStatement miStatement = null;
		
		miConexion = MySqlConexion.getConexion();
	 
		String sql = "UPDATE INSUMOS SET NOMBRE=?, STKMIN = ?, "
				+ "STK_ACT=?, PRECIOXKILO=?, COD_TIPO=? WHERE COD_INS=?";
	  
	  	miStatement = miConexion.prepareStatement(sql);
		miStatement.setString(1, insActualizado.getNombre());
		miStatement.setInt(2, insActualizado.getStk_min());
		miStatement.setInt(3, insActualizado.getStk_act());
	 	miStatement.setDouble(4, insActualizado.getPrecioXkilo());
	 	miStatement.setInt(5, insActualizado.getCod_tipo());
	 	miStatement.setInt(6, insActualizado.getCod_ins());

	 	
	 	miStatement.execute();
	}
}
