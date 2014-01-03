package org.just.xch.domain.sys;
/**
 * Excel 显示表单元素
 * 
 * @author XCH
 *
 */
public class ExeItemVO
{
	//评分标准默认宽度是15
	public static final int  EVALUATION_STANDARD_DEFAULT_WIDTH=20; 
	
	/**
	 * 考核项目及权重
	 */
	private String itemAndWeight;
	/**
	 * 一级指标
	 */
	private String firstIndex;
	/**
	 * 二级指标
	 */
	private String secondIndex;
	/**
	 * 评分标准
	 */
	private String evaluationStandard;
	/**
	 * 分值
	 */
	private String socre;
	/**
	 * 得分
	 */
	private String point;
	/**
	 * 数据来源
	 */
	private String resource;

	public String getItemAndWeight()
	{
		return itemAndWeight;
	}

	public void setItemAndWeight(String itemAndWeight)
	{
		this.itemAndWeight = itemAndWeight;
	}

	public String getFirstIndex()
	{
		return firstIndex;
	}

	public void setFirstIndex(String firstIndex)
	{
		this.firstIndex = firstIndex;
	}

	public String getSecondIndex()
	{
		return secondIndex;
	}

	public void setSecondIndex(String secondIndex)
	{
		this.secondIndex = secondIndex;
	}

	public String getEvaluationStandard()
	{
		return evaluationStandard;
	}

	public void setEvaluationStandard(String evaluationStandard)
	{
		this.evaluationStandard = evaluationStandard;
	}

	public String getSocre()
	{
		return socre;
	}

	public void setSocre(String socre)
	{
		this.socre = socre;
	}

	public String getPoint()
	{
		return point;
	}

	public void setPoint(String point)
	{
		this.point = point;
	}

	public String getResource()
	{
		return resource;
	}

	public void setResource(String resource)
	{
		this.resource = resource;
	}

}
