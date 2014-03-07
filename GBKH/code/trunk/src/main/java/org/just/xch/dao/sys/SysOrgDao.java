package org.just.xch.dao.sys;

import java.util.List;
import java.util.Map;

import org.just.xch.domain.sys.SysOrg;
import org.just.xch.domain.sys.SysUser;
import org.just.xch.domain.sys.SysUserOrgMapping;

public interface SysOrgDao
{
	List<SysOrg> queryByCondition(Map<String, Object> conditions);
	void deleteByID(int id);
	void insertSysOrg(SysOrg sysOrg);
	void updateSysOrg(SysOrg sysOrg);
	SysOrg findSysOrgById(int id);
	void insertUserOrgMapping(SysUserOrgMapping sysUserOrgMap);
	void deleteUserOrgMap(SysUserOrgMapping sysUserOrgMap);
	void deleteUserOrgMapBySysOrg(SysOrg sysorg);
	
	List<SysOrg> findOrgsBySysUser(SysUser sysUser);
	List<SysUser> findSysUsersByOrg(SysOrg org);
	List<SysUserOrgMapping> findSysUserOrgMapByCondition(Map<String, Object> conditions);
	List<SysUser> findUserByOrgAndStation(Map<String, Object> conditions);
}
