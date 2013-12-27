package com.winning.bi.dao.sys;

import java.util.List;
import java.util.Map;

import com.winning.bi.domain.sys.ExeItem;


public interface ExeItemDao
{
	void insertExeItem(ExeItem item);
	void updateExeItem(ExeItem item);
	List<ExeItem> findExeItemByCondition(Map<String,Object> conditions);
	ExeItem findExeItemByID(int id);
	ExeItem findLastInsertExeItem();
	Integer getMaxExeItemID();
	
}
