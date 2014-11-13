/**
 * Responsible for updating the database specially the order table
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see DatabaseUpdate
 * **/
package net.update;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utilities.ContextVariable;
import Utilities.DatabaseConnection;

public class DatabaseUpdate extends HttpServlet{
	
	/**
	 * Will update the database table or alter a table to delete some value within the table
	 */
	
	private final String db = "storedb";
	private final String username = "rodolfouser";
	private final String password = "poldz123";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		if(req.getParameter("status") != null && req.getParameter("id") != null)
		{
			try {
				String id = req.getParameter("id");
				int status = Integer.parseInt(req.getParameter("status"));
				
			    String sql = "UPDATE storedb.order SET status = ? WHERE order_id = ?";
				
				Connection c = DatabaseConnection.createDataBaseConnection(db, username, password);
				PreparedStatement prep = c.prepareStatement(sql);

				if(status == ContextVariable.Status.ORDER_DELIVERED.ordinal())
				{
					prep.setInt(1, status);
					prep.setString(2, id);
				} else if(status == ContextVariable.Status.PREP_PIZZA.ordinal())
				{
					prep.setInt(1, status);
					prep.setString(2, id);
				} else if(status == ContextVariable.Status.BAKE_PIZZA.ordinal())
				{
					prep.setInt(1, status);
					prep.setString(2, id);
				} else if(status == ContextVariable.Status.OUT_FOR_DELIVERY.ordinal())
				{
					prep.setInt(1, status);
					prep.setString(2, id);
				}
				
			    prep.executeUpdate();
			    DatabaseConnection.closeDataBaseConnectionWithPreparred(c, prep);
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			
			resp.sendRedirect("webapp/mainpage/store/orderlist.jsp");
			
			return;
		}
		
		if(req.getParameter("adminedit") != null)
		{
			if(session.getAttribute("admin") != null)
			{
				int id = Integer.parseInt(req.getParameter("pizzaid"));
				
				double small = Double.parseDouble(req.getParameter("s"));
				double medium = Double.parseDouble(req.getParameter("m"));
				double large = Double.parseDouble(req.getParameter("l"));
				double xlarge = Double.parseDouble(req.getParameter("xl"));
				
				String sql = "UPDATE special_pizza_price SET small = ?, medium=?, large=?, xlarge=? WHERE idspecial_pizza_price = ?";
				
				Connection c;
				try {
					
					c = DatabaseConnection.createDataBaseConnection(db, username, password);
					PreparedStatement data = c.prepareStatement(sql);
					
					data.setDouble(1, small);
					data.setDouble(2, medium);
					data.setDouble(3, large);
					data.setDouble(4, xlarge);
					data.setInt(5, id);
					
					data.executeUpdate();
					DatabaseConnection.closeDataBaseConnectionWithPreparred(c, data);
					
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}

			}
			
			return;
		}
		
		
		
		if(session.getAttribute("store") != null)
		{
			if(req.getParameter("clear") != null)
			{
				String clearOrderId = req.getParameter("clear");
				String sql = "DELETE FROM storedb.order WHERE order_id = ? ";
				
				Connection c;
				try {
					c = DatabaseConnection.createDataBaseConnection(db, username, password);
					PreparedStatement prep = c.prepareStatement(sql);

					prep.setString(1, clearOrderId);
					prep.executeUpdate();
					DatabaseConnection.closeDataBaseConnectionWithPreparred(c, prep);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				
				resp.sendRedirect("webapp/mainpage/store/orderlist.jsp");
				return;
			}
			resp.sendRedirect("webapp/mainpage/store/orderlist.jsp");
			session.removeAttribute("store");
		}
		else
			resp.sendRedirect("webapp/verification/store/");
		
	}
}
