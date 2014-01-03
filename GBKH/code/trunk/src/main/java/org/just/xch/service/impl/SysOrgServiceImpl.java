package org.just.xch.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.just.utils.DpUtil;
import org.just.utils.NewwinningUtil;
import org.just.utils.Pinyin4jUtil;
import org.just.xch.dao.sys.SysOrgDao;
import org.just.xch.domain.sys.SysOrg;
import org.just.xch.domain.sys.SysUser;
import org.just.xch.domain.sys.SysUserOrgMapping;
import org.just.xch.service.intf.SysOrgService;

public class SysOrgServiceImpl implements SysOrgService {

	@Override
	public List<SysOrg> queryOrgByCondition(String name, String py) {
		Map<String, Object> condition = DpUtil.getConMap();
		if (NewwinningUtil.isNotNull(name)) {
			condition.put("name", name);
		}
		if (NewwinningUtil.isNotNull(py)) {
			condition.put("py", py);
		}
		return sysOrgDao.queryByCondition(condition);
	}

	@Override
	public void addSysUserOrgMap(SysUserOrgMapping uerOrgMapping) {
		List<SysUserOrgMapping> userOrgs = this.findUserOrgMapByConsdition(
				uerOrgMapping.getUser(), uerOrgMapping.getOrg());
		if (userOrgs == null || userOrgs.size() == 0) {
			sysOrgDao.insertUserOrgMapping(uerOrgMapping);
		}
	}

	@Override
	public List<SysUserOrgMapping> findUserOrgMapByConsdition(SysUser sysUser,
			SysOrg sysOrg) {
		Map<String, Object> conditionsMap = new HashMap<String, Object>();
		conditionsMap.put("SysUserID", sysUser.getId());
		conditionsMap.put("OrgID", sysOrg.getId());
		return sysOrgDao.findSysUserOrgMapByCondition(conditionsMap);
	}

	@Override
	public List<SysUser> findUserByOrgAndStation(String orgName, Integer station) {

		Map<String, Object> conditionsMap = new HashMap<String, Object>();
		if (NewwinningUtil.isNotNull(orgName)) {
			conditionsMap.put("orgName", orgName);
		}
		if (NewwinningUtil.isNotNull(station)) {
			conditionsMap.put("station", station);
		}
		return sysOrgDao.findUserByOrgAndStation(conditionsMap);
	}

	@Override
	public void saveOrUpdateOrg(SysOrg sysorg) {
		if(sysorg!=null)
		{
			if(!NewwinningUtil.isNotNull(sysorg.getPy())&&NewwinningUtil.isNotNull(sysorg.getName()))
			{
				sysorg.setPy(Pinyin4jUtil.getPinYinHeadChar(sysorg.getName()));
			}
			
			if(sysorg.getId()!=null)
			{
				sysOrgDao.updateSysOrg(sysorg);
			}else
			{
				sysOrgDao.insertSysOrg(sysorg);
			}
		}
	}

	@Resource
	SysOrgDao sysOrgDao;
}
