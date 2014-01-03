package org.just.xch.domain.sys;

import java.util.Date;
import java.util.List;

import org.apache.xalan.xsltc.util.IntegerArray;

/**
 * 
 * @author XCH 考核项目
 */
public class Item
{
	private Integer id;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 是否有效
	 */
	private int enable;
	/**
	 * 拼音
	 */
	private String py;
	/**
	 * 分值
	 */
	private float score;
	
	/**
	 * 占父级分数百分比
	 */
	private float percentage;
	/**
	 * 评分标准
	 */
	private String evaluationStandard;
	/**
	 * 是否是顶级项目（考核名称）
	 */
	private Integer isRoot;
	/**
	 * 是否是叶子项目
	 */
	private Integer isBottom;

	/**
	 * 数据来源
	 */
	private String resource;
	/**
	 * 父级项目
	 */
	private Item parentItem;
	/**
	 * 子级项目
	 */
	private List<Item> childItems;
	/**
	 * 创建人
	 */
	private SysUser createBy;
	/**
	 * 更新人
	 */
	private SysUser updateBy;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	/**
	 * 同级目录下的序号 从1开始
	 */
	private Integer sortNum;
	/**
	 * 备注
	 */
	private String comments;

	/**
	 * 前台是否可编辑,
	 */
	private boolean editable=false;
	
	/**
	 * 来自正职分数
	 */
	private boolean isFromZZ;
	

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getEnable()
	{
		return enable;
	}

	public void setEnable(int enable)
	{
		this.enable = enable;
	}

	public float getScore()
	{
		return score;
	}

	public void setScore(float score)
	{
		this.score = score;
	}

	public String getEvaluationStandard()
	{
		return evaluationStandard;
	}

	public void setEvaluationStandard(String evaluationStandard)
	{
		this.evaluationStandard = evaluationStandard;
	}

	public Integer getIsRoot()
	{
		return isRoot;
	}

	public void setIsRoot(Integer isRoot)
	{
		this.isRoot = isRoot;
	}

	public String getResource()
	{
		return resource;
	}

	public void setResource(String resource)
	{
		this.resource = resource;
	}

	public Integer getIsBottom()
	{
		return isBottom;
	}

	public void setIsBottom(Integer isBottom)
	{
		this.isBottom = isBottom;
	}

	public Item getParentItem()
	{
		return parentItem;
	}

	public void setParentItem(Item parentItem)
	{
		this.parentItem = parentItem;
	}

	public List<Item> getChildItems()
	{
		return childItems;
	}

	public void setChildItems(List<Item> childItems)
	{
		this.childItems = childItems;
	}

	public SysUser getCreateBy()
	{
		return createBy;
	}

	public void setCreateBy(SysUser createBy)
	{
		this.createBy = createBy;
	}

	public SysUser getUpdateBy()
	{
		return updateBy;
	}

	public void setUpdateBy(SysUser updateBy)
	{
		this.updateBy = updateBy;
	}

	public Date getCreateDate()
	{
		return createDate;
	}

	public void setCreateDate(Date createDate)
	{
		this.createDate = createDate;
	}

	public Date getUpdateDate()
	{
		return updateDate;
	}

	public void setUpdateDate(Date updateDate)
	{
		this.updateDate = updateDate;
	}

	public String getPy()
	{
		return py;
	}

	public void setPy(String py)
	{
		this.py = py;
	}

	public Integer getSortNum() {
		return sortNum;
	}

	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}

	public float getPercentage() {
		return percentage;
	}

	public void setPercentage(float percentage) {
		this.percentage = percentage;
	}

	public boolean isFromZZ() 
	{
		return isFromZZ;
	}

	public void setFromZZ(boolean isFromZZ) {
		this.isFromZZ = isFromZZ;
	}
	
}
