package com.winning.bi.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="com.winning.bi.domain.sys.SysOrg")]
	[Bindable]
	public class SysOrg extends LightEntity
	{
		public function SysOrg()
		{
		}
		public var id:int;
	    public var name:String;
		public var py:String;
	    public var code:String;
		public var enable:int;
		public var createDate:Date;
		public var updateDate:Date;
		public var comments:String;
		public var isSelected:Boolean;
		public var neeSave:Boolean;
		
	}
}