package org.just.xch.service.intf;

import java.util.List;

import org.just.exception.BusinessException;
import org.just.xch.domain.sys.SysModule;

public interface SysModuleService
{
	public List<SysModule> queryModulesByCondition();

	public SysModule insertSysModule(SysModule sysModule)
			throws BusinessException;

	public SysModule updateSysModule(SysModule sysModule);
	
	public void deleteSysModule(SysModule sysModule);
}
