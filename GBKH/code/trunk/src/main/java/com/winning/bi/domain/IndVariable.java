package com.winning.bi.domain;

import java.io.Serializable;
import java.util.Date;

public class IndVariable implements Serializable
{
	private String code;
	private String name;
	private String py;
	private String func;
	private Integer type;
	private Integer enable;
	private String description;
	private Date updateDate;

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getPy()
	{
		return py;
	}

	public void setPy(String py)
	{
		this.py = py;
	}

	public Integer getType()
	{
		return type;
	}

	public void setType(Integer type)
	{
		this.type = type;
	}

	public Integer getEnable()
	{
		return enable;
	}

	public void setEnable(Integer enable)
	{
		this.enable = enable;
	}

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public Date getUpdateDate()
	{
		return updateDate;
	}

	public void setUpdateDate(Date updateDate)
	{
		this.updateDate = updateDate;
	}

	public String getFunc()
	{
		return func;
	}

	public void setFunc(String func)
	{
		this.func = func;
	}

}
