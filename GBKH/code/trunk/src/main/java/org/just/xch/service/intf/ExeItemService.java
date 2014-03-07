package org.just.xch.service.intf;

import java.util.List;

import org.ietf.jgss.Oid;

import org.just.xch.domain.sys.ExeItem;
import org.just.xch.domain.sys.ExeItemVO;
import org.just.xch.domain.sys.Item;
import org.just.xch.domain.sys.SysUser;

public interface ExeItemService {
	
	public void saveOrUpdateExeItem(ExeItem exeItem);
	/**
	 * 如果已经存在则返回root ,如果不存在则新建的返回null
	 * @param root
	 * @return
	 */
	public ExeItem createAccessFormByRootItem(ExeItem root);
	/**
	 * 查询ExeItem
	 * @param item exeItem 中对应的item 
	 * @param beAccessed   被考核人
	 * @param typeValue
	 * @param rootExeItem  根ExeItem
	 * @param isRoot  		是否是根节点
	 * @return
	 */
	public List<ExeItem>  findExeItemsByCondition(Item item,SysUser beAccessed,String typeValue,ExeItem rootExeItem,Integer isRoot);
	public List<ExeItem> findAllExeItemsByCondition(Item item, SysUser beAccessed,
			String typeValue, ExeItem rootExeItem,Integer isRoot,SysUser loginUser);
	
	public List<ExeItem> findExeItemByProperty(String protertyName,Object value);
	
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
