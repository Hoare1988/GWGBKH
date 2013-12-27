package com.winning.bi.service.intf;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.winning.bi.domain.sys.Item;
import com.winning.bi.domain.sys.ItemPermission;
import com.winning.bi.domain.sys.SysUser;

public interface ItemService
{
	public List<Item> queryItemsByCondition(SysUser loginUser,String name,String py,Integer isRoot,Integer isBottom,Item parentItem,int enable);
	public List<Item> findChildrens(Item item);
	public Item insertItem(Item item);
	public Item insertRootItem(Item rootitem);
	public Item updateItem(Item item);
	public Item deleteItem(Item item);
	public void deleteItems(List<Item> itemList);
	public List<Item> findRootItems(int isRoot);
	
	public void intsertItemPermission(List<ItemPermission> itemPermissions);
	public List<ItemPermission> findItemPermissionsByItem(Item item);
	void deleteItemPermits(List<ItemPermission> itemPermissions); 
	
}
