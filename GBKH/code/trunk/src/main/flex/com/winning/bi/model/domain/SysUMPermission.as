package com.winning.bi.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="com.winning.bi.domain.SysUMPermission")]
	[Bindable]
	public class SysUMPermission extends LightEntity
	{
		public function SysUMPermission()
		{
		}
		
		public var id:Number;
		public var userid:Number;//用户ID
		public var mcode:Number;//模块CODE
		public var status:Number;//状态
		public var runtime:Number;//有效时长
		public var Date kssj:Date;//开始时间
		public var Date jssj:Date;//过期时间
		
		public static const STATUS0:Number = 0;//不可用
		public static const STATUS1:Number = 1;//可用
	}
}