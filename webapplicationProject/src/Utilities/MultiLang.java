/**
 * Responsible for internationalizing the website
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see Authenticator
 * **/
package Utilities;

import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

public class MultiLang {

	
	public static ResourceBundle generateResourceBdl(HttpServletRequest request)
	{
		Locale locale = null;
		String lang = request.getParameter("lang");
		
		if(lang != null)
			locale = new Locale(lang);
		else
			locale = request.getLocale();
		
		ResourceBundle rb = ResourceBundle.getBundle("app", locale);
		
		return rb;
		
	}
}
