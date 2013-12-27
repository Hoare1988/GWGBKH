package com.winning.bi.control.events.view
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class LanguageEvent extends Event
	{
		public static const LANG_CHANGE:String="langChange";
		public static const dispatcher:EventDispatcher=new EventDispatcher();
		public var data:Object;

		public function LanguageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, data:Object=null)
		{
			super(type, bubbles, cancelable);
			this.data=data;
		}

		override public function clone():Event
		{
			return new LanguageEvent(type, bubbles, cancelable, data);
		}
	}
}