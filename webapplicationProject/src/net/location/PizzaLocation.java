package net.location;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PizzaLocation extends HttpServlet{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -566263558612484332L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		PrintWriter pw = resp.getWriter();
		pw.print("<table class='findus-main-table'>");
		pw.println("<tr class='findus-main-table-header'>");
		pw.println("<th colspan='2'>Pizza place nearby</th></tr>");
		pw.println("<tr ><td class='findus-main-table-map'>");
		pw.println("<img class='static-map' src='http://maps.googleapis.com/maps/api/staticmap?size=200x150&zoom=16&markers=color:orange%7Clabel:S%7Ck1j8v6&sensor=false' onClick='swap();' id='static-map-id'/></td>");
		pw.println("<td class='findus-main-table-info'>");
		pw.println("<div class='findus-main-table-info-location'>");
		pw.println("<span >1244 Donald Street</span><br/>Ottawa, ON</div>");
		pw.println("<table><tr><td><div>");
		pw.println("<div>Phone: (613)-123-1234</div>");
		pw.println("<div>Distance: 0.123km</div></div></td>");
		pw.println("</td><td>");
		pw.println("<div><b>Store Hours:</b></div>");
		pw.println("<div>Mon - Fri:  8am - 2am</div>");
		pw.println("<div>Sat & Sun:  10am - 12am</div></td></tr></table></td></tr>");
		
		pw.println("<tr ><td class='findus-main-table-map'>");
		pw.println("<img class='static-map' src='http://maps.googleapis.com/maps/api/staticmap?size=200x150&zoom=16&markers=color:orange%7Clabel:S%7Ck1j8v6&sensor=false' onClick='swap();' id='static-map-id'/></td>");
		pw.println("<td class='findus-main-table-info'>");
		pw.println("<div class='findus-main-table-info-location'>");
		pw.println("<span >1244 Donald Street</span><br/>Ottawa, ON</div>");
		pw.println("<table><tr><td><div>");
		pw.println("<div>Phone: (613)-123-1234</div>");
		pw.println("<div>Distance: 0.123km</div></div></td>");
		pw.println("</td><td>");
		pw.println("<div><b>Store Hours:</b></div>");
		pw.println("<div>Mon - Fri:  8am - 2am</div>");
		pw.println("<div>Sat & Sun:  10am - 12am</div></td></tr></table></td></tr>");
		
		pw.println("<tr ><td class='findus-main-table-map'>");
		pw.println("<img class='static-map' src='http://maps.googleapis.com/maps/api/staticmap?size=200x150&zoom=16&markers=color:orange%7Clabel:S%7Ck1j8v6&sensor=false' onClick='swap();' id='static-map-id'/></td>");
		pw.println("<td class='findus-main-table-info'>");
		pw.println("<div class='findus-main-table-info-location'>");
		pw.println("<span >1244 Donald Street</span><br/>Ottawa, ON</div>");
		pw.println("<table><tr><td><div>");
		pw.println("<div>Phone: (613)-123-1234</div>");
		pw.println("<div>Distance: 0.123km</div></div></td>");
		pw.println("</td><td>");
		pw.println("<div><b>Store Hours:</b></div>");
		pw.println("<div>Mon - Fri:  8am - 2am</div>");
		pw.println("<div>Sat & Sun:  10am - 12am</div></td></tr></table></td></tr>");

		pw.println("<tr ><td class='findus-main-table-map'>");
		pw.println("<img class='static-map' src='http://maps.googleapis.com/maps/api/staticmap?size=200x150&zoom=16&markers=color:orange%7Clabel:S%7Ck1j8v6&sensor=false' onClick='swap();' id='static-map-id'/></td>");
		pw.println("<td class='findus-main-table-info'>");
		pw.println("<div class='findus-main-table-info-location'>");
		pw.println("<span >1244 Donald Street</span><br/>Ottawa, ON</div>");
		pw.println("<table><tr><td><div>");
		pw.println("<div>Phone: (613)-123-1234</div>");
		pw.println("<div>Distance: 0.123km</div></div></td>");
		pw.println("</td><td>");
		pw.println("<div><b>Store Hours:</b></div>");
		pw.println("<div>Mon - Fri:  8am - 2am</div>");
		pw.println("<div>Sat & Sun:  10am - 12am</div></td></tr></table></td></tr>");
		
		pw.println("</table>");
		
	}
}
