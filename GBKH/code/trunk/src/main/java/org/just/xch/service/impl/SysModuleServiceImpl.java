package org.just.xch.service.impl;

import java.util.List;
import java.util.Map;

import org.just.exception.BusinessException;
import org.just.utils.Constant;
import org.just.utils.DpUtil;
import org.just.xch.dao.sys.SysModuleDao;
import org.just.xch.dao.sys.SysRoleDao;
import org.just.xch.domain.sys.SysModule;
import org.just.xch.service.intf.SysModuleService;

public class SysModuleServiceImpl implements SysModuleService
{
	private SysModuleDao sysModuleDao;
	private SysRoleDao sysRoleDao;

	public List<SysModule> queryModulesByCondition()
	{
		Map<String, Object> condition = DpUtil.getConMap();
		return sysModuleDao.queryModulesByCondition(condition);
	}

	public SysModule insertSysModule(SysModule sysModule)
			throws BusinessException
	{
		if (sysModule != null)
		{
			Map<String, Object> condition = DpUtil.getConMap();
			condition.put("name", sysModule.getName());
			List<SysModule> list = sysModuleDao
					.findModulesByCondition(condition);
			if (list != null && list.size() > 0)
			{
				throw new BusinessException("模块名[" + sysModule.getName()
						+ "]已存在!");
			}
			sysModule.setComments("");
			sysModuleDao.insertSysModule(sysModule);
			// return sysModuleDao.findSysModuleById (sysModule.getId ());
			return sysModule;
		}
		return null;
	}

	public SysModule updateSysModule(SysModule sysModule)
	{
		if (sysModule != null)
		{
			Map<String, Object> condition = DpUtil.getConMap();
			condition.put("name", sysModule.getName());
			condition.put("path", sysModule.getPath());
			condition.put("ordinal", sysModule.getOrdinal());
			condition.put("isLeaf", sysModule.getIsLeaf());
			condition.put("groupName", sysModule.getGroupName());
			condition.put("id", sysModule.getId());
			sysModuleDao.updateSysModule(condition);
			return sysModuleDao.findSysModuleById(sysModule.getId());
		}
		return null;
	}

	public void setSysModuleDao(SysModuleDao sysModuleDao)
	{
		this.sysModuleDao = sysModuleDao;
	}
;
	public void setSysRoleDao(SysRoleDao sysRoleDao)
	{
		this.sysRoleDao = sysRoleDao;
	}

	@Override
	public void deleteSysModule(SysModule sysModule)
	{
		if(Constant.FALSE==sysModule.getIsLeaf())
		{
			List<SysModule> list= sysModuleDao.findModulesByParentID(sysModule.getId());
			if(list!=null && list.size()>0)
			{
				for(int i=0;i<list.size();i++)
				{
					SysModule tempModule=list.get(i);
					deleteSysModule(tempModule);
				}
			}
			deleteModuleUnit(sysModule.getId());
		}
		else
		{
			deleteModuleUnit(sysModule.getId());
		}
	}
	
	private void deleteModuleUnit(int id)
	{		
		sysRoleDao.deleteAllRolesModuleByModuleID(id);
		sysModuleDao.deleteSysModule(id);
	}

}
