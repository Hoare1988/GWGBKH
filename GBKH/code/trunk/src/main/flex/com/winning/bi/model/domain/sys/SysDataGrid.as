package com.winning.bi.model.domain.sys
{
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="com.winning.bi.domain.sys.SysDataGrid")]
	[Bindable]
	public class SysDataGrid extends LightEntity
	{
		public function SysDataGrid()
		{
		}
		public var id:Number;
		public var pid:Number;
		public var name:String;
		public var bz:String;
		public var columnList:ArrayCollection;
		/////////////////////////////////////////////////
	}
}