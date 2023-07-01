package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelo.Categorias;
import util.MySqlConexion;

public class DaoCategoria {
	public List <Categorias> getCategorias () throws Exception {
		List <Categorias> tipos = new ArrayList<>();
		
		Connection miConexion = null;
		Statement miStatement = null;
		ResultSet miResultSet = null;
		
		miConexion = MySqlConexion.getConexion();
		
		String instruccionSql = "select * FROM TIPO_INSUMO";
		
		miStatement  = miConexion.createStatement();
		
		miResultSet = miStatement.executeQuery(instruccionSql);
		
		while(miResultSet.next()) {
			int codigo = miResultSet.getInt("COD_TIPO");
			String nombre = miResultSet.getString("NOMBRE");
			
			Categorias tempCat = new Categorias(codigo, nombre);
			tipos.add(tempCat);
		}
		return tipos;
	}

	public void agregarNuevaCategoria(Categorias nuevoTipo) {
		Connection miConexion = null;
		PreparedStatement miStatement = null;
		
		try {
			miConexion = MySqlConexion.getConexion();
			String SQL = "INSERT INTO TIPO_INSUMO(COD_TIPO, NOMBRE) VALUES(?,?)";
			miStatement = miConexion.prepareStatement(SQL);
			
			miStatement.setInt(1, nuevoTipo.getCod_tipo());
			miStatement.setString(2, nuevoTipo.getNom_tipo());
			
			
			miStatement.execute();
		}catch(Exception e){
			
		}
	}
}
