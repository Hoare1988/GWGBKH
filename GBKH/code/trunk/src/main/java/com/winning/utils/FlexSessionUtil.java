package com.winning.utils;

import flex.messaging.FlexContext;
import flex.messaging.FlexSession;

public class FlexSessionUtil
{
	public static void createSessionID(String sessionID)
	{
		setAttribute(Constant.SESSION_ID, sessionID);
	}

	public static String getSessionID()
	{
		String sessionID = null;
		if (getAttribute(Constant.SESSION_ID) != null)
		{
			sessionID = getAttribute(Constant.SESSION_ID).toString();
		}
		return sessionID;
	}

	public static void setAttribute(String name, Object value)
	{
		FlexSession session = FlexContext.getFlexSession();
		if (session != null)
		{
			session.setAttribute(name, value);
		}
	}

	public static Object getAttribute(String name)
	{
		FlexSession session = FlexContext.getFlexSession();
		Object object = null;
		if (session != null)
		{
			object = session.getAttribute(name);
		}
		return object;
	}

	public static void clearSession()
	{
		FlexSession session = FlexContext.getFlexSession();
		if (session != null)
		{
			session.removeAttribute(Constant.SESSION_SYSUSER);
			session.removeAttribute(Constant.SESSION_ID);
			session.invalidate();
		}
	}

}
