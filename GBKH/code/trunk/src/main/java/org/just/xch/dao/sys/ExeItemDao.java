package org.just.xch.dao.sys;

import java.util.List;
import java.util.Map;

import org.just.xch.domain.sys.ExeItem;


public interface ExeItemDao
{
	void insertExeItem(ExeItem item);
	void updateExeItem(ExeItem item);
	List<ExeItem> findExeItemByCondition(Map<String,Object> conditions);
	ExeItem findExeItemByID(int id);
	ExeItem findLastInsertExeItem();
	Integer getMaxExeItemID();
	
}
