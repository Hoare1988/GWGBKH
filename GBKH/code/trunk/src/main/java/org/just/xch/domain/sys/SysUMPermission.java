package org.just.xch.domain.sys;

import java.io.Serializable;
import java.util.Date;

public class SysUMPermission implements Serializable
{
	private long id;
	private long userid;//用户ID
	private String mcode;//模块编码
	private int status;//状态 0-不可用 1-可用
	private int runtime;//有效时长
	private Date kssj;//开始时间
	private Date jssj;//过期时间
	
	public static final int STATUS0 = 0;//不可用
	public static final int STATUS1 = 1;//可用
	
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public long getUserid()
	{
		return userid;
	}
	public void setUserid(long userid)
	{
		this.userid = userid;
	}
	
	public String getMcode()
	{
		return mcode;
	}
	public void setMcode(String mcode)
	{
		this.mcode = mcode;
	}
	public int getStatus()
	{
		return status;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	public int getRuntime()
	{
		return runtime;
	}
	public void setRuntime(int runtime)
	{
		this.runtime = runtime;
	}
	public Date getKssj()
	{
		return kssj;
	}
	public void setKssj(Date kssj)
	{
		this.kssj = kssj;
	}
	public Date getJssj()
	{
		return jssj;
	}
	public void setJssj(Date jssj)
	{
		this.jssj = jssj;
	}

}
