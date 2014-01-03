package org.just.xch.domain.sys;

import java.util.List;

public class SysDataGrid
{
	private long id;
	private long pid;
	private String name;
	private String bz;	
	private List<SysDataGridColumn> columnList;

	public long getId()
	{
		return id;
	}

	public void setId(long id)
	{
		this.id = id;
	}

	public long getPid()
	{
		return pid;
	}

	public void setPid(long pid)
	{
		this.pid = pid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getBz()
	{
		return bz;
	}

	public void setBz(String bz)
	{
		this.bz = bz;
	}

	public List<SysDataGridColumn> getColumnList()
	{
		return columnList;
	}

	public void setColumnList(List<SysDataGridColumn> columnList)
	{
		this.columnList = columnList;
	}
}
