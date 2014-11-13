/**
 * A helper class for connecting to database
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see DatabaseConnection
 * **/

package Utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class DatabaseConnection {
	
	/**
	 * Will create a Database connection with the corresponding certificate to the server
	 * 
	 * @param database			The name of the database to use
	 * @param username			The username of the database
	 * @param password			The password to the database
	 * 
	 * @return					The Connection class to the Database	
	 * **/
	public static Connection createDataBaseConnection(String database, String username, String password) throws ClassNotFoundException, SQLException {
		ResourceBundle rb =  MultiLang.generateDatabaseResourceBdl();
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(rb.getString("db"),rb.getString("username"),rb.getString("password"));
		return conn;
	}
	
	/**
	 * Will close the database connection and the sql statement that was opened
	 * 
	 * @param conn			The reference of the Connection to the database
	 * @param s				The reference of the SQL Statement that was opened  
	 * 	
	 * **/
	public static void closeDataBaseConnection(Connection conn, Statement... s) throws SQLException {
		
		if(conn != null)
			conn.close();
		
		for(Statement s2 : s)
		{
			if(s2 != null)
				s2.close();
		}
	}
	
public static void closeDataBaseConnectionWithPreparred(Connection conn, PreparedStatement... p) throws SQLException {
		
		if(conn != null)
			conn.close();
		
		for(PreparedStatement p2 : p)
		{
			if(p2 != null)
				p2.close();
		}
	}
	
	/**
	 * Will close the database connection
	 * 
	 * @param conn			The reference of the Connection to the database
	 * 	
	 * **/
	public static void closeDataBaseConnection(Connection conn) throws SQLException  {
		conn.close();
	}
}