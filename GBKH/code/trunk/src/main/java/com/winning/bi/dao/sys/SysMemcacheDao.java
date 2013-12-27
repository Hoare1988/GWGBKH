package com.winning.bi.dao.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.winning.bi.domain.sys.SysMemcache;

public interface SysMemcacheDao
{

	public List<SysMemcache> findSysMemcacheByHasCache(
			@Param(value = "hasCache") int hasCache);

	public void insertSysMemcache(SysMemcache sysMemcache);

	public void updateSysMemcache(SysMemcache sysMemcache);

	public void deleteSysMemcacheById(long id);

}