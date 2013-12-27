package com.winning.bi.model.domain.sys
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="com.winning.bi.domain.sys.SysDataGridColumn")]
	[Bindable]
	public class SysDataGridColumn extends LightEntity
	{
		public function SysDataGridColumn()
		{
		}
		public var id:Number;
		public var pid:Number;
		public var label:String;
		public var textField:String;
		public var visable:Number;
		public var isDownField:Number;
		public var includeLayout:Number;
		public var sortIndex:Number;
		public var bz:String:String;
		/////////////////////////////////////////////////
	}
}