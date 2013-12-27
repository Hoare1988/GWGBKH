package com.winning.utils;

import org.springframework.context.ApplicationContext;

public class LocatorService
{
	private static LocatorService instance = new LocatorService();

	// ApplicationContext _ac = null;

	private ApplicationContext getBeanFactory() throws Exception
	{
		/**
		 * if (this._ac == null) { String appContext =
		 * System.getProperty("file.separator") +
		 * GlobeConte.getContext("homedir") +
		 * System.getProperty("file.separator") + "WEB-INF" +
		 * System.getProperty("file.separator") + "applicationContext.xml";
		 * this._ac = new FileSystemXmlApplicationContext(""); return this._ac;
		 * }
		 */

		return Constant.SPRING_CONTAINER;
	}

	public static LocatorService getInstance()
	{
		return instance;
	}

	public Object getService(String serviceName) throws Exception
	{
		Object obj = null;
		try
		{
			obj = getBeanFactory().getBean(serviceName);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return obj;
	}

}
