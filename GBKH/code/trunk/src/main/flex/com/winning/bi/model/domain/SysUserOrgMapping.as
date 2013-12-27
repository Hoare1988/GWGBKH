package com.winning.bi.model.domain
{
	import com.winning.bi.model.domain.SysUser;
	import com.winning.bi.model.domain.Organization;
	[RemoteClass(alias="com.winning.bi.domain.sys.SysUserOrgMapping")]
	[Bindable]
	public class SysUserOrgMapping
	{
		public function SysUserOrgMapping()
		{
		}
		
		public var user:SysUser;
		public var org:SysOrg;
	}
}