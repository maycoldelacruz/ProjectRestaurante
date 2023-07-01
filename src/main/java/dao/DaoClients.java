package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.plaf.synth.SynthOptionPaneUI;

import com.mysql.cj.MysqlConnection;

import util.MySqlConexion;

import modelo.Clientes;
import modelo.Productos;




public class DaoClients {

	public static List<Clientes> 	listarClientes(){
		Connection con= MySqlConexion.getConexion();
		List<Clientes> clientes = new ArrayList<>();
		
		try {
			String query = "select * from cliente";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				Clientes cliente= new Clientes();
				
				cliente.setCod_Cli(rs.getInt("IdCliente"));
				cliente.setDni(rs.getString("DNI"));
				cliente.setNomb(rs.getString("nombres"));
				cliente.setDirecci(rs.getString("direccion"));
				cliente.setEstad(rs.getString("Estado"));
				
				clientes.add(cliente);
	
			}
			rs.close();
			ps.close();
			
		} catch (Exception e) {
			System.err.println("Error al listar los clientes "+ e.getMessage());
		}finally {
			MySqlConexion.closeConexion(con);
		}
		
		return clientes;
	}
	
	
	public List<Clientes> getClientes() throws SQLException {
		List<Clientes> cliente = new ArrayList<>();
		
		Connection miConexion = null;
		Statement miStatement = null;
		ResultSet miResultSet = null;
		
		miConexion = MySqlConexion.getConexion();
		
		String instruccionsql = "select * from cliente";
		miStatement = miConexion.createStatement();
		
		miResultSet = miStatement.executeQuery(instruccionsql);
		
		while(miResultSet.next()) {
			int cod_Cli = miResultSet.getInt("IdCliente");
			String dni = miResultSet.getString("dni");
			String nomb = miResultSet.getString("nombres");
			String direcci = miResultSet.getString("direccion");
			String estad = miResultSet.getString("estado");
						
			Clientes tempClien = new Clientes(cod_Cli, dni, nomb, direcci, estad);
			cliente.add(tempClien);			
			
			
		}
		return cliente;
	}

	public void agregarNuevoCliente(Clientes nuevoCliente) {
		Connection miConexion = null;
		PreparedStatement miStatement = null;
		
		try {
			miConexion = MySqlConexion.getConexion();
			
			String SQL = "insert into cliente(IdCliente, dni, nombres, direccion, estado) VALUES(?,?,?,?,?)";
			
			miStatement = miConexion.prepareStatement(SQL);
			
			miStatement.setInt(1, nuevoCliente.getCod_Cli());
			miStatement.setString(2, nuevoCliente.getDni());
			miStatement.setString(3, nuevoCliente.getNomb());
			miStatement.setString(4, nuevoCliente.getDirecci());
			miStatement.setString(5, nuevoCliente.getEstad());
			
			miStatement.execute();
		}catch(Exception e){
			
		}
		
	}

	public Clientes getCliente(int codigo) {
		Clientes cli = null;
		Connection miConexion = null;
		PreparedStatement miStatement = null;
		ResultSet miResultSet = null;
		int codigoClie= codigo;
		
		try {
			
			miConexion = MySqlConexion.getConexion();
			
			String SQL = "select * from cliente where IdCliente = ?";
			
			miStatement=miConexion.prepareStatement(SQL);
			
			miStatement.setInt(1, codigoClie);
			
			miResultSet = miStatement.executeQuery();
			
			
			if(miResultSet.next()) {
				int cod_Cli = miResultSet.getInt("IdCliente");
				String dni = miResultSet.getString("dni");
				String nomb  = miResultSet.getString("nombres");
				String direcci = miResultSet.getString("direccion");
				String estad = miResultSet.getString("estado");
				
				cli = new Clientes(cod_Cli, dni, nomb, direcci, estad); 
				
			}else {
				
				throw new Exception ("No encontramos el insumo con código "+ codigoClie);
			}	
		} catch (Exception e) {
			
		}
			return cli;
	}

	public void actualizarCliente(Clientes cliActualizado) throws SQLException {
		Connection miConexion =  null;
		PreparedStatement miStatement = null;
		
		miConexion = MySqlConexion.getConexion();
		
		String sql = "update cliente set dni=?, nombres=?, " 
				+ "direccion=?, estado=? where IdCliente=?";
		
		miStatement = miConexion.prepareStatement(sql);
		
		miStatement.setString(1, cliActualizado.getDni() );
		miStatement.setString(2, cliActualizado.getNomb() );
		miStatement.setString(3, cliActualizado.getDirecci() );
		miStatement.setString(4, cliActualizado.getEstad() );
		miStatement.setInt(5, cliActualizado.getCod_Cli());
		
		miStatement.execute();
		
	}

	public static boolean  eliminarCliente(int cod_Cli) throws SQLException {
		Connection con = MySqlConexion.getConexion();
		boolean exito=false;
		
		try {
			String sql = "delete from cliente where IdCliente=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, cod_Cli);
			int filasAfectadas=ps.executeUpdate();
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

	public Clientes BuscarCliente(String dni) {
		// TODO Auto-generated method stub
		Clientes cliente = new Clientes();
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs;
		
		try {
			String consulta="SELECT * FROM cliente WHERE dni=?";
			
			cn = MySqlConexion.getConexion();
			ps = cn.prepareStatement(consulta);
			ps.setString(1, dni);
			rs = ps.executeQuery();
			while(rs.next()) {
				cliente.setCod_Cli(rs.getInt("IdCliente"));
				cliente.setDni(rs.getString("dni"));
				cliente.setNomb(rs.getString("nombres"));
				cliente.setDirecci(rs.getString("direccion"));
				cliente.setEstad(rs.getString("estado"));
			}	
		}catch (Exception ex) {
			Logger.getLogger(DaoProductos.class.getName()).log(Level.SEVERE,null,ex);
		}	
		
		return cliente;
	}

	

}
	