package org.just.xch.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.sys.SysMemcache")]
	[Bindable]
	public class SysMemcache extends LightEntity
	{
		public function SysMemcache()
		{
		}
		
		public var id:Number;
		public var code:String; //代码
		public var name:String; //名称
		public var hasCache:Number; //是否缓存
		public var seconds:Number; //缓存的时间，以秒为单位
		public var createDate:Date; //创建时间
		public var creatorId:Number; //创建者id
		
	}
}