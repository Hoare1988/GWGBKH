package org.just.utils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class InitServlet extends HttpServlet
{
	private final Logger logger = Logger.getLogger(InitServlet.class);
	public static String WEBAPP_REAL_PATH = "";
	public static WebApplicationContext SPRING_CONTAINER;

	@Override
	public void init() throws ServletException
	{
		Constant.SPRING_CONTAINER = WebApplicationContextUtils
				.getRequiredWebApplicationContext(getServletContext());
		WEBAPP_REAL_PATH = getServletConfig().getServletContext().getRealPath(
				"");
		Constants.WEBAPP_REAL_PATH = getServletConfig().getServletContext()
				.getRealPath("");
	}

}
