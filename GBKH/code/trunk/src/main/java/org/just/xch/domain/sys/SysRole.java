package org.just.xch.domain.sys;

import java.io.Serializable;
import java.util.List;

public class SysRole implements Serializable
{
	public final static int ROLE_YLJG=3;
	private Integer id;
	private String name;
	private String description;
	private SysOrg sysOrg;
	private List<SysModule> modules;
	private Integer isSelected;
	private Integer isDefault;

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

	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public SysOrg getSysOrg()
	{
		return sysOrg;
	}

	public void setSysOrg(SysOrg sysOrg)
	{
		this.sysOrg = sysOrg;
	}

	public List<SysModule> getModules()
	{
		return modules;
	}

	public void setModules(List<SysModule> modules)
	{
		this.modules = modules;
	}

	public Integer getIsSelected()
	{
		return isSelected;
	}

	public void setIsSelected(Integer isSelected)
	{
		this.isSelected = isSelected;
	}

	public Integer getIsDefault()
	{
		return isDefault;
	}

	public void setIsDefault(Integer isDefault)
	{
		this.isDefault = isDefault;
	}

}
