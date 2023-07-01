package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Productos;

import util.MySqlConexion;

public class DaoProductos {
	
	public static boolean agregarNuevoProducto(Productos nuevoProducto) {
		Connection miConexion = null;	
		boolean exito = false;

		try {
			miConexion = MySqlConexion.getConexion();
			
			String SQL = "insert into producto(IdProducto, Nombres, Precio, Stock, Estado) "
					+ "VALUES(?,?,?,?,?)";
			
			PreparedStatement miStatement = miConexion.prepareStatement(SQL);
			
			miStatement.setInt(1, nuevoProducto.getCod_prod());
			miStatement.setString(2, nuevoProducto.getNomb());
			miStatement.setDouble(3, nuevoProducto.getPrec());
			miStatement.setInt(4, nuevoProducto.getStoc());
			miStatement.setString(5, nuevoProducto.getEstad());
			
			int filasAfectadas= miStatement.executeUpdate();
			if (filasAfectadas>0) {
				exito=true;
			}
			miStatement.close();
		}catch(Exception e){
			System.err.print("Error al agregar Plato"+ e.getMessage());
		}
		return exito;
	}
	
	public static List<Productos> 	listarProductos(){
		Connection con= MySqlConexion.getConexion();
		List<Productos> productos = new ArrayList<>();
		
		try {
			String query = "select * from producto";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				Productos producto= new Productos();
				
				producto.setCod_prod(rs.getInt("IdProducto"));
				producto.setNomb(rs.getString("Nombres"));
				producto.setPrec(rs.getDouble("Precio"));
				producto.setPrec(rs.getInt("Stock"));
				producto.setEstad(rs.getString("Estado"));
				
				productos.add(producto);
	
			}
			rs.close();
			ps.close();
			
		} catch (Exception e) {
			System.err.println("Error al listar los contenidos "+ e.getMessage());
		}finally {
			MySqlConexion.closeConexion(con);
		}
		
		return productos;
	}

	public static boolean eliminarProducto(int codProducto){
		Connection con = MySqlConexion.getConexion();
        boolean exito = false;
		
        try {
        	String sql = "delete from producto where IdProducto=?";
        	PreparedStatement ps=con.prepareStatement(sql);
        	ps.setInt(1, codProducto);
        	
        	int filasAfectadas = ps.executeUpdate();
        	if (filasAfectadas>0) {
        		exito=true;
        	}
        	ps.close();
		} catch (Exception e) {
			System.err.println("Error al eliminar el publicación: " + e.getMessage());
		}finally {
            MySqlConexion.closeConexion(con);
        }
        
        return exito;
		
	}
	
	public Productos BuscarProducto(int id) throws SQLException {
		Productos producto = new Productos();
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs;
		
		try {
			String consulta="SELECT * FROM producto WHERE IdProducto=?";
			
			cn = MySqlConexion.getConexion();
			ps = cn.prepareStatement(consulta);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				producto.setCod_prod(rs.getInt("IdProducto"));
				producto.setNomb(rs.getString("Nombres"));
				producto.setPrec(rs.getDouble("Precio"));
				producto.setStoc(rs.getInt("Stock"));
				producto.setEstad(rs.getString("Estado"));
			}	
		}catch (Exception ex) {
			Logger.getLogger(DaoProductos.class.getName()).log(Level.SEVERE,null,ex);
		}	
		return producto;
	}

	public Productos getProducto(int codigo) {
		Productos prod = null;
		Connection miConexion = null;
		PreparedStatement miStatement = null;
		ResultSet miResultSet = null;
		int codigoProd = codigo;
		
		try {
			
			miConexion = MySqlConexion.getConexion();
			
			String SQL = "select * from producto where IdProducto = ?";
			
			miStatement=miConexion.prepareStatement(SQL);
			
			miStatement.setInt(1, codigoProd);
			
			miResultSet = miStatement.executeQuery();
			
			
			if(miResultSet.next()) {
				int cod_prod = miResultSet.getInt("IdProducto");
				String nomb = miResultSet.getString("Nombres");
				double prec = miResultSet.getDouble("Precio");
				int stoc = miResultSet.getInt("Stock");
				String estad = miResultSet.getString("Estado");
				
				prod = new Productos(cod_prod, nomb, prec, stoc, estad); 
				
			}else {
				
				throw new Exception ("No encontramos el insumo con código "+ codigoProd);
			}	
		} catch (Exception e) {
			
		}
			return prod;
	}

	public void actualizarProducto(Productos proActualizado) throws Exception {
		Connection miConexion =  null;
		PreparedStatement miStatement = null;
		
		miConexion = MySqlConexion.getConexion();
		
		String sql = "update producto set Nombres=?, Precio=?, " 
				+ "Stock=?, Estado=? where IdProducto=?";
		
		miStatement = miConexion.prepareStatement(sql);
		
		miStatement.setString(1, proActualizado.getNomb() );
		miStatement.setDouble(2, proActualizado.getPrec());
		miStatement.setInt(3, proActualizado.getStoc());
		miStatement.setString(4, proActualizado.getEstad());
		miStatement.setInt(5, proActualizado.getCod_prod());
		
		miStatement.execute();
	}

	

	
	
	
	
	
	
	
	
	
}
