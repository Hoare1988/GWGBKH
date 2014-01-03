package org.just.xch.model.domain.sys
{
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.sys.SysDataGrid")]
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