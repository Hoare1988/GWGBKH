package com.winning.bi.domain.sys;

import com.winning.bi.domain.BaseDomain;
/**
 * 数据修改记录
 * @author XCH
 *
 */
public class DataLog extends BaseDomain
{
	public static final Integer TYPE_ITEM=1;
	public static final Integer TYPE_EXE_ITEM=2;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 1
	 */
	private Integer type;
	/**
	 * type=2  exeItem 的scoreResult
	 */
	private String value;
	/**
	 *  由Type 1：itemID 2：exeItem.ID
	 */
	private String serviceID;

	public Integer getType()
	{
		return type;
	}

	public void setType(Integer type)
	{
		this.type = type;
	}

	public String getValue()
	{
		return value;
	}

	public void setValue(String value)
	{
		this.value = value;
	}

	public String getServiceID()
	{
		return serviceID;
	}

	public void setServiceID(String serviceID)
	{
		this.serviceID = serviceID;
	}
	
}
