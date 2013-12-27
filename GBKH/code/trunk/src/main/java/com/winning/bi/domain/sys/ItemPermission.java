package com.winning.bi.domain.sys;

import java.util.Date;

public class ItemPermission {
	private Integer id;
	private Item item;
	private SysOrg sysOrg;
	private SysUser user;
	private Date createDate;
	private Date updateDate;
	private SysUser createBy;
	private SysUser updateBy;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public SysUser getUser() {
		return user;
	}

	public void setUser(SysUser user) {
		this.user = user;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public SysUser getCreateBy() {
		return createBy;
	}

	public void setCreateBy(SysUser createBy) {
		this.createBy = createBy;
	}

	public SysUser getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(SysUser updateBy) {
		this.updateBy = updateBy;
	}

	public SysOrg getSysOrg() {
		return sysOrg;
	}

	public void setSysOrg(SysOrg sysOrg) {
		this.sysOrg = sysOrg;
	}
	
}
