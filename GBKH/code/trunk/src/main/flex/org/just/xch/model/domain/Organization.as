package org.just.xch.model.domain
{
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.Organization")]
	[Bindable]
	public class Organization extends LightEntity
	{
		
		public function Organization()
		{
		}
		
		public static const LX_YLJG:String='1';
		public static const LX_DDYF:String='2';
		
		public var id:Number;// ID
		public var jgdm:String;// 机构代码
		public var jgmc:String;// 机构名称
		public var jglx:String;// 机构类型
		public var jglb:String;// 机构类别
		public var jgdj:String;// 机构等级
		public var sjzgjg:Number;// 上级主管机构
		public var jjlx:String;// 经济类型
		public var pjyd:String;// 平价药店
		public var lxgb:String;// 离休干部
		public var ettc:String;// 儿童统筹
		public var edyjsc:String;// 二等乙级伤残
		public var listOffice:ArrayCollection;//科室
		public var qy:String;//区域（区级别）
		
		// 外部结算系统：
		// 待定....
		
		// 附加
		public var ljwg:Number;// 累积违规记录数
		public var hmd:String;// 是否黑名单成员
		
		//其他
		public var isSelected:Boolean=false;
		
		//诚信
		public var csfz:Number;
		public var syfz:Number;
		public var kcfz:Number;

	}
}