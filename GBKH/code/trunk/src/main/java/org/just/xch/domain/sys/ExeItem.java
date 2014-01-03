package org.just.xch.domain.sys;

import java.util.List;

import org.just.xch.domain.BaseDomain;

/***
 * @author XCH
 * 
 *         考核结果项目
 * 
 */
public class ExeItem extends BaseDomain {
	/**
	 * 年
	 */
	public static final int  EXEITEM_TYPE_YEAR=1;
	/**
	 * 季度
	 */
	public static final int  EXEITEM_TYPE_QUARTER=2;
	
	/**
	 * 关联的项目
	 */
	private Item item;
	/**
	 * 项目得分
	 */
	private double scoreResult;
	/***
	 * 被考核人   根节点才会有
	 */
	private SysUser beAccessedUser;
	/***
	 * 1 年度考核，2：季度考核           根节点才会有
	 */
	private Integer type;
	/**
	 * type=1   2013
	 * type=2   4 
	 *                     根节点才会有
	 * **/
	private String typeValue;
	
	/**
	 * 是否是根节点  1： 
	 */
	private Integer isRootExeItem;
	
	/**
	 * 根节点
	 */
	private ExeItem rootExeItem;
	/**
	 * 子级项目
	 */
	private List<ExeItem> childExeItems;
	
	private ExeItem parentExeItem;
	/**
	 * 1:创建        2：存档
	 */
	private Integer status;
	

	public Item getItem()
	{
		return item;
	}

	public void setItem(Item item)
	{
		this.item = item;
	}

	public double getScoreResult()
	{
		return scoreResult;
	}

	public void setScoreResult(double scoreResult)
	{
		this.scoreResult = scoreResult;
	}

	public SysUser getBeAccessedUser() {
		return beAccessedUser;
	}

	public void setBeAccessedUser(SysUser beAccessedUser) {
		this.beAccessedUser = beAccessedUser;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTypeValue() {
		return typeValue;
	}

	public void setTypeValue(String typeValue) {
		this.typeValue = typeValue;
	}

	public List<ExeItem> getChildExeItems() {
		return childExeItems;
	}

	public void setChildExeItems(List<ExeItem> childExeItems) {
		this.childExeItems = childExeItems;
	}

	public ExeItem getParentExeItem() {
		return parentExeItem;
	}

	public void setParentExeItem(ExeItem parentExeItem) {
		this.parentExeItem = parentExeItem;
	}

	public static ExeItem convertFromItem(Item item)
	{
		ExeItem exeItem=new ExeItem();
		exeItem.setItem(item);
		return exeItem;
	}

	public Integer getIsRootExeItem() {
		return isRootExeItem;
	}

	public void setIsRootExeItem(Integer isRootExeItem) {
		this.isRootExeItem = isRootExeItem;
	}

	public ExeItem getRootExeItem() {
		return rootExeItem;
	}

	public void setRootExeItem(ExeItem rootExeItem) {
		this.rootExeItem = rootExeItem;
	}

}
