package org.just.xch.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class SysModuleEvent extends CairngormEvent
	{
		public static const EVENT_QUERY_MODULES:String ="querySysModules";
		
		public static const EVENT_INSERT_MODULE:String ="insertSysModule";
		public static const EVENT_UPDATE_MODULE:String ="updateSysModule";
		
		public static const EVENT_DELETE_MODULE:String ="deleteSysModule";
		
		public function SysModuleEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = value;
		}

	}
}