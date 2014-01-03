package org.just.xch.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	import org.just.xch.model.domain.SysModule;
	
	public class SysModuleDelegate
	{
		private var responder:IResponder;
		private var _service: RemoteObject;
		private var token :AsyncToken;
		
		
		
		public function queryModulesByCondition():void
		{
			token=service.queryModulesByCondition();
			token.addResponder(responder);
		}
		
		public function insertSysModule(sysModule:SysModule):void
		{
			token=service.insertSysModule(sysModule);
			token.addResponder(responder);
		}
		
		public function updateSysModule(sysModule:SysModule):void
		{
			token=service.updateSysModule(sysModule);
			token.addResponder(responder);
		}
		
		public function deleteSysModule(sysModule:SysModule):void
		{
			token=service.deleteSysModule(sysModule);
			token.addResponder(responder);
		}
		
		
		
		
		
		public function SysModuleDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		
		private function get service():RemoteObject
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.SYSMODULE_SERVICE) as RemoteObject;
			}

			return _service;
		}

	}
}