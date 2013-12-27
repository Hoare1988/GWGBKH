package com.winning.bi.domain;

import java.io.Serializable;
import java.util.Date;

public class DataLog implements Serializable
{
	private Integer id;
	private String orgCode;
	private String varCode;
	private String dimCode1;
	private String dimCode2;
	private String dbCode;
	private String frequency;
	private Integer flag;
	private Integer actNum;
	private Integer tmpNum;
	private Integer seconds;
	private String msg;
	private Date startDate;
	private Date endDate;
	private Date createDate;

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getOrgCode()
	{
		return orgCode;
	}

	public void setOrgCode(String orgCode)
	{
		this.orgCode = orgCode;
	}

	public String getVarCode()
	{
		return varCode;
	}

	public void setVarCode(String varCode)
	{
		this.varCode = varCode;
	}

	public String getDimCode1()
	{
		return dimCode1;
	}

	public void setDimCode1(String dimCode1)
	{
		this.dimCode1 = dimCode1;
	}

	public String getDimCode2()
	{
		return dimCode2;
	}

	public void setDimCode2(String dimCode2)
	{
		this.dimCode2 = dimCode2;
	}

	public String getDbCode()
	{
		return dbCode;
	}

	public void setDbCode(String dbCode)
	{
		this.dbCode = dbCode;
	}

	public String getFrequency()
	{
		return frequency;
	}

	public void setFrequency(String frequency)
	{
		this.frequency = frequency;
	}

	public Integer getFlag()
	{
		return flag;
	}

	public void setFlag(Integer flag)
	{
		this.flag = flag;
	}

	public Integer getSeconds()
	{
		return seconds;
	}

	public void setSeconds(Integer seconds)
	{
		this.seconds = seconds;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public Date getStartDate()
	{
		return startDate;
	}

	public void setStartDate(Date startDate)
	{
		this.startDate = startDate;
	}

	public Date getEndDate()
	{
		return endDate;
	}

	public void setEndDate(Date endDate)
	{
		this.endDate = endDate;
	}

	public Date getCreateDate()
	{
		return createDate;
	}

	public void setCreateDate(Date createDate)
	{
		this.createDate = createDate;
	}

	public Integer getActNum()
	{
		return actNum;
	}

	public void setActNum(Integer actNum)
	{
		this.actNum = actNum;
	}

	public Integer getTmpNum()
	{
		return tmpNum;
	}

	public void setTmpNum(Integer tmpNum)
	{
		this.tmpNum = tmpNum;
	}

}
