package org.just.xch.dao.sys;

import java.util.List;
import java.util.Map;

import org.just.xch.domain.sys.SysRole;

public interface SysRoleDao
{
	public SysRole findSysRoleById(int id);

	public List<SysRole> queryRolesByCondition(Map<String, Object> condition);

	public List<SysRole> findRolesByCondition(Map<String, Object> condition);

	public int insertSysRole(SysRole sysRole);

	public void updateSysRole(Map<String, Object> condition);

	public void deleteAllRolesModuleMap(int rid);
	
	public void deleteAllRolesModuleByModuleID(int mid);

	public int insertRolesModuleMap(Map<String, Object> condition);

	public List<SysRole> findRolesByUserID(long uid);
}
