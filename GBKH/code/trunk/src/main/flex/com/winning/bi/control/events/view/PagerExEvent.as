package com.winning.bi.control.events.view
{
	import flash.events.Event;

	public class PagerExEvent extends Event
	{
		public var data:Object;
		
		public function PagerExEvent(type:String, data, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		override public function clone():Event
		{
			return new PagerExEvent(type, data, bubbles, cancelable);	
		}
		
		public static const QUERY_MHEADER:String="queryMHeader";
		
		public static const QUERY_TASKH:String="queryTaskH";
		
	}
}