package com.winning.bi.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.winning.bi.control.delegates.ItemDelegate;
	import com.winning.bi.control.events.domain.ItemEvent;
	import com.winning.bi.model.domain.Item;
	import com.winning.bi.model.mlct.ItemMgtModelLocator;
	import com.winning.bi.utils.AlertUtil;
	import com.winning.bi.utils.CollectionUtil;
	import com.winning.bi.utils.Constant;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	public class ItemCommand implements ICommand,IResponder
	{
		public function execute(event:CairngormEvent):void
		{
			switch (event.type)
			{
				case ItemEvent.EVENT_LOAD_ALL_ITEM: //加载所有Item
					loadRootItems(event as ItemEvent);
					break;
				
				case ItemEvent.EVENT_ADD_ITEM:
					addItem(event as ItemEvent);
					break;
				case ItemEvent.EVENT_ADD_ROOT_ITEM:
					addRootItem(event as ItemEvent);
					break;
				
				case ItemEvent.EVENT_DELETE_ITEM:
					 deleteItem(event as ItemEvent);
					break;
				
				case ItemEvent.EVENT_DELETE_ITEM_AC:
					deleteItems(event as ItemEvent);
					break;
				
				case ItemEvent.EVENT_UPDATE_ITEM:
					 updateItem(event as ItemEvent);
					break;
				case ItemEvent.EVENT_FIND_ITEM_TREE_BY_ROOT_NAME:
					loadTreesByRootName(event as ItemEvent);
					break;
				case ItemEvent.EVENT_ADD_PERMISSION:
					savePermisssion(event as ItemEvent);
					break;
				
				case ItemEvent.EVENT_FIND_ROOT_ITEM:
					findRootItems(event as ItemEvent);
				case ItemEvent.EVENT_DELETE_ITEMPERMISSIONS:
					deleteItemPermits(event as ItemEvent);
					break;
					
				default:
					break;
			}
		}
		
		
		private  function deleteItemPermits(event:ItemEvent):void
		{
			
			var handler:IResponder=getHandler(result, fault);
			var itemDelete:ItemDelegate=new ItemDelegate(handler);
			itemDelete.deleteItemPermits(event.data as ArrayCollection);
			
		}
		
		private function findRootItems(event:ItemEvent):void
		{
			var handler:IResponder=getHandler(findRootItemsResultHandler, fault);
			var delegate:ItemDelegate=new ItemDelegate(handler);
			delegate.findRootItemsOnly();
		}
		
		private function findRootItemsResultHandler(data:Object):void
		{
			 ItemMgtModelLocator.getInstance().uMgt_queryRootItemAC=data.result;
		}
		
		
		private function loadRootItems(event:ItemEvent):void
		{
			var handler:IResponder=getHandler(loadAllItemsResultHandler, fault);
			var delegate:ItemDelegate=new ItemDelegate(handler);
			delegate.loadRootItems();
		}
		
		private function loadAllItemsResultHandler(data:Object):void
		{   
			clearItemMgtTree();
			var parentItemAC:ArrayCollection=new ArrayCollection();
			for each (var item:Item in data.result)
			{
				if (item.isRoot)
					parentItemAC.addItem(item);
				else
					_itemModel.childItemAC.addItem(item);
			}
			_itemModel.itemTreeAC=parentItemAC;
			
			_itemModel.itemTreeAC=CollectionUtil.sortBySortNum(_itemModel.itemTreeAC,'sortNum');
			for each (var parentItem:Item in _itemModel.itemTreeAC)
			{
				if(!parentItem.isBottom){
					setChildItem(parentItem);
				}
			}
		}
		
		/*
		 * 清空 项目管理模块中itemTree 的数据
		 */
		private function clearItemMgtTree():void
		{
			_itemModel.childItemAC.removeAll();
			_itemModel.itemTreeAC.removeAll();
		}
		
		private function setChildItem(item:Item):void
		{
			for each (var childItem:Item in _itemModel.childItemAC.source)
			{
				
				if (!childItem.isRoot &&childItem.parentItem.id==item.id)
				{
					item.childItems.addItem(childItem);
					item.children.addItem(childItem);
					if(childItem.isBottom!=Constant.TRUE)
					{
						setChildItem(childItem);
					}
					
					if(item.editable)
					{
						childItem.editable=true;
					}
					
				}
			}
		}
		
		
	public function savePermisssion(event:ItemEvent):void
	{
		var handler:IResponder=getHandler(savePermisssionResultHandler, fault);
		var delegate:ItemDelegate=new ItemDelegate(handler);
		delegate.insertItemPermission(event.data as ArrayCollection);
	}
		
	public function savePermisssionResultHandler(event:Object):void
	{
		AlertUtil.saveSuccess();
	}
	
		
		public function fault(event:Object):void
		{
			AlertUtil.remoteMsg(event);
		}

		public function result(data:Object):void
		{
		}
		

		private function addItem(event:ItemEvent):void
		{
			var handler:IResponder=getHandler(insertItemResultHandler, fault);
			var delegate:ItemDelegate=new ItemDelegate(handler);
			delegate.insertItem(event.data as Item);
		}
		
		private function addRootItem(event:ItemEvent):void
		{
			var handler:IResponder=getHandler(insertItemResultHandler, fault);
			var delegate:ItemDelegate=new ItemDelegate(handler);
			delegate.insertRootItem(event.data as Item);
		}
		
		
		private function insertItemResultHandler(data:Object):void
		{
			
		}
		
		private function loadTreesByRootNameResultHandler(data:Object):void
		{
		}
		
		/*作废项目*/
		private function deleteItems(event:ItemEvent):void
		{
			var handler:IResponder=getHandler(result,fault);
			var itemDelete:ItemDelegate=new ItemDelegate(handler);
			itemDelete.deleteItems(event.data as ArrayCollection);
		}
		
		/*作废项目*/
		private function deleteItem(event:ItemEvent):void
		{
			var handler:IResponder=getHandler(result,fault);
			var itemDelete:ItemDelegate=new ItemDelegate(handler);
			var itemsAc:ArrayCollection=new ArrayCollection();
			itemsAc.addItem(event.data);
			itemDelete.deleteItems(itemsAc);
		}
		
		private function updateItem(event:ItemEvent):void
		{
			var handler:IResponder=getHandler(insertItemResultHandler, fault);
			var delegate:ItemDelegate=new ItemDelegate(handler);
			delegate.updateItem(event.data as Item);
		}
		
		/*根据根节点名称加载考核项目树*/
		private function loadTreesByRootName(event:ItemEvent):void
		{
			var handler:IResponder=getHandler(loadTreesByRootNameResultHandler,result);
			var delegate:ItemDelegate=new ItemDelegate(handler);
			
		}
		
		
		
		private function getHandler(result:Function, fault:Function):IResponder
		{
			return (new mx.rpc.Responder(result, fault));
		}
		
		private var _itemModel:ItemMgtModelLocator=ItemMgtModelLocator.getInstance();
	}
}