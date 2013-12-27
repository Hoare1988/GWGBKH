package com.winning.bi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.winning.bi.dao.sys.DataLogDao;
import com.winning.bi.domain.sys.DataLog;
import com.winning.bi.service.intf.DataLogService;

public class DataLogServiceImpl implements DataLogService
{

	@Override
	public void saveDataLog(DataLog datalog)
	{
		dataLogDao.saveDataLog(datalog);
	}

	@Override
	public void saveDataLogs(List<DataLog> datalogList)
	{
		if (datalogList != null && datalogList.size() > 0)
		{
			for (DataLog dl : datalogList)
			{
				if (dl != null)
				{
					saveDataLog(dl);
				}
			}
		}
	}

	@Resource
	private DataLogDao dataLogDao;

}
