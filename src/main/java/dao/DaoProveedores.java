package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import modelo.Proveedores;
import util.MySqlConexion;

public class DaoProveedores {
	public List <Proveedores> getProveedores () throws Exception {
		List <Proveedores> proveedor = new ArrayList<>();
		
		Connection miConexion = null;
		Statement miStatement = null;
		ResultSet miResultSet = null;
		
		miConexion = MySqlConexion.getConexion();
		
		String instruccionSql = "SELECT PI.COD_PROV, P.NOMBRE, P.NUMEROTEL, P.ESTADO, PI.COD_INS  "
				+ "FROM PROVEEDOR P, PROVEEDORXINSUMO PI"
				+ " WHERE P.COD_PROV = PI.COD_PROV ORDER BY PI.COD_PROV";
		
		miStatement  = miConexion.createStatement();
		
		miResultSet = miStatement.executeQuery(instruccionSql);
		
		while(miResultSet.next()) {
			String nombre_p = miResultSet.getString("NOMBRE");
			String telefono = miResultSet.getString("NUMEROTEL");
			int cod_prov = miResultSet.getInt("COD_PROV");
			int insumo = miResultSet.getInt("COD_INS");
			String estado = miResultSet.getString("ESTADO");
			
			Proveedores tempProv = new Proveedores(cod_prov, insumo, estado, nombre_p, telefono);
			proveedor.add(tempProv);
		}
		return proveedor;
	}

	public Proveedores getProveedor(int codigoProv) throws Exception {
		Proveedores prov = null;
		Connection miConexion = null;
		PreparedStatement miStatement = null;
		ResultSet miResultSet = null;
		int codigo_p = codigoProv;
		
		try {
			miConexion = MySqlConexion.getConexion();
			
			String SQL = "SELECT * FROM PROVEEDOR WHERE COD_PROV=?";
			
			miStatement=miConexion.prepareStatement(SQL);
			
			miStatement.setInt(1, codigo_p);
			
			miResultSet = miStatement.executeQuery();
			
			if(miResultSet.next()) {
				String nombre_p = miResultSet.getString("NOMBRE");
				String telefono = miResultSet.getString("NUMEROTEL");
				int cod_prov = miResultSet.getInt("COD_PROV");
				String estado = miResultSet.getString("ESTADO");
				
				prov = new Proveedores(cod_prov, nombre_p, telefono, estado);
				
			}else {
				throw new Exception ("No encontramos el proveedor con código "+ codigo_p);
			}
		}catch(Exception e) {
			
		}
		return prov;
	}

	public void agregarNuevoProveedor(Proveedores nuevoProveedor) {
		Connection miConexion = null;
		PreparedStatement miStatement = null;
		
		try {
			miConexion = MySqlConexion.getConexion();
			String SQL = "INSERT INTO PROVEEDOR(NOMBRE, NUMEROTEL, ESTADO) VALUES(?,?,?)";
			
			miStatement = miConexion.prepareStatement(SQL);
			
			miStatement.setString(1, nuevoProveedor.getNombre());
			miStatement.setString(2, nuevoProveedor.getNumeroTel());
			miStatement.setString(3, nuevoProveedor.getEstado());
			
			miStatement.execute();
		}catch(Exception e){
			
		}
	}

	public void actualizarProveedor(Proveedores provActualizado) throws Exception{
		Connection miConexion =  null;
		PreparedStatement miStatement = null;
		
		miConexion = MySqlConexion.getConexion();
	 
		String sql = "UPDATE PROVEEDOR SET NOMBRE=?, NUMEROTEL = ?, "
				+ "ESTADO=? WHERE COD_PROV=?";
	  
	  	miStatement = miConexion.prepareStatement(sql);
		miStatement.setString(1, provActualizado.getNombre());
		miStatement.setString(2, provActualizado.getNumeroTel());
		miStatement.setString(3, provActualizado.getEstado());
		miStatement.setInt(4, provActualizado.getCod_prov());
	 	
	 	miStatement.execute();
	}

	public void eliminarProveedor(int codProv, int codIns) throws Exception {
		Connection miConexion =  null;
		PreparedStatement miStatement = null;
		
		miConexion = MySqlConexion.getConexion();
		
		String sql = "DELETE FROM PROVEEDORXINSUMO WHERE COD_PROV=? AND COD_INS=?";
		
		miStatement = miConexion.prepareStatement(sql);
		miStatement.setInt(1, codProv);
		miStatement.setInt(2, codIns);
		
		miStatement.execute();
	}

	public void agregarNuevoInsumoProveedor(Proveedores nuevoInsumoProveedor) {
		Connection miConexion = null;
		PreparedStatement miStatement = null;
		
		try {
			miConexion = MySqlConexion.getConexion();
			String SQL = "INSERT INTO PROVEEDORXINSUMO(COD_PROV, COD_INS) VALUES(?,?)";
			miStatement = miConexion.prepareStatement(SQL);
			
			miStatement.setInt(1, nuevoInsumoProveedor.getCod_prov());
			miStatement.setInt(2, nuevoInsumoProveedor.getCod_ins());

			miStatement.execute();
		}catch(Exception e){
			
		}
	}

	
}
