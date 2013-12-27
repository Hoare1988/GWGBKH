package com.winning.bi.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.winning.bi.dao.sys.ExeItemDao;
import com.winning.bi.dao.sys.ItemDao;
import com.winning.bi.domain.sys.ExeItemVO;
import com.winning.bi.domain.sys.Item;
import com.winning.bi.domain.sys.ExeItem;
import com.winning.bi.domain.sys.SysOrg;
import com.winning.bi.domain.sys.SysUser;

import com.winning.bi.service.intf.ExeItemService;
import com.winning.bi.service.intf.ItemService;
import com.winning.utils.Constant;
import com.winning.utils.NewwinningUtil;

public class ExeItemServiceImpl implements ExeItemService
{

	@Override
	public void saveOrUpdateExeItem(ExeItem exeItem)
	{
		if (exeItem != null)
		{
			if (exeItem.getId() != null)
			{
				exeItemDao.updateExeItem(exeItem);
			}
			else
			{
				exeItemDao.insertExeItem(exeItem);
			}
		}

	}

	// public ExeItem insertExeItem(ExeItem exeItem) {
	// if(exeItem!=null)
	// {
	// exeItemDao.insertExeItem(exeItem);
	// }
	// List<E> this.findExeItemsByCondition(exeItem.getItem(),
	// exeItem.getBeAccessedUser(), exeItem.getTypeValue());
	// }

