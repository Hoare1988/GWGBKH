package com.winning.bi.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class DbConnEvent extends CairngormEvent
	{
		public static const EVENT_QUERY_DBCONN:String ="queryDbConns";
		public static const EVENT_INSERT_DBCONN:String ="insertDbConn";
		public static const EVENT_UPDATE_DBCONN:String ="updateDbConn";
		public static const EVENT_DELETE_DBCONN:String ="deleteDbConn";
		
		public static const EVENT_TEST_DBCONN:String ="testDbConn";
		
		public static const EVENT_QUERY_DBCONNS_VARDIMMAP:String ="queryDbConnsForVarDimMap";
		
		public function DbConnEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = value;
		}
	}
}