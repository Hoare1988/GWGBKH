package org.just.xch.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class PageEvent extends CairngormEvent
	{
		
		public static const INIT_QUERY:String="initQuery";
		
		public static const INIT_XM_QUERY:String="initXMQuery";
		
		public static const MT_RULE_LOG:String="mtrulelog";
		
		public static const SYS_LOG:String="syslog";
		
		public static const DRUG_SALES:String="drugSales";
		
		public static const PAGE_ITEM_CLINIC:String="pageItemClinic";
		
		public static const PAGE_ITEM_DRUG:String="pageItemDrug";
		
		public static const INIT_YP_QUERY:String="initYPQuery";
			
		public static const QUERY_AUDIT:String="queryAudit";
		
		public static const EVENT_QUERY_DRUG_ITEM_PAGE:String ="findDrugItemsByConditionPage";
		public static const EVENT_FIND_EWSYSTEM:String ="findEwsystem";
		public static const EVENT_FIND_DISEASE:String ="findDisease";
		public static const EVENT_FIND_MEDICAREKB:String='queryKBMedicare';
		public static const FINDALL_PROVIDER:String='findAllProvider';
		
		public function PageEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data=value;
		}
	}
}