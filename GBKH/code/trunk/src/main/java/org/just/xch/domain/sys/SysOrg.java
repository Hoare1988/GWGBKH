package org.just.xch.domain.sys;

import java.io.Serializable;
import java.util.Date;

public class SysOrg implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1440242603075691082L;
	private Integer id;
	private String name;
	private String py;
	private String code;
	private String comments;
	private Date createDate;
	private Date updateDate;
	/**
	 * 1 YES  2 NO
	 */
	private  int enable;
	/**
	 * 1 YEsS 2:NO
	 */
	private int isSelected;
	
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

	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}

	public String getComments()
	{
		return comments;
	}

	public void setComments(String comments)
	{
		this.comments = comments;
	}

	public Date getCreateDate()
	{
		return createDate;
	}

	public void setCreateDate(Date createDate)
	{
		this.createDate = createDate;
	}

	public Date getUpdateDate()
	{
		return updateDate;
	}

	public void setUpdateDate(Date updateDate)
	{
		this.updateDate = updateDate;
	}

	public int getEnable()
	{
		return enable;
	}

	public void setEnable(int enable)
	{
		this.enable = enable;
	}

	public String getPy() {
		return py;
	}

	public void setPy(String py) {
		this.py = py;
	}

	public int getIsSelected() {
		return isSelected;
	}

	public void setIsSelected(int isSelected) {
		this.isSelected = isSelected;
	}
	
}
