package org.just.xch.model.domain
{
	import org.just.xch.model.domain.SysUser;
	import org.just.xch.model.domain.Organization;
	[RemoteClass(alias="org.just.xch.domain.sys.SysUserOrgMapping")]
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