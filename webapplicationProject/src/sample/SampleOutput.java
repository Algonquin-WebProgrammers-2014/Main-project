package sample;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.spec.InvalidKeySpecException;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

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
		try {
			for(int i = 0; i < 1000; i++)
				resp.getWriter().println(Authenticator.createHashPassword("rodolfo".toCharArray()));
		} catch (InvalidKeySpecException | NoSuchAlgorithmException
				| NoSuchProviderException e) {
			e.printStackTrace();
		}
	}
}
