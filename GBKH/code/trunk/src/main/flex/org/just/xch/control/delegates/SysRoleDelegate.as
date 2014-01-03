package org.just.xch.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	import org.just.xch.model.domain.SysRole;
	
	public class SysRoleDelegate
	{
		private var responder:IResponder;
		private var _service: RemoteObject;
		private var token :AsyncToken;
		
		
		
		public function queryRolesByCondition(name:String):void
		{
			token=service.queryRolesByCondition(name);
			token.addResponder(responder);
		}
		
		public function queryPmRoles(name:String):void
		{
			token=service.queryPmRoles(name);
			token.addResponder(responder);
		}
		
		public function insertSysRole(sysRole:SysRole):void
		{
			token=service.insertSysRole(sysRole);
			token.addResponder(responder);
		}
		
		public function updateSysRole(sysRole:SysRole):void
		{
			token=service.updateSysRole(sysRole);
			token.addResponder(responder);
		}
		
		public function savePmRoleModules(sysRole:SysRole):void
		{
			token=service.savePmRoleModules(sysRole);
			token.addResponder(responder);
		}
		
		
		
		
		
		
		
		public function SysRoleDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		
		private function get service():RemoteObject
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.SYSROLE_SERVICE) as RemoteObject;
			}

			return _service;
		}

	}
}