package org.just.xch.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.Ewsystem")]
	[Bindable]
	public class Ewsystem extends LightEntity
	{
		public function Ewsystem()
		{
		}
		
		public var id:Number;
		public var orgId:String;
		public var name:String;
		public var code:String;
		public var type:int;
		public var valueType:int;
		public var value:Number;
		public var province:String;
		public var city:String;
		public var rdate:String;
		public var days:Number;
		public var rylb:String;
		
	}
}