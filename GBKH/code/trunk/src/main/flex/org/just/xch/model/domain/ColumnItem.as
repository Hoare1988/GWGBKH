package org.just.xch.model.domain
{
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.ColumnItem")]
	[Bindable]
	public class ColumnItem extends LightEntity
	{
		public function ColumnItem()
		{
		}
		public var columnLabel:String;//字段标签
		public var columnField:String;//字段数据内容
		public var columnIndex:int;//字段顺序
		public var reportID:Number;//报表ID
		public var comments:String;//备注
	}
}