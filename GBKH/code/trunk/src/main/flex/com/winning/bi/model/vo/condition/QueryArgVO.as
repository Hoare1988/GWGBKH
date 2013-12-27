package com.winning.bi.model.vo.condition
{
	import com.winning.bi.model.domain.SysUser;
	import com.winning.bi.model.mlct.AppModelLocator;
	
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="com.winning.bi.vo.condition.QueryArgVO")]
	[Bindable]
	public class QueryArgVO extends LightEntity
	{
		public function QueryArgVO(mcode:String='15')
		{
			this.sysuser=AppModelLocator.getInstance().loginUser;
			this.mcode=mcode;
		}
		public var sysuser:SysUser;
		
		//申请访问权限
		public var mcode:String;
		
		
		public var orgID:Number;//机构标准代码
		public var jgmc:String;//机构名称
		public var ym:String;//年月2012-01
		public var previousYM:String;//年月2012-01
		public var nextYM:String;//年月2012-01
		public var beginYM:String;//开始年月
		public var endYM:String;//结束年月
		public var beginDay:String;//开始日期
		public var endDay:String;//结束日期
		
		public var jglbdm:String;
		public var hzdm:String;
		public var jzlx:int;
		
		public var itemId;
		
		public var item:Object;
		
		public var ruleId:String; //规则id
		
		public var tpc:String; //批次
		
		public var type:String; // 1参保 2医院 3药店  4医生
		
		public var tzts:ArrayCollection;//auditTask's zt Collection
		
		public var currentPage:int;//for Pager;
		public var maxRows:int;//for Pager;
		public var drugCode:String; //项目编码
		public var drugName:String; //项目名称
		public var isCheaf:int; //叶子标识
		public var isNode:int; //节点标识
		public var ids:String;
		public var admin:String; //当前登陆人的姓名
		public var city:String; //城市
		
		public var bzdm:String;//病种代码
		public var tzt:int;//zt for auditTask'zt
		
		public var qHeaderVO:QHeaderVO;//Header查询条件
		
		public var rid:Number;
		public var jg1:Number;
		public var jg2:Number;
		public var jg3:Number;
		public var jg4:Number;
		
		public var sql:String;//sql语句
		
		public var jglx:int; //机构类型
		public var jglb:int; //机构类别
		public var jgdj:int; //机构等级
		
		public var indName:String;//指标名称
		public var warnType:Number;
		public var jzlb:Number;
		
		public var bzid:Number;
		public var hzid:Number;
		
		public var tbName:String;
	}
}