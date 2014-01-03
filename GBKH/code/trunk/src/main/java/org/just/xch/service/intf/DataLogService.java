package org.just.xch.service.intf;

import java.util.List;

import org.just.xch.domain.sys.DataLog;

public interface DataLogService
{
	
	public void saveDataLog(DataLog datalog);
	
	public void saveDataLogs(List<DataLog> datalogList);
}
