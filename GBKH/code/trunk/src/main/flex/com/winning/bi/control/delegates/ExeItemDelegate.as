package com.winning.bi.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.winning.bi.model.domain.ExeItem;
	import com.winning.bi.model.mlct.AppModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	
	public class ExeItemDelegate
	{
		public function ExeItemDelegate(responder:IResponder)
		{
			this.responder=responder;
		}
		
		private var responder:IResponder;
		private var _service: RemoteObject;
		private var token :AsyncToken;
		
		public function getExamExcelItems(rootExeItem:ExeItem):void
		{
			token=service.getExamExcelItems(rootExeItem);
			token.addResponder(responder);
		}
		
		public function calculateExamsSumPoint(exeItems:ArrayCollection):void
		{
			token=service.calculateExamsSumPoint(exeItems);
			token.addResponder(responder);
		}
		
		public function  createExeItemTree(rootExeItem:ExeItem):void
		{
			token=service.createAccessFormByRootItem(rootExeItem);
			token.addResponder(responder);
		}
		
		public function findRootExeItems(exeItem:ExeItem):void
		{
			token=service.findRootExeItems(exeItem);
			token.addResponder(responder);
		}
		
		
		public function  loadExeItemTree(rootExeItem:ExeItem):void
		{
			token=service.findAllExeItemsByCondition(rootExeItem.item, rootExeItem.beAccessedUser,
			rootExeItem.typeValue,null,rootExeItem.isRootExeItem,AppModelLocator.getInstance().loginUser);
			token.addResponder(responder);
		}
		
		public function updateExeItm(exeItem:ExeItem):void
		{
			token=service.updateExeItem(exeItem);
			token.addResponder(responder);
		}
		
		public function batchUpdateExeItems(ac:ArrayCollection):void
		{
			token=service.updateExeItemList(ac);
			token.addResponder(responder);
		}
		
		
		private function get service():RemoteObject
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.EXEITEM_SERVICE) as RemoteObject;
			}
			
			return _service;
		}
	}
}