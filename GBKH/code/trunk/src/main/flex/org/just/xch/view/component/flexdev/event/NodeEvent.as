package org.just.xch.view.component.flexdev.event
{
	import flash.events.Event;
	
	import org.just.xch.view.component.flexdev.diagrammer.BaseNode;

	public class NodeEvent extends Event
	{
		public static const NODE_CLICK:String="nodeClick";
		public static const NODE_ADD:String="nodeAdd";
		public static const NODE_DELECT:String="nodeDelect";
		public static const NAME_CHANGE:String="nameChange";
		public static const NODEDRAG_COMPLETE:String="nodeDragComplete";
		
		
		public var currentNode:BaseNode;
		public function NodeEvent(type:String, node:BaseNode, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			currentNode=node;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new NodeEvent(this.type,this.currentNode);
		}
	}
}