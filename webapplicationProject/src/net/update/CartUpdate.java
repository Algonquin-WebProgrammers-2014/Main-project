/**
 * Responsible for updating the cart of the system
 * 
 * @author Rodolfo Navalon
 * @version 0.2
 * @Documented by Rodolfo Navalon
 * **/
package net.update;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utilities.ContextVariable.Size;
import Utilities.PizzaCollection;
import Utilities.Util;

public class CartUpdate extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2200757960706501352L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		PizzaCollection pizzaList;
		
		//check if the cart session is not in session
		if(session.getAttribute("cart") == null)
			session.setAttribute("cart", new PizzaCollection());
		
		//get the object from the cart session
		pizzaList = (PizzaCollection)session.getAttribute("cart");
		
		//returns the size of  when size is not null and/or size value is equals to y
		if(req.getParameter("size") != null && req.getParameter("size").equals("y"))
		{
			resp.getWriter().print(pizzaList.getSize());
			return;
		}
		
		//returns the price of the entire pizza and the size in one string
		if(req.getParameter("edit") != null && req.getParameter("edit").equals("y"))
		{
			doEdit(req, resp, pizzaList);
			
			resp.getWriter().print(pizzaList.gettotalPrice() + ":" + pizzaList.getSize());
			return;
		}
			
		String name = req.getParameter("name");
		String initial = req.getParameter("initial");
		String type = req.getParameter("type");
		
		String small = req.getParameter("s");
		String medium = req.getParameter("m");
		String large = req.getParameter("l");
		String xlarge = req.getParameter("xl");
		
		//check if the values are zero or empty and add to pizza data structure
		if(!Util.isEmptyAndZero(small)){
			Util.addPizzaToList(Integer.parseInt(small), type, Size.SMALL, name, initial, pizzaList);			
		}
		
		if(!Util.isEmptyAndZero(medium)){
			Util.addPizzaToList(Integer.parseInt(medium), type, Size.MEDIUM, name, initial, pizzaList);			
		}
		
		if(!Util.isEmptyAndZero(large)){
			Util.addPizzaToList(Integer.parseInt(large), type, Size.LARGE, name, initial, pizzaList);			
		}
		
		if(!Util.isEmptyAndZero(xlarge)){
			Util.addPizzaToList(Integer.parseInt(xlarge), type, Size.XLARGE, name, initial, pizzaList);			
		}
		
		req.setAttribute("cart", pizzaList);
		resp.getWriter().print(pizzaList.getSize());
	}
	
	/**
	 * Will implement the edit part when the request is edit
	 * 
	 * @param req - the servlet request object
	 * @param resp - the servlet response object
	 * @param list - the wrapper of the pizza database collection
	 */
	public void doEdit(HttpServletRequest req, HttpServletResponse resp, PizzaCollection list)
	{
		String intial = req.getParameter("initial");
		
		int small = Integer.parseInt(req.getParameter("s"));
		int medium = Integer.parseInt(req.getParameter("m"));
		int large = Integer.parseInt(req.getParameter("l"));
		int xlarge = Integer.parseInt(req.getParameter("xl"));
		
		list.getHash().get(intial).setSmallCount(small);
		list.getHash().get(intial).setMediumCount(medium);
		list.getHash().get(intial).setLargeCount(large);	
		list.getHash().get(intial).setxLargeCount(xlarge);
	}
}
