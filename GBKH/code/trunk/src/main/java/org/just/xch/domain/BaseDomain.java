package org.just.xch.domain;

import java.io.Serializable;
import java.util.Date;

import org.just.xch.domain.sys.SysUser;

public class BaseDomain implements Serializable
{
	protected Long id;
	protected Date createDate;
	protected Date updateDate;
	protected String comments;
	protected SysUser createBy;
	protected SysUser updateBy;
	protected Integer enable;

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
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

	public String getComments()
	{
		return comments;
	}

	public void setComments(String comments)
	{
		this.comments = comments;
	}

	public SysUser getCreateBy()
	{
		return createBy;
	}

	public void setCreateBy(SysUser createBy)
	{
		this.createBy = createBy;
	}

	public SysUser getUpdateBy()
	{
		return updateBy;
	}

	public void setUpdateBy(SysUser updateBy)
	{
		this.updateBy = updateBy;
	}

	public Integer getEnable()
	{
		return enable;
	}

	public void setEnable(Integer enable)
	{
		this.enable = enable;
	}

}
