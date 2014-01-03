package org.just.xch.model.domain
{
	
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.ApplyRecord")]
	[Bindable]
	public class ApplyRecord extends LightEntity
	{
		public function ApplyRecord()
		{
		}
		public var id:Number;//
		public var auser:SysUser;// 申请用户
		public var mcode:String;// 申请模块ID
		public var ammc:String;// 申请模块名称
		public var amwjm:String;// 申请模块文件名
		public var areason:String;// 申请理由
		public var aruntime:Number;// 申请时长
		public var status:Number;// 状态
		public var ruser:SysUser;// 审核人
		public var rreason:String;// 审核结果备注
		public var rruntime:Number;// 分配时长
		public var kssj:Date;// 有效期开始
		public var jssj:Date;// 有效期结束
		public var sqsj:Date;// 申请时间
		public var shsj:Date;// 审核时间
		public var haveread:Number;// 是否已阅
		
		/////////////////////////////////////////////////
		
		public static const STATUS0:Number = 0;// 审核中
		public static const STATUS1:Number = 1;// 审核通过
		public static const STATUS2:Number = 2;// 审核不通过
		public static const STATUS3:Number = 3;// 过期
		
		public static const SSTATUS0:String = "审核中";// 
		public static const SSTATUS1:String = "已通过";//
		public static const SSTATUS2:String = "已拒绝";// 
		public static const SSTATUS3:String = "已过期";//
		
		public static const RT_01 :Number= 1;
		public static const RT_05 :Number= 5;
		public static const RT_10 :Number= 10;
		public static const RT_20 :Number= 20;
		public static const RT_25 :Number= 25;
		public static const RT_30 :Number= 30;
		public static const RT_98 :Number= 98;
		public static const RT_99 :Number= 99;
		
		public static const SRT_01 :String= "3小时";
		public static const SRT_05 :String= "24小时";
		public static const SRT_10 :String= "5天";
		public static const SRT_20 :String= "1个月";
		public static const SRT_25 :String= "3个月";
		public static const SRT_30 :String= "1年";
		public static const SRT_98 :String= "自定义";
		public static const SRT_99 :String= "永久";
		
		
	
		
		/////////////////////////////////////////////////
		public static function getRuntimeOption():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();

			return ac;
		}
		/////////////////////////////////////////////////
		public static function getRuntimeLabel(type:int):String
		{
			var s:String;
			switch (type)
			{
				case RT_01:
					s=SRT_01;
					break;
				case RT_05:
					s=SRT_05;
					break;
				case RT_10:
					s=SRT_10;
					break;
				case RT_20:
					s=SRT_20;
					break;
				case RT_25:
					s=SRT_25;
					break;
				case RT_30:
					s=SRT_30;
					break;
				case RT_98:
					s=SRT_98;
					break;
				case RT_99:
					s=SRT_99;
					break;
				default:
					s="";
					break;
			}
			return s;
		}
		
		public static function getStatusLabel(type:int):String
		{
			var s:String;
			switch (type)
			{
				case STATUS0:
					s=SSTATUS0;
					break;
				case STATUS1:
					s=SSTATUS1;
					break;
				case STATUS2:
					s=SSTATUS2;
					break;
				case STATUS3:
					s=SSTATUS3;
					break;
				default:
					s="";
					break;
			}
			return s;
		}
		/////////////////////////////////////////////////
	}
}