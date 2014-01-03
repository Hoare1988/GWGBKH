package org.just.xch.control.events.custom
{
	import flash.events.Event;

	public class CustomEvent extends Event
	{ 
		public var data:Object;

		public function CustomEvent(type:String, data, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data=data;
		}

		override public function clone():Event
		{
			return new CustomEvent(type, data, bubbles, cancelable);
		}
	}
}