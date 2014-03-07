package org.just.xch.service.intf;

import java.util.List;

import org.just.xch.domain.sys.SysOrg;
import org.just.xch.domain.sys.SysUser;
import org.just.xch.domain.sys.SysUserOrgMapping;

public interface SysOrgService {
	List<SysOrg> queryOrgByCondition(String name,String py);
	
	void addSysUserOrgMap(SysUserOrgMapping uerOrgMapping);
	
	void saveOrUpdateOrg(SysOrg sysorg);
	
	List<SysUserOrgMapping> findUserOrgMapByConsdition(SysUser sysUser,SysOrg sysOrg);
	
	List<SysUser> findUserByOrgAndStation(String orgName,Integer station);
	
	void deleteUserOrgMaps(List<SysUserOrgMapping> uerOrgMaps);
	void deleteUserOrgMapsBySysOrg(SysOrg sysOrg);
}
