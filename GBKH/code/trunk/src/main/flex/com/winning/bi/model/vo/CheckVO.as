package com.winning.bi.model.vo
{
	import com.winning.bi.model.domain.Organization;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="com.winning.bi.vo.CheckVO")]
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