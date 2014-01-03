package org.just.xch.model.vo.condition
{
	import org.just.xch.model.domain.MRule;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.vo.condition.QHeaderVO")]
	[Bindable]
	public class QHeaderVO extends LightEntity
	{
		public function QHeaderVO()
		{
		}
		
		public static const BJFH1:int=1; // 大于等于
		public static const BJFH2:int=2; // 小于等于
		
		public var mrule:MRule;//监控规则
		public var ym:String;//年月YYYY-MM
		public var cbrIDOrMc:String;//参保人ID或者名称
		public var jgDmOrMc:String;//医疗机构代码或者名称
		public var ysDmOrMc:String;//医生代码或者名称
		public var bzDmOrMc:String;//病种代码或者名称
		public var shzt:String;//审核状态
		public var yjjb:String;//监控级别
		public var startNo:Number;
		public var maxRows:Number;
		public var jg1:Number;//结果1
		public var jg2:Number;//结果2
		public var bjfh:Number;//比较符号
		public var groupZd:String='JG1 DESC';
		public var rylb:String;
	}
}