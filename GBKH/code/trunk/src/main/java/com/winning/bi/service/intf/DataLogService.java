package com.winning.bi.service.intf;

import java.util.List;

import com.winning.bi.domain.sys.DataLog;

public interface DataLogService
{
	
	public void saveDataLog(DataLog datalog);
	
	public void saveDataLogs(List<DataLog> datalogList);
}
