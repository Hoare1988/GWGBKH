package com.winning.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.winning.bi.domain.DataLog;
import com.winning.bi.domain.IndVarDimMap;

public class DpUtil
{
	public static Map<String, Object> getConMap()
	{
		return new HashMap<String, Object>();
	}

	public static DataLog genDataLog(IndVarDimMap vdMap, String startDate,
			String endDate, String msg, int flag, int actNum, int tmpNum,
			Long seconds)
	{
		DataLog log = new DataLog();
		log.setOrgCode(null);
		if (vdMap != null)
		{
			if (vdMap.getDbConn() != null)
			{
				log.setDbCode(vdMap.getDbConn().getCode());
			}
			if (vdMap.getIndVariable() != null)
			{
				log.setVarCode(vdMap.getIndVariable().getCode());
			}
			if (vdMap.getDimension1() != null)
			{
				log.setDimCode1(vdMap.getDimension1().getCode());
			}
			if (vdMap.getDimension2() != null)
			{
				log.setDimCode2(vdMap.getDimension2().getCode());
			}
		}
		log.setFrequency(vdMap.getFrequency());
		log.setFlag(flag);
		log.setActNum(actNum);
		log.setTmpNum(tmpNum);
		log.setSeconds(seconds.intValue());
		log.setStartDate(DateUtil.createDate(startDate, "yyyy-MM-dd HH:mm:ss"));
		log.setEndDate(DateUtil.createDate(endDate, "yyyy-MM-dd HH:mm:ss"));
		log.setMsg(msg);

		return log;
	}

}
