package com.winning.bi.dao.sys;

import java.util.List;
import java.util.Map;

import com.winning.bi.domain.sys.Item;
import com.winning.bi.domain.sys.ItemPermission;
import com.winning.bi.domain.sys.SysOrg;

public interface ItemDao
{
	void insertItem(Item item);
	void insertRootItem(Item rootitem);
	void updateItem(Item item);
	List<Item> findItemByCondition(Map<String,Object> conditions);
	Item findItemByID(int id);
	List<Item> findItemsByParentItem(Item parentItem);
	void deleteItem(Item item);
	
	void insertItemPermission(ItemPermission itemPermission);
	List<ItemPermission> findItemPermissionsByCondition(Map<String,Object> conditions);
	List<Item> findItemFromPermitByOrg(SysOrg org);
	void deleteItemPermit(ItemPermission itemPermission);
	
}
