package org.just.xch.domain.sys;

public class SysUserOrgMapping {
	private SysUser user;
	private SysOrg org;
	/**
	 * 1:正职 2: 副职
	 */
	private Integer station;

	public SysUser getUser() {
		return user;
	}

	public void setUser(SysUser user) {
		this.user = user;
	}

	public SysOrg getOrg() {
		return org;
	}

	public void setOrg(SysOrg org) {
		this.org = org;
	}

	public Integer getStation() {
		return station;
	}

	public void setStation(Integer station) {
		this.station = station;
	}
}
