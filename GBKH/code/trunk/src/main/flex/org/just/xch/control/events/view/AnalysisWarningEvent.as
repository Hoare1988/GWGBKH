package org.just.xch.control.events.view
{
	import flash.events.Event;
	
	public class AnalysisWarningEvent extends Event
	{
		public var data:Object;
		
		public function AnalysisWarningEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		override public function clone():Event
		{
			return new AnalysisWarningEvent(type, data, bubbles, cancelable);	
		}
		
		public static const EVENT_MAX_VIEW:String = "maxView";
		public static const EVENT_NORMAL_VIEW:String = "normalView";
		
		
		//stateName--零售药店、社会门诊、三级医院、二级公立医院、民营医院、社区中心、企业医疗机构
		public static const TYPE_PHARMACY:int=0;
		public static const TYPE_SOCIALHOSPITAL:int=1;
		public static const TYPE_THIRDHOSPITAL:int=2;
		public static const TYPE_SECONDHOSPITAL:int=3;
		public static const TYPE_PERSONALHOSPITAL:int=4;
		public static const TYPE_SOCIALCENTER:int=5;
		public static const TYPE_CORPORATEMEDICALINSTITUTION:int=6;
		

	}
}