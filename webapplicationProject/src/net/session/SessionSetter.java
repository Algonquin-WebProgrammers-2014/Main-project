/**
 * Responsible for estalishing a session variable Lang as either 
 * eng, fre, or chn for various languages
 * 
 * @author David Yu & Jenny Liu
 * @version 0.2
 * @Documented by David Yu & Jenny Liu
 * **/
package net.session;

//Author: David Yu & Jenny Liu
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionSetter extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3049829167961915709L;

	/**
	 * Responsible for setting session varaible lang when doPost is called
	 * 
	 * @author David Yu
	 * 
	 * documented by: David Yu
	 * **/
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		if (req.getParameter("english") != null) 
			req.getSession().setAttribute("lang", "en");
		else if (req.getParameter("french") != null) 
			req.getSession().setAttribute("lang", "fr");
		else if (req.getParameter("chinese") != null) 
			req.getSession().setAttribute("lang", "cn");						
		else 
			resp.sendRedirect("/");
		
		resp.sendRedirect("webapp/mainpage/");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
}
