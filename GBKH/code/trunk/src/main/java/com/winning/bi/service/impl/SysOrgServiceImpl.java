package com.winning.bi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.winning.bi.dao.sys.SysOrgDao;
import com.winning.bi.domain.sys.SysOrg;
import com.winning.bi.domain.sys.SysUser;
import com.winning.bi.domain.sys.SysUserOrgMapping;
import com.winning.bi.service.intf.SysOrgService;
import com.winning.utils.DpUtil;
import com.winning.utils.NewwinningUtil;
import com.winning.utils.Pinyin4jUtil;

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
