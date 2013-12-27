package com.winning.bi.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class SysUserEvent extends CairngormEvent
	{
		
		
		public static const EVENT_QUERY_USERS:String ="querySysUsers";
		public static const EVENT_QUERY_USERS_BY_PY:String ="querySysUsersByPY";
		
		public static const EVENT_INSERT_USER:String ="insertSysUser";
		public static const EVENT_UPDATE_USER:String ="updateSysUser";
		
		public static const EVENT_QUERY_PMUSERS:String ="queryPmSysUsers";
		public static const EVENT_INSERT_PMUSERS:String ="insertPmSysUsers";
		
		
		public function SysUserEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = value;
		}
		
		

	}
}