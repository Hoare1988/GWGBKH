package org.just.xch.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class SysRoleEvent extends CairngormEvent
	{
		public static const EVENT_QUERY_ROLES:String ="querySysRoles";
		
		public static const EVENT_INSERT_ROLE:String ="insertSysRole";
		public static const EVENT_UPDATE_ROLE:String ="updateSysRole";
		
		public static const EVENT_QUERY_PMROLES:String ="queryPmSysRoles";
		public static const EVENT_INSERT_PMROLES:String ="insertPmSysRoles";
		
		public function SysRoleEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = value;
		}

	}
}