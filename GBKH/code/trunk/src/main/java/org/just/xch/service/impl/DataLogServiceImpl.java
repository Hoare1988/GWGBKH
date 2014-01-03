package org.just.xch.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.just.xch.dao.sys.DataLogDao;
import org.just.xch.domain.sys.DataLog;
import org.just.xch.service.intf.DataLogService;

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
