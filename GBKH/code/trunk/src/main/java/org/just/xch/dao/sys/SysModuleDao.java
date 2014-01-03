package org.just.xch.dao.sys;

import java.util.List;
import java.util.Map;

import org.just.xch.domain.sys.SysModule;

public interface SysModuleDao
{
	public SysModule findSysModuleById(int id);

	public List<SysModule> queryModulesByCondition(Map<String, Object> condition);
	
	public List<SysModule> findModulesByParentID(int pid);

	public List<SysModule> findModulesByCondition(Map<String, Object> condition);

	public int insertSysModule(SysModule sysModule);

	public void updateSysModule(Map<String, Object> condition);
	
	public void deleteSysModule(int id);
	
	public void deleteSysModuleByParentID(int parentID);
}
