package org.just.xch.interceptor;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class UserInterceptor implements MethodInterceptor
{
	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable
	{
		/**
		 * if(daoOper (invocation.getMethod ().getName ())){ FlexSession session
		 * = FlexContext.getFlexSession (); SysUser user=(SysUser)
		 * session.getAttribute ("sysuser"); if(user!=null){ System.out.println
		 * (user.getUsername ()+"  "+user.getRealname ()); } BaseDomain
		 * baseDomain = (BaseDomain) invocation.getArguments ()[0]; }
		 */
		Object returnBean = null;
		try
		{
			returnBean = invocation.proceed();
		}
		catch (Exception e)
		{
			throw e;
		}
		return returnBean;
	}

	private boolean daoOper(String mname)
	{
		boolean b = false;
		if (mname != null)
		{
			if (mname.contains("insert") || mname.contains("update")
					|| mname.contains("save") || mname.contains("delete")
					|| mname.contains("submit") || mname.contains("create")
					|| mname.contains("remove"))
			{
				b = true;
			}
		}

		return b;
	}
}
