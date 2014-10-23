package net.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Order extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4773368439060219606L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String firstName = req.getParameter("firstname");
		String lastName = req.getParameter("lastname");
		String phoneNumber = req.getParameter("phonenumber");
		String address = req.getParameter("address");
		resp.getWriter().print(firstName + lastName + phoneNumber + address);
	}
}
