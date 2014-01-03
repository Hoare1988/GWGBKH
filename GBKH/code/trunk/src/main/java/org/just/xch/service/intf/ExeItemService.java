package org.just.xch.service.intf;

import java.util.List;

import org.ietf.jgss.Oid;

import org.just.xch.domain.sys.ExeItem;
import org.just.xch.domain.sys.ExeItemVO;
import org.just.xch.domain.sys.Item;
import org.just.xch.domain.sys.SysUser;

public interface ExeItemService {
	
	public void saveOrUpdateExeItem(ExeItem exeItem);
	public void createAccessFormByRootItem(ExeItem root);
	public List<ExeItem>  findExeItemsByCondition(Item item,SysUser beAccessed,String typeValue,ExeItem rootExeItem,Integer isRoot);
	public List<ExeItem> findAllExeItemsByCondition(Item item, SysUser beAccessed,
			String typeValue, ExeItem rootExeItem,Integer isRoot,SysUser loginUser);
	public void updateExeItem(ExeItem exeItem);
	
	public void updateExeItemScoreResult(ExeItem exeItem);
	public void updateExeItemList(List<ExeItem> exeItemList);
	
	public void calculateExamsSumPoint(ExeItem[] rootExeItems);
	/**
	 * 获取ExeItem 的得分
	 * @param exeItem  
	 * @param isUpdateSoreResult  获取后是否更新ExeItem 的得分
	 * @return
	 */
	public double getExeItemSum(ExeItem exeItem,boolean isUpdateSoreResult);
	
	/**
	 * Excel 找到显示的所有元素
	 * @param rootExeItem  根节点
	 * @return Excel 显示的所有元素
	 */
	public List<ExeItemVO> getExamExcelItems(ExeItem  rootExeItem);
	
	
 }
