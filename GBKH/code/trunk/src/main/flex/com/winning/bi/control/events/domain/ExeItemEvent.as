package com.winning.bi.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class ExeItemEvent extends CairngormEvent
	{
		public static const EVENT_CREATE_EXEITEM_TREE:String="eventCreateExeItemTree";
		public static const EVENT_FIND_EXEITEM_BY_CONDITION:String="eventFindExeItemByCondition";
		
		public static const EVENT_UPDATE_EXEITEM_GRADE:String="eventUpdateExeItemGrade";
		public static const EVENT_UPDATE_EXEITEMLIST_GRADE:String="eventUpdateExeItemJListGrade";
		public static const EVENT_UPDATE_EXEITEMS:String="eventUpdateExeItems";
		
		public static const EVENT_QUERY_ROOT_EXE_ITEM:String="eventQueryAllRootExeItem";
		public static const EVENT_CALCULATE_EXAM_SUMPOINT:String="eventCalculateExamsSumPoint";
		public static const EVENT_QUERY_EXAMEXCEL_ITEMS_BY_ROOTEXEITEM="eventQueryExamExcelItemsByRootExeItem"
		
		public function ExeItemEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = value;
		}
	}
}