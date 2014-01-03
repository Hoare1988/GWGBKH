package org.just.xch.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.just.utils.Constant;
import org.just.utils.DpUtil;
import org.just.utils.NewwinningUtil;
import org.just.utils.Pinyin4jUtil;
import org.just.xch.dao.sys.ItemDao;
import org.just.xch.domain.sys.Item;
import org.just.xch.domain.sys.ItemPermission;
import org.just.xch.domain.sys.SysOrg;
import org.just.xch.domain.sys.SysUser;
import org.just.xch.service.intf.ItemService;

public class ItemServiceImpl implements ItemService {

	@Override
	public List<Item> queryItemsByCondition(SysUser loginUser,String name, String py,
			Integer isRoot, Integer isBottom, Item parentItem, int enable) {
		Map<String, Object> condition = DpUtil.getConMap();
		if (NewwinningUtil.isNotNull(name)) {
			condition.put("name", name);
		}
		if (!NewwinningUtil.isNotNull(py)) {
			condition.put("py", py);
		}
		if (isRoot != null) {
			condition.put("isRoot", isRoot);
		}
		if (isBottom != null) {
			condition.put("isBottom", isBottom);
		}
		if (parentItem != null && parentItem.getId() != null) {
			condition.put("ParentID", parentItem.getId());
		}
		condition.put("enable", enable);

		List<Item> itemList = itemDao.findItemByCondition(condition);
		for (Item item : itemList) {
			if(item.getIsBottom()!=Constant.TRUE){
			  item.setChildItems(findChildrens(item));
			}
		}
		/**
		 * 添加项目权限  
		 */
		List<SysOrg> orgList = loginUser.getOrgs();
		if (orgList != null && orgList.size() > 0) 
		{
			Map<String, Object> conditsMap=new HashMap<String, Object>();
			
			for(Item item :itemList)
			{
				for(SysOrg sysOrg :orgList)
				{
					conditsMap.clear();
					conditsMap.put("item", item);
					conditsMap.put("sysOrg", sysOrg);
					List<ItemPermission> results=itemDao.findItemPermissionsByCondition(conditsMap);
				  if(results!=null&&results.size()>0)
				  {
					  item.setEditable(true);
					  break;
				  }
				}
			}
		}
		/********************************************/
		return itemList;
	}

	@Override
	public List<Item> findChildrens(Item parentItem) {
		List<Item> childrens = itemDao.findItemsByParentItem(parentItem);
		if (childrens != null&&childrens.size()>0) {
			for (Item item : childrens) {
				item.setChildItems(findChildrens(item));
			}
		}
		return childrens;
	}
	
	@Override
	public List<Item> findRootItems(int isRoot)
	{
		Map<String, Object> condition = DpUtil.getConMap();
		condition.put("isRoot", isRoot);
		condition.put("enable", 1);
		List<Item> itemList = itemDao.findItemByCondition(condition);
		return itemList;
	}
	

	@Override
	public Item insertRootItem(Item rootitem) {
		rootitem.setPy(Pinyin4jUtil.getPinYinHeadChar(rootitem.getName()));
		itemDao.insertRootItem(rootitem);
		return null;
	}

	@Override
	public Item insertItem(Item item) {
		if (item != null) {
			item.setPy(Pinyin4jUtil.getPinYinHeadChar(item.getName()));
			itemDao.insertItem(item);
			// 更新父项目 isBottom
			Item parItem = item.getParentItem();
			if (parItem != null && parItem.getIsBottom().equals(Constant.TRUE)) {
				parItem.setIsBottom(Constant.FALSE);
				parItem.setName(null);
				parItem.setComments(null);
				parItem.setCreateBy(null);
				parItem.setChildItems(null);
				parItem.setResource(null);
				parItem.setEvaluationStandard(null);
				parItem.setIsRoot(null);
				parItem.setParentItem(null);
				parItem.setSortNum(null);
				itemDao.updateItem(item.getParentItem());
			}
		}
		return null;
	}

	@Override
	public Item updateItem(Item item) {
		itemDao.updateItem(item);
		return null;
	}

	@Override
	public Item deleteItem(Item item) {
		item.setEnable(0);
		itemDao.updateItem(item);
		return null;
	}

	@Override
	public void deleteItems(List<Item> itemList) {
		if(itemList!=null)
		{
			for(Item item:itemList)
			{
				item.setEnable(0);
				itemDao.updateItem(item);
			}
		}
		return;
	}

	@Override
	public void intsertItemPermission(List<ItemPermission> itemPermissions)
	{
		if(itemPermissions!=null)
		{
			for(ItemPermission itemPermit:itemPermissions)
			{
				itemDao.insertItemPermission(itemPermit);
			}
		}
		return;
	}

	@Override
	public List<ItemPermission> findItemPermissionsByItem(Item item) {
		Map<String, Object> conditions=new HashMap<String, Object>();
		conditions.put("item", item);
		return itemDao.findItemPermissionsByCondition(conditions);
	}

	@Override
	public void deleteItemPermits(List<ItemPermission> itemPermissions)
	{
		if(itemPermissions!=null)
		{
			for(ItemPermission itemPermit:itemPermissions)
			{
				itemDao.deleteItemPermit(itemPermit);
			}
		}
	}


	@Resource
	protected ItemDao itemDao;

}
