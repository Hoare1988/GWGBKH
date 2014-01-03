package org.just.xch.dao.sys;

import java.util.List;
import java.util.Map;

import org.just.xch.domain.sys.Item;
import org.just.xch.domain.sys.ItemPermission;
import org.just.xch.domain.sys.SysOrg;

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
