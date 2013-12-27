package com.winning.bi.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.winning.bi.model.domain.Item;
	import com.winning.bi.model.mlct.AppModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;

	public class ItemDelegate
	{
		private var responder:IResponder;
		private var _service: RemoteObject;
		private var token :AsyncToken;
		
		
		public function deleteItems(items:ArrayCollection):void
		{
			token=service.deleteItems(items);
			token.addResponder(responder);
		}
		
		
		public function deleteItemPermits(itemPermits:ArrayCollection):void
		{
			token=service.deleteItemPermits(itemPermits);
			token.addResponder(responder);
		}
		
		public function loadRootItems():void
		{
			token=service.queryItemsByCondition(AppModelLocator.getInstance().loginUser,null,null,null,null,null,1);
			token.addResponder(responder);
		}
		
		public function findRootItemsOnly():void
		{
			token=service.findRootItems(1);
			token.addResponder(responder);
		}
		
		
		public function insertItem(addItem:Item):void
		{
			token=service.insertItem(addItem);
			token.addResponder(responder);
		}
		
		
		public function insertRootItem(rootItem:Item):void
		{
			token=service.insertRootItem(rootItem);
			token.addResponder(responder);
		}
		
		public function updateItem(item:Item):void
		{
			token=service.updateItem(item);
			token.addResponder(responder);
		}

		/********************项目权限**********************/
		public function insertItemPermission(items:ArrayCollection):void
		{
			token=service.intsertItemPermission(items);
			token.addResponder(responder);
		}

		public function ItemDelegate(responder:IResponder)
		{
			this.responder=responder;
		}
		
		
		private function get service():RemoteObject
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.ITEM_SERVICE) as RemoteObject;
			}
			
			return _service;
		}
	}
}