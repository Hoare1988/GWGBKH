package com.winning.bi.dao.sys;

import java.util.List;
import java.util.Map;

import com.winning.bi.domain.sys.SysOrg;
import com.winning.bi.domain.sys.SysUser;
import com.winning.bi.domain.sys.SysUserOrgMapping;

public interface SysOrgDao
{
	List<SysOrg> queryByCondition(Map<String, Object> conditions);
	void deleteByID(int id);
	void insertSysOrg(SysOrg sysOrg);
	void updateSysOrg(SysOrg sysOrg);
	SysOrg findSysOrgById(int id);
	void insertUserOrgMapping(SysUserOrgMapping sysUserOrgMap);
	List<SysOrg> findOrgsBySysUser(SysUser sysUser);
	List<SysUser> findSysUsersByOrg(SysOrg org);
	List<SysUserOrgMapping> findSysUserOrgMapByCondition(Map<String, Object> conditions);
	List<SysUser> findUserByOrgAndStation(Map<String, Object> conditions);
}
