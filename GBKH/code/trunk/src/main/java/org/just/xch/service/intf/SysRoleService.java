package org.just.xch.service.intf;

import java.util.List;

import org.just.exception.BusinessException;
import org.just.xch.domain.sys.SysRole;
import org.just.xch.domain.sys.SysUser;

public interface SysRoleService
{
	public SysRole insertSysRole(SysRole sysRole) throws BusinessException;

	public SysRole updateSysRole(SysRole sysRole);

	public List<SysRole> queryRolesByCondition(String name);

	public List<SysRole> queryPmRoles(String name);

	public SysRole savePmRoleModules(SysRole sysRole);

	public List<SysRole> findRolesByUser(SysUser sysUser);
}
