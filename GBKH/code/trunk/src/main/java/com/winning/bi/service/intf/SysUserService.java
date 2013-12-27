package com.winning.bi.service.intf;

import java.util.List;

import com.winning.bi.domain.sys.SysUser;
import com.winning.exception.BusinessException;

public interface SysUserService
{
	/**
	 * 登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public SysUser login(String username, String password);

	public SysUser insertSysUser(SysUser sysUser) throws BusinessException;

	public SysUser savePmUserRoles(SysUser sysUser);

	public SysUser updateSysUser(SysUser sysUser);

	public List<SysUser> queryUsersByCondition(String userName,
			String realName, String py);

	public List<SysUser> queryPmUsers(String userName, String realName,
			String py);

	public void updatePassword(SysUser sysUser, String oldPwd, String newPwd)
			throws Exception;

	public void existSystem();
}
