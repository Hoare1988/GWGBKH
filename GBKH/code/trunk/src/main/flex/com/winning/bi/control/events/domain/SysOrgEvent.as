package com.winning.bi.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class SysOrgEvent extends CairngormEvent
	{
		public static const EVENT_QUERY_ORGS:String ="querySysOrgs";
		public static const EVENT_ADD_USER_ORG_MAP:String="addUserOrgMapping";
		public static const EVENT_Query_USER_BY_ORG_STATION:String="queryUserByOrgStation";
		public static const EVENT_ADD_OR_UPDATE_ORG:String="addOrUpdateOrg";
		
		public function SysOrgEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = value;
		}
	}
}