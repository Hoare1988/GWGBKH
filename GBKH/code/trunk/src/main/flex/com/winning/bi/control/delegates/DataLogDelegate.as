package com.winning.bi.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;

	public class DataLogDelegate
	{
		private var responder:IResponder;
		private var _service: RemoteObject;
		private var token :AsyncToken;
		
		public function insertItems(dataLogAC:ArrayCollection):void
		{
			token=service.saveDataLogs(dataLogAC);
			token.addResponder(responder);
		}


		public function DataLogDelegate(responder:IResponder)
		{
			this.responder=responder;
		}
		
		
		private function get service():RemoteObject
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.DATALOG_SERVICE) as RemoteObject;
			}
			
			return _service;
		}
	}
}