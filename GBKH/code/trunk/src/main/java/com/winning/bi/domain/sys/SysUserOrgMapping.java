package com.winning.bi.domain.sys;

public class SysUserOrgMapping {
	private SysUser user;
	private SysOrg org;
	/**
	 * 1:正职 2: 副职
	 */
	private int station;

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

	public int getStation() {
		return station;
	}

	public void setStation(int station) {
		this.station = station;
	}
}
