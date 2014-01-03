package org.just.xch.model.domain.sys
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.sys.SysSearchRecord")]
	[Bindable]
	public class SysSearchRecord extends LightEntity
	{
		public function SysSearchRecord()
		{
		}
		public var id:Number;//
		public var user_id:Number;
		public var jgid:Number;
		public var bzid:Number;
		public var hzid:Number;
		public var ypid:Number;
		public var bz:String;
		public var createDate:Date;
		/////////////////////////////////////////////////
	}
}