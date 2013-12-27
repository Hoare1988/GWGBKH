package com.winning.bi.model.domain
{
	import com.winning.bi.model.domain.ApplyRecord;

	import mx.collections.ArrayCollection;

	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="com.winning.bi.domain.SMS")]
	[Bindable]
	public class SMS extends LightEntity
	{
		public function SMS()
		{
		}
		public var id:Number; //
		public var type:Number; // 消息类别
		public var title:String; // 消息标题
		public var content:String; // 消息内容
		public var consumerid:Number; // 接收者ID
		public var consumername:String; // 接收者名称
		public var providerid:Number; // 发送者ID
		public var providername:String; // 发送者名称
		public var received:Number; // 是否已阅读 0否 1是
		public var receiveddate:Date; // 阅读时间
		public var createdate:Date; // 创建时间
		//页面是否阅读
		public var readed:Boolean=false;

		public static const TYPE01:Number=1; //提醒(无ID)
		public static const TYPE02:Number=2; //私信(针对某个用户)
		public static const TYPE03:Number=3; //公告(针对所有用户)

		public static const STYPE01:String="提醒"; //提醒(无ID)
		public static const STYPE02:String="私信"; //私信(针对某个用户)
		public static const STYPE03:String="公告"; //公告(针对所有用户)


		public static function getTypeLabel(type:Number):String
		{
			var s:String;
			switch (type)
			{
				case TYPE01:
					s=STYPE01;
					break;
				case TYPE02:
					s=STYPE02;
					break;
				case TYPE03:
					s=STYPE03;
					break;
				default:
					s="";
					break;
			}
			return s;
		}
	}
}