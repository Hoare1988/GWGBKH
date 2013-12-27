package com.winning.bi.domain.sys;

import java.io.Serializable;
import java.util.List;

public class SysModule implements Serializable, Cloneable
{
	private Integer id;
	private String name;
	private String code;
	private String path;
	private Integer ordinal;
	private Integer isMenu;
	private Integer isNav;
	private Integer isLeaf;
	private Integer stage;
	private String groupName;
	private Integer type;
	private Integer enable;
	private String comments;
	private SysModule parent;
	private List<SysModule> children;
	private Integer isSelected;

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public SysModule getParent()
	{
		return parent;
	}

	public void setParent(SysModule parent)
	{
		this.parent = parent;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}

	public Integer getOrdinal()
	{
		return ordinal;
	}

	public void setOrdinal(Integer ordinal)
	{
		this.ordinal = ordinal;
	}

	public Integer getIsMenu()
	{
		return isMenu;
	}

	public void setIsMenu(Integer isMenu)
	{
		this.isMenu = isMenu;
	}

	public Integer getIsNav()
	{
		return isNav;
	}

	public void setIsNav(Integer isNav)
	{
		this.isNav = isNav;
	}

	public Integer getIsLeaf()
	{
		return isLeaf;
	}

	public void setIsLeaf(Integer isLeaf)
	{
		this.isLeaf = isLeaf;
	}

	public Integer getStage()
	{
		return stage;
	}

	public void setStage(Integer stage)
	{
		this.stage = stage;
	}

	public String getGroupName()
	{
		return groupName;
	}

	public void setGroupName(String groupName)
	{
		this.groupName = groupName;
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

	public String getComments()
	{
		return comments;
	}

	public void setComments(String comments)
	{
		this.comments = comments;
	}

	public List<SysModule> getChildren()
	{
		return children;
	}

	public void setChildren(List<SysModule> children)
	{
		if (children != null && children.size() > 0)
		{
			this.children = children;
		}
		else
		{
			this.children = null;
		}

	}

	public Integer getIsSelected()
	{
		return isSelected;
	}

	public void setIsSelected(Integer isSelected)
	{
		this.isSelected = isSelected;
	}

	@Override
	public Object clone() throws CloneNotSupportedException
	{
		return super.clone();
	}

}
