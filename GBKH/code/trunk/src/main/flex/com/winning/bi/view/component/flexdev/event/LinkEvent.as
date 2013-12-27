package com.winning.bi.view.component.flexdev.event
{
	import flash.events.Event;
	
	import com.winning.bi.view.component.flexdev.diagrammer.Link;

	public class LinkEvent extends Event
	{
		public static const LINK_TO:String="linkTo";
		public static const LINK_DELECT:String="linkDelect";
		public static const LINK_NAME_CHANGE:String="l";
		
		public var currentLink:Link;
		public function LinkEvent(type:String,link:Link, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			currentLink=link;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new LinkEvent(this.type,this.currentLink);
		}
	}
}