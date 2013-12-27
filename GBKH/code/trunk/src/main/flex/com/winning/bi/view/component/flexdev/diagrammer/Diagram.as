package com.winning.bi.view.component.flexdev.diagrammer {
	import com.winning.bi.model.domain.MRule;
	import com.winning.bi.view.component.flexdev.event.LinkEvent;
	import com.winning.bi.view.component.flexdev.event.NodeEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.events.DragEvent;
	import mx.managers.DragManager;

	public class Diagram extends Canvas {
		
		private var templateLine:Link;
		private var offsetX:Number;
		private var offsetY:Number;
		private var tempNode:BaseNode;
		[Bindable]
		public var selectItem:Object; 

		public function Diagram() {
			super();
			this.addEventListener(DragEvent.DRAG_ENTER, handleDragEnter);
			this.addEventListener(DragEvent.DRAG_DROP, handleDragDrop);
			this.addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
			this.addEventListener(Event.ADDED, handleAdded);
			this.addEventListener(Event.REMOVED, handleRemoved);
		}
		
		public function get isLinking():Boolean {
			return this.templateLine.fromNode != null;
		}
		
		override protected function createChildren():void {
			if(!this.templateLine) {
				this.templateLine = new Link;
			}
			super.createChildren();
		}
		
		private function handleAdded(event:Event):void {
			if(event.target is BaseNode) {
				var node:BaseNode = BaseNode(event.target);
				node.addEventListener(MouseEvent.ROLL_OVER, handleNodeRollOver);
				node.addEventListener(MouseEvent.ROLL_OUT, handleNodeRollOut);
			}
		}
		
		private function handleRemoved(event:Event):void {
			if(event.target is BaseNode) {
				var node:BaseNode = BaseNode(event.target);
				node.removeEventListener(MouseEvent.ROLL_OVER, handleNodeRollOver);
				node.removeEventListener(MouseEvent.ROLL_OUT, handleNodeRollOut);
			}
		}
		
		private function handleNodeRollOver(event:MouseEvent):void {
			if(this.isLinking) {
				this.templateLine.toNode = BaseNode(event.currentTarget);
			}
		}
		
		private function handleNodeRollOut(event:MouseEvent):void {
			if(this.isLinking) {
				this.templateLine.toNode = null;
			}
		}
		
		private function handleDragDrop(event:DragEvent):void {
			var node:BaseNode = event.dragSource.dataForFormat("node") as BaseNode;
			if(!node){
				node = tempNode;
				this.addChild(node);
				node.x =mouseX;
				node.y =mouseY;
			}else{
//			node.x = event.stageX - Number(event.dragSource.dataForFormat("mouseX"));
//			node.y = event.stageY - Number(event.dragSource.dataForFormat("mouseY"));
			node.x = event.stageX - offsetX;
			node.y = event.stageY - offsetY;

//			Alert.show('stageX=' + event.stageX.toString());
//			Alert.show('stageY=' + event.stageY.toString());
//			Alert.show('mouseX=' + Number(event.dragSource.dataForFormat("mouseY")).toString());
//			Alert.show('mouseY=' + Number(event.dragSource.dataForFormat("mouseY")).toString());
//			Alert.show('nodeX=' + node.x);
//			Alert.show('nodeY=' + node.y);	
			}
		}
		
		private function handleDragEnter(event:DragEvent):void {
			var node:BaseNode = event.dragSource.dataForFormat("node") as BaseNode;
			if(!node){
				node = new BaseNode();
				node.nodeName=selectItem.mc;
				node.name = selectItem.id;
				tempNode = node; 
			}else{
//			Alert.show('nodeX=' + node.x);
//			Alert.show('nodeY=' + node.y);
//			Alert.show('stageX=' + event.stageX.toString());
//			Alert.show('stageY=' + event.stageY.toString());
			offsetX = event.stageX - node.x;
    		offsetY = event.stageY - node.y;
			}
		  	DragManager.acceptDragDrop(UIComponent(event.currentTarget));			
		}		
		
		private function handleMouseMove(event:MouseEvent):void {
			if(this.isLinking) {
				this.templateLine.invalidateDisplayList();
			}
		}
		
		public function beginLink(fromNode:BaseNode):void {
			
			for each(var l:Object in this.getChildren()){
				if((l instanceof Link)&&l.fromNode == fromNode){
					return;
				}
			}
			
			this.templateLine = new Link;
			this.templateLine.fromNode = fromNode;
			this.addChild(this.templateLine);
		}
		
		public function endLink():void {
			this.removeChild(this.templateLine);
			this.addLink(this.templateLine.fromNode, this.templateLine.toNode);
			this.templateLine.fromNode = null;
			this.templateLine.toNode = null;
		}
		
		public function addLink(fromNode:BaseNode, toNode:BaseNode):void {
			var link:Link = null;
			
			for each(var l:Object in this.getChildren()){
				if((l instanceof Link)&&l.toNode == toNode){
					return;
				}
			}
			
			if(toNode.customLink != null) {
				link = toNode.customLink.newInstance();
			} else {
				link = new Link;
			}
			link.fromNode = fromNode;
			link.toNode = toNode;
			fromNode.addLeavingLink(link);
			toNode.addArrivingLink(link);
			this.addChildAt(link, 0);
			this.dispatchEvent(new LinkEvent(LinkEvent.LINK_TO,link));
		}
		
		public function removeNode(node:BaseNode):void {
			
			var nodeLinks:ArrayCollection = node.getAllLinks();
			for each(var nodeLink:Link in nodeLinks){
				if(this.contains(nodeLink)){
					this.removeChild(nodeLink);
				}
				nodeLink.fromNode.removeLink(nodeLink);
				this.dispatchEvent(new LinkEvent(LinkEvent.LINK_DELECT,nodeLink));
			}
			this.removeChild(node);
			this.dispatchEvent(new NodeEvent(NodeEvent.NODE_DELECT,node as BaseNode));
		}
				
		public function removeLink(link:Link):void {
			this.removeChild(link);
			link.fromNode.removeLink(link);
			link.toNode.removeLink(link);
			this.dispatchEvent(new LinkEvent(LinkEvent.LINK_DELECT,link));
		}
//		public function handleNodeNameChange(node:BaseNode):void
//		{
//			this.dispatchEvent(new NodeEvent(NodeEvent.NAME_CHANGE,node as BaseNode));
//		}	
		
		public function handleLinkNameChanged(link:Link):void
		{
			this.dispatchEvent(new LinkEvent(LinkEvent.LINK_NAME_CHANGE,link));
		}	
//		public function nodeDragComplete(node:BaseNode):void
//		{
//			this.dispatchEvent(new NodeEvent(NodeEvent.DRAG_COMPLETE,node as BaseNode));
//		}
	}
}