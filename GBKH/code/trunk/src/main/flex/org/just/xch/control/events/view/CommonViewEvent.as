package org.just.xch.control.events.view
{
	import flash.events.Event;
	
	public class CommonViewEvent extends Event
	{
		public var data:Object;
		
		public function CommonViewEvent(type:String, data, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		override public function clone():Event
		{
			return new CommonViewEvent(type, data, bubbles, cancelable);	
		}
		
		//CP
		public static const EVENT_OPEN_CPDISEASE:String = "openCPDiseaseReport";
		public static const EVENT_OPEN_CPINDDETAIL:String = "openCPIndDetail";
		public static const EVENT_TOGGLE_CPRANKORDER:String = "toggleCPRankOrder";
		
		public static const EVENT_OPEN_CUSTOM_REPORT:String = "openCustomReport";
		//TY
		public static const EVENT_OPEN_TYINDDETAIL:String = "openTYIndDetail";
		public static const EVENT_TOGGLE_TYRANKORDER:String = "toggleTYRankOrder";
		
		//YB
		public static const EVENT_OPEN_RULETEMPLATE:String = "openRuleTemplate";
		
		public static const EVENT_OPEN_MONITOR_TEMPLATE:String = "openMonitorTemplate";
		
		//analysis warnning
		public static const EVENT_OPEN_ANALYSIS_MODULE:String = "openAnalysisModule";

		//open  analysisdisease
		public static const EVENT_OPEN_ANALYSISDISEASE_MODULE:String="openAnalysisDiseaseModuleByType"
		
		//
		
		public static const EVENT_OPEN_FHLJ:String = "openFhlj";
		
		public static const EVENT_OPEN_ZYCF:String = "openZycf";
		
		//FA
		public static const EVENT_FA_ADDINDEX:String = "addFAIndex";
		
		public static const EVENT_FA_MMDTOVER:String = "mouseMoveOverDataTip";
		public static const EVENT_FA_MMDTOUT:String = "mouseMoveOutDataTip";
		
		public static const EVENT_TOGGLE_BACKGROUNDLINE:String = "toggleBackgroundLine";
		
		public static const EVENT_FA_FORWARDTOCASE:String = "forwardToCasePage";
		public static const EVENT_FA_FORWARDTOZPCASE:String = "forwardToZongPanCasePage";
		public static const EVENT_FA_FORWARDTODRUG:String = "forwardToDrugPage";
		public static const EVENT_FA_WGPIE:String = "forwardToWgPie";
		
		//pop a htm
		public static const EVENT_POP_HTML:String = "popHtmlView";

	}
}