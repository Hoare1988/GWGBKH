package org.just.xch.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import org.just.xch.control.delegates.ExeItemDelegate;
	import org.just.xch.control.events.domain.ExeItemEvent;
	import org.just.xch.model.domain.ExeItem;
	import org.just.xch.model.mlct.ItemMgtModelLocator;
	import org.just.xch.utils.Constant;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	
	public class ExeItemCommand implements ICommand, IResponder
	{
		var exeItemModelLocator:ItemMgtModelLocator=ItemMgtModelLocator.getInstance();

		public function execute(event:CairngormEvent):void
		{
			switch(event.type)
			{
			 case ExeItemEvent.EVENT_CREATE_EXEITEM_TREE:
				 createExeItemTree(event as ExeItemEvent);
				 break;
			 case ExeItemEvent.EVENT_FIND_EXEITEM_BY_CONDITION:
				 findExeItemsByCondition(event as ExeItemEvent);
				 break;
			 case ExeItemEvent.EVENT_UPDATE_EXEITEM_GRADE:
				 gradeExeItem(event as ExeItemEvent);
			 case ExeItemEvent.EVENT_UPDATE_EXEITEMLIST_GRADE:
				 batchUpdateExeItem(event as ExeItemEvent);
				 break;
			 case ExeItemEvent.EVENT_QUERY_ROOT_EXE_ITEM:
				 findRootExeItems(event as ExeItemEvent);
				 break;
			 case ExeItemEvent.EVENT_CALCULATE_EXAM_SUMPOINT:
				 calculateExamSumPoint(event as ExeItemEvent);
				 break;
			
			 case ExeItemEvent.EVENT_UPDATE_EXEITEMS:
				 updateExeItems(event as ExeItemEvent);
				 break;
			 
			 case ExeItemEvent.EVENT_QUERY_EXAMEXCEL_ITEMS_BY_ROOTEXEITEM:
				 queryExamExcelItemsByRootItem(event as ExeItemEvent);
				 break;
			 default:
				 break;
			}
		}
		
		public function updateExeItems(event:ExeItemEvent):void
		{
		  var handler:IResponder=getHandler(result,fault);
		  var delegate:ExeItemDelegate=new ExeItemDelegate(handler);
		   delegate.batchUpdateExeItems(event.data as ArrayCollection);
		   
		}
		
		
		public function queryExamExcelItemsByRootItem(event:ExeItemEvent):void
		{
		  var handler:IResponder=getHandler(queryExamExcelItemsByRootItem_Result,fault);
		  var delegate:ExeItemDelegate=new ExeItemDelegate(handler);
		  delegate.getExamExcelItems(event.data as ExeItem);
		}
		
		public function queryExamExcelItemsByRootItem_Result(data:Object):void
		{
			exeItemModelLocator.excel_ExeItems=data.result;
		}
		
		function calculateExamSumPoint(event:ExeItemEvent):void
		{
			var handler:IResponder=getHandler(result, fault);
			var delegate:ExeItemDelegate=new ExeItemDelegate(handler);
			delegate.calculateExamsSumPoint(event.data as ArrayCollection);
		}
		
		function findRootExeItems(event:ExeItemEvent):void
		{
			var handler:IResponder=getHandler(findRootExeItemsResult, fault);
			var delegate:ExeItemDelegate=new ExeItemDelegate(handler);
			delegate.findRootExeItems(event.data as ExeItem);
		}
		
		private function findRootExeItemsResult(data:Object):void
		{
			exeItemModelLocator.exeMgt_queryRootExeItemAC=data.result as ArrayCollection;
		}
		
		function batchUpdateExeItem(event:ExeItemEvent):void
		{
			var handler:IResponder=getHandler(result, fault);
			var delegate:ExeItemDelegate=new ExeItemDelegate(handler);
			delegate.batchUpdateExeItems(event.data as ArrayCollection);
		}
		
		
		/**
		 * 项目打分
		 */
		public function gradeExeItem(event:ExeItemEvent):void
		{
			var handler:IResponder=getHandler(result, fault);
			var delegate:ExeItemDelegate=new ExeItemDelegate(handler);
			delegate.updateExeItm(event.data as ExeItem);
		}
		
		
		
		public function createExeItemTree(event:ExeItemEvent):void
		{
			var handler:IResponder=getHandler(result, fault);
			var delegate:ExeItemDelegate=new ExeItemDelegate(handler);
			delegate.createExeItemTree(event.data as ExeItem);
		}
		
		public function findExeItemsByCondition(event:ExeItemEvent):void
		{
			var handler:IResponder=getHandler(findExeItemsByConditionResultHandler, fault);
			var delegate:ExeItemDelegate=new ExeItemDelegate(handler);
			delegate.loadExeItemTree(event.data as ExeItem);
		}
		
		private function findExeItemsByConditionResultHandler(data:Object):void
		{   
			exeItemModelLocator.exeItemTreeAC.removeAll();
			exeItemModelLocator.childExeItemAC.removeAll();
			var parentItemAC:ArrayCollection=new ArrayCollection();
			var term:String="";
			for each (var item:ExeItem in data.result)
			{
				term=String(item.isRootExeItem)+"--";
				if (item.isRootExeItem==1){
					parentItemAC.addItem(item);
				}
				else{
					exeItemModelLocator.childExeItemAC.addItem(item);
				}
			}
			exeItemModelLocator.exeItemTreeAC=parentItemAC;
		    
			for each (var parentItem:ExeItem in exeItemModelLocator.exeItemTreeAC)
			{
				if(parentItem.isRootExeItem){
					setChildExeItem(parentItem);
				}
			}
		}
		private function setChildExeItem(exeItem:ExeItem):void
		{
			exeItem.childExeItems=new ArrayCollection();
			for each (var childItem:ExeItem in exeItemModelLocator.childExeItemAC.source)
			{
				if (!childItem.isRootExeItem &&childItem.parentExeItem.id==exeItem.id)
				{
					exeItem.childExeItems.addItem(childItem);
					exeItem.children.addItem(childItem);
					if(childItem.item.isBottom!=Constant.TRUE)
					{
						setChildExeItem(childItem);
					}
				}
			}
		}

		
		public function ExeItemCommand()
		{
		}
		
		public function result(data:Object):void
		{
			CursorManager.removeAllCursors();
		}
		
		public function fault(info:Object):void
		{
			Alert.show("ddd","fault");
		}
		
		private function getHandler(result:Function, fault:Function):IResponder
		{
			return (new mx.rpc.Responder(result, fault));
		}
		
	
	}
}