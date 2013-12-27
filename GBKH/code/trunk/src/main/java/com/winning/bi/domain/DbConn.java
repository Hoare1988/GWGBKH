package com.winning.bi.domain;

import java.io.Serializable;
import java.util.Date;

public class DbConn implements Serializable
{
	public static final int TYPE_MSSQL = 1;// mssql
	public static final int TYPE_ORCLE = 2;// oracle

	private String code;
	private String name;
	private String drivername;
	private String username;
	private String password;
	private String url;
	private int type;
	private int enable;
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

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public int getEnable()
	{
		return enable;
	}

	public void setEnable(int enable)
	{
		this.enable = enable;
	}

	public Date getUpdateDate()
	{
		return updateDate;
	}

	public void setUpdateDate(Date updateDate)
	{
		this.updateDate = updateDate;
	}

	public int getType()
	{
		return type;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	public String getDrivername()
	{
		return drivername;
	}

	public void setDrivername(String drivername)
	{
		this.drivername = drivername;
	}

}
