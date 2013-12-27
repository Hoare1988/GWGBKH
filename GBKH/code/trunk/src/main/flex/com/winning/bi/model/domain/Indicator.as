package com.winning.bi.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="com.winning.bi.domain.Indicator")]
	[Bindable]
	public class Indicator extends LightEntity
	{
		public function Indicator()
		{
		}

		public static const STATUS_CREATED:int=0; //创建
		//public static const STATUS_CFGSHOW:int = 1;//未配置展现方式
		public static const STATUS_AVAILABLE:int=5; //启用
		public static const STATUS_DISABLE:int=9; //停用
		public static const STATUS_INVALID:int=99; //作废

		public var code:String;
		public var name:String;
		public var py:String;
		public var description:String;
		public var formula:String;
		public var property1:String;
		public var property2:String;
		public var unit:String;
		public var status:int;
		public var enable:int;
		public var nature:int;
		public var visible:int;
		public var showInConsole:int;
		public var numprecision:int;
		public var indNode:IndNode;
		public var createDate:Date;
		public var updateDate:Date;

		public static function getStatusLabel(type:int):String
		{
			var s:String;
			switch (type)
			{
				case STATUS_CREATED:
					s="创建";
					break;
				/* case STATUS_CFGSHOW:
					s="未配置展现方式";
					break; */
				case STATUS_AVAILABLE:
					s="启用";
					break;
				case STATUS_DISABLE:
					s="停用";
					break;
				case STATUS_INVALID:
					s="作废";
					break;
				default:
					s="";
					break;
			}
			return s;
		}


	}
}