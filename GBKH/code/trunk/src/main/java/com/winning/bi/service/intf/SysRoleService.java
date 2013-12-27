package com.winning.bi.service.intf;

import java.util.List;

import com.winning.bi.domain.sys.SysRole;
import com.winning.bi.domain.sys.SysUser;
import com.winning.exception.BusinessException;

public interface SysRoleService
{
	public SysRole insertSysRole(SysRole sysRole) throws BusinessException;

	public SysRole updateSysRole(SysRole sysRole);

	public List<SysRole> queryRolesByCondition(String name);

	public List<SysRole> queryPmRoles(String name);

	public SysRole savePmRoleModules(SysRole sysRole);

	public List<SysRole> findRolesByUser(SysUser sysUser);
}
