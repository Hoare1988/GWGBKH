package com.winning.bi.service.intf;

import java.util.List;

import com.winning.bi.domain.sys.SysModule;
import com.winning.exception.BusinessException;

public interface SysModuleService
{
	public List<SysModule> queryModulesByCondition();

	public SysModule insertSysModule(SysModule sysModule)
			throws BusinessException;

	public SysModule updateSysModule(SysModule sysModule);
	
	public void deleteSysModule(SysModule sysModule);
}
