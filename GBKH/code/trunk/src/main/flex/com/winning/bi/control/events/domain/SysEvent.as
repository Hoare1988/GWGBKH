package com.winning.bi.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class SysEvent extends CairngormEvent
	{
		
		/* 登录 */
		public static const EVENT_LOGIN:String ="eventLogin";
		/* 登出 */
		public static const EVENT_EXIT:String ="eventExit";
		
		/*数据抽取分析日志*/
		public static const EVENT_QUERY_LOGS:String="queryLogs";
		public static const EVENT_SYS_LOG_COUNT:String="getSysLogCount";

		public function SysEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = value;
		}
		
		

	}
}