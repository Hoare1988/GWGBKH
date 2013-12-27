package com.winning.bi.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class SysMemcacheEvent extends CairngormEvent
	{
		public static const FIND_SYSMEMCACHE_BY_HASCACHE:String ="findSysMemcacheByHasCache";
		public static const INSERT_SYSMEMCACHE:String ="insertSysMemcache";
		public static const UPDATE_SYSMEMCACHE:String ="updateSysMemcache";
		public static const DELETE_SYSMEMCACHE_BY_ID:String ="deleteSysMemcacheById";
		
		public function SysMemcacheEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = value;
		}
		
		
		

	}
}