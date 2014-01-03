package org.just.xch.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.BaseDomain")]
	[Bindable]
	public class BaseDomain extends LightEntity
	{
		public function BaseDomain()
		{
		}
		public var id:int;
		public var createDate:Date;
		public var updateDate:Date;
		public var comments:String;
		public var createBy:SysUser;
		public var updateBy:SysUser;
		public var enable:int;

	}
}