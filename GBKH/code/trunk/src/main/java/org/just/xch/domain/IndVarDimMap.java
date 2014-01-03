package org.just.xch.domain;

import java.io.Serializable;
import java.util.Date;

public class IndVarDimMap implements Serializable
{
	private Integer id;
	private IndVariable indVariable;
	private Dimension dimension1;
	private Dimension dimension2;
	private DbConn dbConn;
	private Integer status;
	private String frequency;
	private String sqlStr;
	private String description;
	private Date updateDate;
	private Date lastSyncDate;

	public IndVariable getIndVariable()
	{
		return indVariable;
	}

	public void setIndVariable(IndVariable indVariable)
	{
		this.indVariable = indVariable;
	}

	public Dimension getDimension1()
	{
		return dimension1;
	}

	public void setDimension1(Dimension dimension1)
	{
		this.dimension1 = dimension1;
	}

	public Dimension getDimension2()
	{
		return dimension2;
	}

	public void setDimension2(Dimension dimension2)
	{
		this.dimension2 = dimension2;
	}

	public DbConn getDbConn()
	{
		return dbConn;
	}

	public void setDbConn(DbConn dbConn)
	{
		this.dbConn = dbConn;
	}

	public Integer getStatus()
	{
		return status;
	}

	public void setStatus(Integer status)
	{
		this.status = status;
	}

	public String getSqlStr()
	{
		return sqlStr;
	}

	public void setSqlStr(String sqlStr)
	{
		this.sqlStr = sqlStr;
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

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getFrequency()
	{
		return frequency;
	}

	public void setFrequency(String frequency)
	{
		this.frequency = frequency;
	}

	public Date getLastSyncDate()
	{
		return lastSyncDate;
	}

	public void setLastSyncDate(Date lastSyncDate)
	{
		this.lastSyncDate = lastSyncDate;
	}

}
