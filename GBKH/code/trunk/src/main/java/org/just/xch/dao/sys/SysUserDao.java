package org.just.xch.dao.sys;

import java.util.List;
import java.util.Map;

import org.just.xch.domain.sys.SysModule;
import org.just.xch.domain.sys.SysUser;

public interface SysUserDao
{

	public SysUser findSysUserById(long id);

	public SysUser login(Map<String, Object> condition);

	public List<SysUser> queryUsersByCondition(Map<String, Object> condition);

	public List<SysUser> queryPmUsers(Map<String, Object> condition);

	public List<SysUser> findUsersByCondition(Map<String, Object> condition);
	
	public List<SysUser> queryHistoyUser(Map<String, Object> condition);

	
	
	public List<SysModule> selectAllModulesForRole(Map<String, Object> condition);

	public List<SysModule> selectValidModulesForRole(
			Map<String, Object> condition);

	public int insertSysUser(SysUser sysUser);

	public void updateSysUser(SysUser sysUser);

	public void updateAfterLogin(long id);

	public void deleteAllSysUsersRolesMapping(long uid);

	public int insertSysUsersRolesMapping(Map<String, Object> condition);

	public void updatePassword(Map<String, Object> condition);
}
