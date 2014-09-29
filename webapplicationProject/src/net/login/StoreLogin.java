/**
 * Responsible for checking the password in the database for store users
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see Authenticator
 * **/
package net.login;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SecureAuthentication.Authenticator;
import Utilities.DatabaseConnection;

public class StoreLogin extends HttpServlet{

	public final String db = "storedb";
	public final String username = "rodolfouser";
	public final String password = "poldz123";
	
	public void showAlert(HttpServletResponse resp, String message) throws IOException{
		resp.getWriter().print("<script>alert('"+message+"');location='verification/store/'</script>");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession(true);
			
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DatabaseConnection.createDataBaseConnection(db,username,password);
			Statement s = (Statement) conn.createStatement();
			
			String username = req.getParameter("storeid");
			String password = req.getParameter("password");
			
			//create the session object
			session = req.getSession();
			
			try {
				ResultSet result = s.executeQuery("SELECT password FROM store WHERE storeid = '"+username +"'");

				while(result.next())
				{
					String dataPassword = result.getString("password");
					if(Authenticator.validatePassword(password, dataPassword))
					{
						resp.getWriter().println("\n\nRESULT: Password from USERNAME exist in DATABASE. You are log in to the server");
						resp.sendRedirect("mainpage/store/orderlist.jsp");
						session.setAttribute("store", username);
					}
					else
					{
						showAlert(resp,"Wrong password or username");
					}
					
					return;
				}
				
				showAlert(resp,"Wrong password or username");	
				
			} catch (InvalidKeySpecException | NoSuchAlgorithmException e) {
				resp.getWriter().print("RESULT:  Password from USERNAME does not exist in DATABASE");
				e.printStackTrace();
			}finally{
				DatabaseConnection.closeDataBaseConnection(conn,s);
			}

		} catch (SQLException e) {
			e.printStackTrace();	
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
		}
		
		
		
	}
}
