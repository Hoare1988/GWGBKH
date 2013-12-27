package com.just.interceptor;

import javax.annotation.Resource;

import org.aspectj.lang.ProceedingJoinPoint;

import com.winning.bi.dao.sys.DataLogDao;
import com.winning.bi.domain.sys.DataLog;
import com.winning.bi.domain.sys.ExeItem;

public class DataLogInterceptor
{
	
	public Object insertExeItem(ProceedingJoinPoint pjp) throws Throwable
	{
		Object returnBean=pjp.proceed();
		
		ExeItem updateExeItem = (ExeItem) pjp.getArgs()[0];
		DataLog dataLog=new DataLog();
		dataLog.setServiceID(""+updateExeItem.getId());
		dataLog.setCreateBy(updateExeItem.getCreateBy());
		dataLog.setUpdateBy(updateExeItem.getUpdateBy());
		dataLog.setType(DataLog.TYPE_EXE_ITEM);
		dataLog.setValue(""+updateExeItem.getScoreResult());
		dataLogDao.saveDataLog(dataLog);
		
		return returnBean;
	}
	
	public Object updateExeItem(ProceedingJoinPoint pjp) throws Throwable
	{
		Object returnBean=pjp.proceed();
		ExeItem updateExeItem = (ExeItem) pjp.getArgs()[0];
		if(updateExeItem!=null&&updateExeItem.getId()>0)
		{
			DataLog dataLog=new DataLog();
			dataLog.setServiceID(""+updateExeItem.getId());
			dataLog.setCreateBy(updateExeItem.getUpdateBy());
			dataLog.setUpdateBy(updateExeItem.getUpdateBy());
			dataLog.setType(DataLog.TYPE_EXE_ITEM);
			dataLog.setValue(""+updateExeItem.getScoreResult());
			dataLogDao.saveDataLog(dataLog);
		}
		return returnBean;
	}
	
	@Resource
	protected DataLogDao dataLogDao;
	
}
