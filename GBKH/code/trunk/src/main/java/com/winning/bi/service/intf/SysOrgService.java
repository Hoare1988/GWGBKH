package com.winning.bi.service.intf;

import java.util.List;

import com.winning.bi.domain.sys.SysOrg;
import com.winning.bi.domain.sys.SysUser;
import com.winning.bi.domain.sys.SysUserOrgMapping;

public interface SysOrgService {
	List<SysOrg> queryOrgByCondition(String name,String py);
	
	void addSysUserOrgMap(SysUserOrgMapping uerOrgMapping);
	
	void saveOrUpdateOrg(SysOrg sysorg);
	
	List<SysUserOrgMapping> findUserOrgMapByConsdition(SysUser sysUser,SysOrg sysOrg);
	
	List<SysUser> findUserByOrgAndStation(String orgName,Integer station);
}
