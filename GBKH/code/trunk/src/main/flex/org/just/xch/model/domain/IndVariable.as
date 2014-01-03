package org.just.xch.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="org.just.xch.domain.IndVariable")]
	[Bindable]
	public class IndVariable extends LightEntity
	{
		public function IndVariable()
		{
		}
		
		public var code:String;
		public var name:String;
		public var py:String;
		public var func:String;
		public var type:int;
		public var enable:int;
		public var description:String;
		public var updateDate:Date;
		
		/*木偶*/
		public var iselected:Boolean=false;

	}
}