package org.just.xch.model.vo
{
	import org.just.xch.model.domain.Organization;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="org.just.xch.vo.CheckVO")]
	[Bindable]
	public class CheckVO  extends LightEntity
	{
		public function CheckVO()
		{
		}
		public var rid:String;
		public var rmc:String
		public var wgrq:String;
		public var jgdm:String;
		public var jgmc:String;
		public var jgid:String;
		public var ryid:String;
		public var rydm:String;
		public var rymc:String;
		public var zje:Number;
	}
}