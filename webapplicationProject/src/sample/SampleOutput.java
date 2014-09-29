package sample;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SecureAuthentication.Authenticator;

public class SampleOutput extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
//		try {
//			for(int i = 0; i < 1000; i++)
//				resp.getWriter().println(Authenticator.createHashPassword("rodolfo".toCharArray()));
//		} catch (InvalidKeySpecException | NoSuchAlgorithmException
//				| NoSuchProviderException e) {
//			e.printStackTrace();
//		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8888/studentdb","rodolfouser","poldz123");
			Statement s = (Statement) conn.createStatement();
			String username = req.getParameter("first_name");
			String password = req.getParameter("last_name");
			try {
				ResultSet result = s.executeQuery("SELECT password FROM users WHERE username = '"+username +"'");
				
				while(result.next())
				{
					String dataPassword = result.getString("password");
					resp.getWriter().print("Hashed-Password: " + dataPassword);
					if(Authenticator.validatePassword(password, dataPassword))
						resp.getWriter().println("\n\nRESULT: Password from USERNAME exist in DATABASE. You are log in to the server");
					else
						resp.getWriter().println("\n\nRESULT: Password from USERNAME exist in DATABASE. You provide a WRONG password");
					
					return;
				}
				resp.getWriter().print("RESULT:  Password from USERNAME does not exist in DATABASE");
				
			} catch (InvalidKeySpecException | NoSuchAlgorithmException e) {
				e.printStackTrace();
			}finally{
				s.close();
				conn.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();	
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
//		resp.sendRedirect("http://localhost:8080/webapplicationProject/mainpage/");
	}
}
