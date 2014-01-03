package org.just.xch.model.domain
{
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.ReportModule")]
	[Bindable]
	public class ReportModule extends LightEntity
	{
		public function ReportModule()
		{
		}
		public var id:Number;
		public var name:String;//报表名称
		public var code:String;//报表代码
		public var ordinal:Number;//排序号
		public var isLeaf:Number;//是否叶子
		public var groupName:String;//组别名称
		public var enable:Number;//是否启用
		public var comments:String;
		public var parentId:Number;
		public var children:ArrayCollection=new ArrayCollection();
		public var parent:ReportModule;
		public var sql:String;
		public var columnList:ArrayCollection=new ArrayCollection();
		public var editable:int;
	}
}