package org.just.utils;

import org.just.xch.domain.sys.SysUser;

import flex.messaging.FlexContext;
import flex.messaging.FlexSession;

public class SysUserUtil
{
	public static SysUser getContextUser()
	{
		SysUser user = null;
		FlexSession session = FlexContext.getFlexSession();
		user = (SysUser) session.getAttribute("sysuser");
		return user;
	}
}
