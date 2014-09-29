/**
 * A helper class for connecting to database
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see Authenticator
 * **/

package Utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
	
	public static Connection createDataBaseConnection(String database, String username, String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/"+database,username,password);
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static void closeDataBaseConnection(Connection conn, Statement s) {
		try {
			conn.close();
			s.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void closeDataBaseConnection(Connection conn) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}