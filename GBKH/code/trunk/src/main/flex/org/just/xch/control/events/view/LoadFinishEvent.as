package org.just.xch.control.events.view
{
	import flash.events.Event;
	
	public class LoadFinishEvent extends Event
	{
		
		public static const LOAD_FINISH:String="loadFinished";
			
		public function LoadFinishEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}