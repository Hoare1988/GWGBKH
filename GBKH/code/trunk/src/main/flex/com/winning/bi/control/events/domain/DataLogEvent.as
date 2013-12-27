package com.winning.bi.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class DataLogEvent extends CairngormEvent
	{
		//public static const EVENT_QUERY_DATALOGS:String ="queryDataLogs";
		
		public static const EVENT_SAVE_DATALOG:String ="saveDataLog";
		public static const EVENT_SAVE_DATALOGS:String ="saveDataLogs";
		
		public function DataLogEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = value;
		}

	}
}