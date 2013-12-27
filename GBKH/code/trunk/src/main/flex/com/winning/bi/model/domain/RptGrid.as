package com.winning.bi.model.domain
{
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="com.winning.bi.domain.RptGrid")]
	[Bindable]
	public class RptGrid extends LightEntity
	{

		public static const STATUS_VALID:int=1; //可用
		public static const STATUS_INVALID:int=9; //禁用

		public function RptGrid()
		{
		}

		public var code:String;
		public var name:String;
		public var py:String;
		public var status:int;
		public var type:int;
		public var sql:String;
		public var groupName:String;
		public var scriptType:String;
		public var description:String;
		public var updateDate:Date;
		public var dbConn:DbConn;
		public var gridColumns:ArrayCollection;


		public static function getStatusLabel(type:int):String
		{
			var s:String;
			switch (type)
			{
				case STATUS_VALID:
					s="可用";
					break;
				case STATUS_INVALID:
					s="禁用";
					break;
				default:
					s="";
					break;
			}
			return s;
		}

	}
}