	@Override
	public void createAccessFormByRootItem(ExeItem root)
	{
		try
		{
			if (root.getId() == null || root.getId() <= 0)
			{
				exeItemDao.insertExeItem(root);
				root.setId((long) exeItemDao.getMaxExeItemID());
			}
			root.setRootExeItem(root);
			addExeItemsByParent(root);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private void addExeItemsByParent(ExeItem parentExeItem)
	{
		List<Item> itemList = itemServiceImpl.findChildrens(parentExeItem
				.getItem());

		if (itemList != null && itemList.size() > 0)
		{
			for (Item item : itemList)
			{
				ExeItem exeItem = new ExeItem();
				exeItem.setRootExeItem(parentExeItem.getRootExeItem());
				exeItem.setItem(item);
				exeItem.setIsRootExeItem(0);
				exeItem.setParentExeItem(parentExeItem);
				exeItem.setEnable(Constant.TRUE);
				exeItem.setCreateBy(parentExeItem.getCreateBy());
				exeItem.setUpdateBy(parentExeItem.getUpdateBy());
				exeItemDao.insertExeItem(exeItem);
				exeItem.setId((long) exeItemDao.getMaxExeItemID());
				addExeItemsByParent(exeItem);
			}
		}
	}

	@Override
	public List<ExeItem> findExeItemsByCondition(Item item, SysUser beAccessed,
			String typeValue, ExeItem rootExeItem, Integer isRoot)
	{
		Map<String, Object> condition = new HashMap<String, Object>();
		try
		{
			if (item != null)
				condition.put("item", item);
			if (beAccessed != null)
				condition.put("beAccessedUser", beAccessed);
			if (typeValue != null && !"".equals(typeValue.trim()))
			{
				condition.put("typeValue", typeValue);
			}
			condition.put("enable", 1);
			if (rootExeItem != null)
				condition.put("rootExeItem", rootExeItem);
			if (isRoot != null)
				condition.put("isRootExeItem", isRoot);
			List<ExeItem> list = exeItemDao.findExeItemByCondition(condition);
			return list;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	public List<ExeItem> findRootExeItems(ExeItem exeItem)
	{
		Map<String, Object> conditions = new HashMap<String, Object>();
		conditions.put("isRootExeItem", Constant.TRUE);
		if (exeItem != null)
		{
			if (exeItem.getId() != null && exeItem.getId() > 0)
			{
				conditions.put("id", exeItem.getId());
			}

			if (exeItem.getType() != null)
			{
				conditions.put("type", exeItem.getType());
			}

			if (NewwinningUtil.isNotNull(exeItem.getTypeValue()))
			{
				conditions.put("typeValue", exeItem.getTypeValue());
			}

			if (exeItem.getEnable() != null)
			{
				conditions.put("enable", exeItem.getEnable());
			}

			if (exeItem.getBeAccessedUser() != null)
			{
				conditions.put("beAccessedUser", exeItem.getBeAccessedUser());
			}

			if (exeItem.getItem() != null)
			{
				conditions.put("item", exeItem.getItem());
			}
		}

		return exeItemDao.findExeItemByCondition(conditions);
	}

	@Override
	public List<ExeItem> findAllExeItemsByCondition(Item item,
			SysUser beAccessed, String typeValue, ExeItem rootExeItem,
			Integer isRoot, SysUser loginUser)
	{
		List<ExeItem> resultExeItems = null;
		List<SysOrg> orgList = loginUser.getOrgs();
		List<Item> permitItems = new ArrayList<Item>();
		if (orgList != null && orgList.size() > 0)
		{
			for (SysOrg org : orgList)
			{
				permitItems.addAll(itemDao.findItemFromPermitByOrg(org));
			}
		}
		resultExeItems = this.findExeItemsByCondition(item, beAccessed,
				typeValue, rootExeItem, isRoot);
		List<ExeItem> childExeItems = new ArrayList<ExeItem>();
		for (ExeItem exeItem : resultExeItems)
		{
			Map<String, Object> parasMap = new HashMap<String, Object>();
			parasMap.put("rootExeItem", exeItem);
			parasMap.put("enable", 1);
			List<ExeItem> childs = exeItemDao.findExeItemByCondition(parasMap);
			childExeItems.addAll(childs);
		}

		resultExeItems.addAll(childExeItems);
		if (permitItems != null && permitItems.size() > 0)
		{
			for (ExeItem exeItem : resultExeItems)
			{
				for (Item tempItem : permitItems)
				{
					if (exeItem.getItem().getIsBottom().intValue() == Constant.TRUE)
					{

						if (exeItem != null
								&& exeItem.getItem().getId()
										.equals(tempItem.getId()))
						{
							exeItem.getItem().setEditable(true);
							break;
						}
						if (exeItem != null
								&& exeItem.getParentExeItem() != null
								&& exeItem.getParentExeItem().getItem().getId()
										.equals(tempItem.getId()))
						{
							exeItem.getItem().setEditable(true);
							break;
						}
					}
				}
			}
		}
		return resultExeItems;
	}

	@Override
	public void updateExeItem(ExeItem exeItem)
	{
		exeItemDao.updateExeItem(exeItem);
	}

	@Override
	public void updateExeItemList(List<ExeItem> exeItemList)
	{
		for (ExeItem exeItem : exeItemList)
		{
			updateExeItem(exeItem);
		}
		return;
	}

	@Override
	public void updateExeItemScoreResult(ExeItem exeItem)
	{
		// TODO Auto-generated method stub

	}

	@Override
	public void calculateExamsSumPoint(ExeItem[] rootExeItems)
	{
		if (rootExeItems != null)
		{
			for (ExeItem exeItem : rootExeItems)
			{
				if (exeItem != null)
				{
					getExeItemSum(exeItem, true);
				}
			}
		}
	}

	@Override
	public double getExeItemSum(ExeItem exeItem, boolean isUpdateSoreResult)
	{
		double sum = 0.0D;
		if (exeItem.getId().intValue() == 129)
		{
			System.out.println(exeItem.getItem().getName());
		}
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("parentExeItem", exeItem);
		List<ExeItem> childList = exeItemDao
				.findExeItemByCondition(conditionMap);

		if (childList != null && childList.size() > 0)
		{
			boolean isSecondItemDesc = false;
			for (ExeItem exeItemT : childList)
			{
				if (exeItemT.getItem().getIsBottom() == Constant.FALSE)
				{
					exeItemT.setScoreResult(getExeItemSum(exeItemT,
							isUpdateSoreResult));
				}
				if (exeItemT.getItem().getPercentage() > 0)
				{
					sum += exeItemT.getScoreResult()
							* exeItemT.getItem().getPercentage()
							/ exeItemT.getItem().getScore();
				}
				else
				{
					isSecondItemDesc = true;
					sum += exeItemT.getScoreResult();
				}
			}
			if (!isSecondItemDesc)
			{
				sum *= exeItem.getItem().getScore() / 100;
			}
		}
		else
		{
			sum = exeItem.getScoreResult();
		}

		if (isUpdateSoreResult)
		{
			exeItem.setScoreResult(sum);
			exeItemDao.updateExeItem(exeItem);
		}

		return sum;
	}

	@Override
	public List<ExeItemVO> getExamExcelItems(ExeItem rootExeItem)
	{
		List<ExeItemVO> exeItemVOList = null;
		List<ExeItem> exeItemList = this.findExeItemsByCondition(null, null,
				null, rootExeItem, 0);
		if (exeItemList != null && exeItemList.size() > 0)
		{
			exeItemVOList = new ArrayList<ExeItemVO>();
			/******************* 获取需要显示的页面元素 ********************/
			for (ExeItem exeItem : exeItemList)
			{
				if (exeItem.getItem() != null
						&& exeItem.getItem().getIsBottom().intValue() == 1)
				{
					ExeItemVO exeItemVO = new ExeItemVO();
					exeItemVO.setResource(exeItem.getItem().getResource());
					exeItemVO.setSocre(String.format("%.0f", exeItem.getItem()
							.getScore()));
					exeItemVO.setPoint(String.format("%.2f",
							exeItem.getScoreResult()));
					exeItemVO.setEvaluationStandard(exeItem.getItem()
							.getEvaluationStandard());
					ExeItem parentExeItem = exeItem.getParentExeItem();
					exeItemVO.setSecondIndex(exeItem.getItem().getName());
					if (parentExeItem != null
							&& parentExeItem.getParentExeItem() != null
							&& !parentExeItem.getParentExeItem().getId()
									.equals(rootExeItem.getId()))
					{
						exeItemVO.setFirstIndex(parentExeItem.getItem()
								.getName());
						exeItemVO.setItemAndWeight(parentExeItem
								.getParentExeItem().getItem().getName());
					}
					else
					{
						/****************/
						exeItemVO.setFirstIndex(exeItem.getItem().getName());
						exeItemVO.setItemAndWeight(parentExeItem.getItem()
								.getName());
					}
					exeItemVOList.add(exeItemVO);
				}
			}
		}

		return exeItemVOList;
	}

	@Resource
	private ExeItemDao exeItemDao;

	@Resource
	private ItemDao itemDao;
	@Resource
	private ItemService itemServiceImpl;
}
