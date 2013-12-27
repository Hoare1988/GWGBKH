package com.winning.bi.domain.sys;

import java.util.Date;

public class SysSearchRecord
{
	private long id;
	private long user_id;// 登陆人员ID
	private long jgid;// 搜索录入的机构ID
	private long bzid;// 病种ID
	private long hzid;// 患者ID
	private long ypid;// 药品ID
	private String bz;// 备注
	private Date createDate;// 录入时间

	public long getId()
	{
		return id;
	}

	public void setId(long id)
	{
		this.id = id;
	}

	public long getUser_id()
	{
		return user_id;
	}

	public void setUser_id(long user_id)
	{
		this.user_id = user_id;
	}

	public long getJgid()
	{
		return jgid;
	}

	public void setJgid(long jgid)
	{
		this.jgid = jgid;
	}

	public long getBzid()
	{
		return bzid;
	}

	public void setBzid(long bzid)
	{
		this.bzid = bzid;
	}

	public long getHzid()
	{
		return hzid;
	}

	public void setHzid(long hzid)
	{
		this.hzid = hzid;
	}

	public long getYpid()
	{
		return ypid;
	}

	public void setYpid(long ypid)
	{
		this.ypid = ypid;
	}

	public String getBz()
	{
		return bz;
	}

	public void setBz(String bz)
	{
		this.bz = bz;
	}

	public Date getCreateDate()
	{
		return createDate;
	}

	public void setCreateDate(Date createDate)
	{
		this.createDate = createDate;
	}
}
