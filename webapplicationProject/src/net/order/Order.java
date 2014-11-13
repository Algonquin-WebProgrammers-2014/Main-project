package net.order;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pizza.PizzaContext;
import Utilities.PizzaCollection;
import Utilities.Util;
import Utilities.DatabaseConnection;

public class Order extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4773368439060219606L;

	private final String db = "storedb";
	private final String username = "rodolfouser";
	private final String password = "poldz123";
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		
		String firstName = req.getParameter("firstname");
		String lastName = req.getParameter("lastname");
		String phoneNumber = req.getParameter("phonenumber");
		String address = req.getParameter("address");
		
		if(Util.isEmptyAndZero(firstName) || Util.isEmptyAndZero(lastName) || Util.isEmptyAndZero(phoneNumber) || Util.isEmptyAndZero(address))
		{
			
		} else
		{
			PizzaCollection pizza = (PizzaCollection)req.getSession().getAttribute("cart");
			
			try {
				
				String id = Utilities.Util.createId();
				String insertCustomerSql = "INSERT INTO customer(customer_id,first_name, last_name, address, phone) VALUES(?,?,?,?,?)";
				String insertOrderSql = "INSERT INTO storedb.order(order_id,delivery_by,total,quantity,customer_id) VALUES(?,?,?,?,?)";
				String insertHistoryOrderSql = "INSERT INTO storedb.customer_history_order(order_id) VALUES(?)";
				Connection c = DatabaseConnection.createDataBaseConnection(db, username, password);
				
				PreparedStatement ps = c.prepareStatement(insertCustomerSql);
				ps.setString(1, id);
				ps.setString(2, firstName);
				ps.setString(3, lastName);
				ps.setString(4, address);
				ps.setString(5, phoneNumber);
				ps.executeUpdate();
				
				PreparedStatement ps2 = c.prepareStatement(insertOrderSql);
				ps2.setString(1, id);
				ps2.setDate(2, new java.sql.Date(new Date().getTime()));
				ps2.setDouble(3, Double.parseDouble(pizza.gettotalPrice()));
				ps2.setInt(4, pizza.getSize());
				ps2.setString(5, id);
				ps2.executeUpdate();
				
				PreparedStatement ps3 = c.prepareStatement(insertHistoryOrderSql);
				ps3.setString(1, id);
				ps3.executeUpdate();
				
				for(String ini : pizza.getHash().keySet())
				{
					String initial = pizza.getHash().get(ini).getPizza().getInitial();
					int small = pizza.getHash().get(ini).getSmallCount();
					int med = pizza.getHash().get(ini).getMediumCount();
					int large = pizza.getHash().get(ini).getLargeCount();
					int xlarge = pizza.getHash().get(ini).getxLargeCount();
					
					if(small != 0)
						addPizzaToDatabase(c, Utilities.ContextVariable.Size.SMALL.ordinal(), small, id, initial );
					if(med != 0)
						addPizzaToDatabase(c, Utilities.ContextVariable.Size.MEDIUM.ordinal(), med, id, initial );
					if(large != 0)
						addPizzaToDatabase(c, Utilities.ContextVariable.Size.LARGE.ordinal(), large, id, initial );
					if(xlarge != 0)
						addPizzaToDatabase(c, Utilities.ContextVariable.Size.XLARGE.ordinal(), xlarge, id, initial );
				}

				DatabaseConnection.closeDataBaseConnectionWithPreparred(c, ps, ps2,ps3);
				
				req.getSession().setAttribute("orderId", id);
				
				resp.getWriter().println("<script type='text/javascript' src='../webapplicationProject/js/UpdateOrderlist.js'></script>");
				
				Cookie orderId = new Cookie("orderId", id);
				orderId.setMaxAge(60*60*1);
				resp.addCookie(orderId);
				
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//resp.sendRedirect("webapp/mainpage/status");
	}
	
	private void addPizzaToDatabase(Connection c, int size, int quantity, String orderId, String initial) throws SQLException{
		
		String insertPizzaSql = "INSERT INTO pizza(size,quantity,order_order_id,special_pizza_list_idspecial_pizza_list) VALUES(?,?,?,?)";
		String insertHistoryPizzaSql = "INSERT INTO customer_history_pizza(size,quantity,order_id,special_pizza_list_idspecial_pizza_list) VALUES(?,?,?,?)";
		
		PreparedStatement ps3 = c.prepareStatement(insertPizzaSql);
		ps3.setInt(1, size);
		ps3.setInt(2, quantity);
		ps3.setString(3, orderId);
		ps3.setString(4, initial);
		ps3.executeUpdate();
		ps3.close();
		
		PreparedStatement ps4 = c.prepareStatement(insertHistoryPizzaSql);
		ps4.setInt(1, size);
		ps4.setInt(2, quantity);
		ps4.setString(3, orderId);
		ps4.setString(4, initial);
		ps4.executeUpdate();
		ps4.close();
	}
}
