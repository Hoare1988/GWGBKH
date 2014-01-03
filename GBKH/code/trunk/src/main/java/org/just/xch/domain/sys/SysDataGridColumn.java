package org.just.xch.domain.sys;

public class SysDataGridColumn
{
	private long id;
	private long pid;
	private String label;
	private String textField;
	private int visable;
	private int isDownField;
	private int includeLayout;
	private String bz;
	private int sortIndex;

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

	public String getLabel()
	{
		return label;
	}

	public void setLabel(String label)
	{
		this.label = label;
	}

	public String getTextField()
	{
		return textField;
	}

	public void setTextField(String textField)
	{
		this.textField = textField;
	}

	public int getVisable()
	{
		return visable;
	}

	public void setVisable(int visable)
	{
		this.visable = visable;
	}

	public int getIsDownField()
	{
		return isDownField;
	}

	public void setIsDownField(int isDownField)
	{
		this.isDownField = isDownField;
	}

	public int getIncludeLayout()
	{
		return includeLayout;
	}

	public void setIncludeLayout(int includeLayout)
	{
		this.includeLayout = includeLayout;
	}

	public String getBz()
	{
		return bz;
	}

	public void setBz(String bz)
	{
		this.bz = bz;
	}

	public int getSortIndex()
	{
		return sortIndex;
	}

	public void setSortIndex(int sortIndex)
	{
		this.sortIndex = sortIndex;
	}

}
