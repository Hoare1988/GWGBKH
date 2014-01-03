package org.just.xch.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class AppOptionEvent extends CairngormEvent
	{
		public static const EVENT_QUERY_APPOPTIONS:String="queryAppOptions";
		public static const EVENT_INSERT_APPOPTIONS:String="insertAppOption";
		public static const EVENT_UPDATE_APPOPTIONS:String="updateAppOption";

		public function AppOptionEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data=value;
		}
	}
}