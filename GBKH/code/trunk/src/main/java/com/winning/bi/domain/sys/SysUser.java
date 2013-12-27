package com.winning.bi.domain.sys;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.winning.bi.domain.BaseDomain;

public class SysUser extends BaseDomain implements Serializable
{
	
	private String userName;//用户名(工号)
	private String password;//用户姓名
	private String realName;//密码
	private String py;//拼音码
	private String wb;//五笔码
	private Integer type;//类型
	private Date lastLoginTime;//最近登录时间
	private Integer loginCount;//登录系统次数
	
	private String gender;//性别
	private String deptcode;//部门编码
	private String deptname;//部门名称
	private String cellphone;//移动电话
	private String telphone;//固定电话
	private String email;//邮件地址
	private Long superiors;//上级主管
	private String postname;//职位名称
	private Date entrydate;//入职日期
	private int canaudit;//拥有审核权限
	private int privilege;//访问特权

	private List<SysRole> roles = new ArrayList<SysRole>();//角色
	private List<SysOrg> orgs = new ArrayList<SysOrg>();//科室

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getRealName()
	{
		return realName;
	}

	public void setRealName(String realName)
	{
		this.realName = realName;
	}

	public String getPy()
	{
		return py;
	}

	public void setPy(String py)
	{
		this.py = py;
	}

	public String getWb()
	{
		return wb;
	}

	public void setWb(String wb)
	{
		this.wb = wb;
	}

	public Integer getType()
	{
		return type;
	}

	public void setType(Integer type)
	{
		this.type = type;
	}

	public Date getLastLoginTime()
	{
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime)
	{
		this.lastLoginTime = lastLoginTime;
	}

	public Integer getLoginCount()
	{
		return loginCount;
	}

	public void setLoginCount(Integer loginCount)
	{
		this.loginCount = loginCount;
	}

	public List<SysRole> getRoles()
	{
		return roles;
	}

	public void setRoles(List<SysRole> roles)
	{
		this.roles = roles;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public String getDeptcode()
	{
		return deptcode;
	}

	public void setDeptcode(String deptcode)
	{
		this.deptcode = deptcode;
	}

	public String getDeptname()
	{
		return deptname;
	}

	public void setDeptname(String deptname)
	{
		this.deptname = deptname;
	}

	public String getCellphone()
	{
		return cellphone;
	}

	public void setCellphone(String cellphone)
	{
		this.cellphone = cellphone;
	}

	public String getTelphone()
	{
		return telphone;
	}

	public void setTelphone(String telphone)
	{
		this.telphone = telphone;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public Long getSuperiors()
	{
		return superiors;
	}

	public void setSuperiors(Long superiors)
	{
		this.superiors = superiors;
	}

	public String getPostname()
	{
		return postname;
	}

	public void setPostname(String postname)
	{
		this.postname = postname;
	}

	public Date getEntrydate()
	{
		return entrydate;
	}

	public void setEntrydate(Date entrydate)
	{
		this.entrydate = entrydate;
	}

	public int getCanaudit()
	{
		return canaudit;
	}

	public void setCanaudit(int canaudit)
	{
		this.canaudit = canaudit;
	}

	public int getPrivilege()
	{
		return privilege;
	}

	public void setPrivilege(int privilege)
	{
		this.privilege = privilege;
	}

	public List<SysOrg> getOrgs() {
		return orgs;
	}

	public void setOrgs(List<SysOrg> orgs) {
		this.orgs = orgs;
	}
}
