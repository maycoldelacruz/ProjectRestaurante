package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConexion {

	public static Connection getConexion(){ 

		 Connection con = null;

		 try { Class.forName("com.mysql.cj.jdbc.Driver");

		 String url = "jdbc:mysql://localhost/restaurante?useTimezOne=true&serverTimezone=UTC";
		 String usr = "root";
		 String psw = "adminsi"; 

		 con = DriverManager.getConnection(url,usr,psw);
		 System.out.println("conexion ok");

		 } catch (ClassNotFoundException ex){ 
			 System.out.println("No hay Driver!!"); 
		 } 

		 catch (SQLException ex) {
			 System.out.println("Error con esta BD "); 
		 }

		 return con; 

		 }

			

	public static void closeConexion(Connection con) {

		 try {
			 con.close();

		 } catch(SQLException e) {

			 System.out.println("Problemas al cerrar la conexión");

		 }

	}
	
}
