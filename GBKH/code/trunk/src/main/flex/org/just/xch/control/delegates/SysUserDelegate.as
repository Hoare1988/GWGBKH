package org.just.xch.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;

	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;

	import org.just.xch.model.domain.SysUser;

	public class SysUserDelegate
	{

		private var responder:IResponder;
		private var _service:RemoteObject;
		private var token:AsyncToken;


		public function login(username:String, password:String):void
		{
			token=service.login(username, password);
			token.addResponder(responder);
		}

		public function logout():void
		{
			token=service.existSystem();
			token.addResponder(responder);
		}

		public function queryUsersByCondition(username:String, realname:String, py:String):void
		{
			token=service.queryUsersByCondition(username, realname, py);
			token.addResponder(responder);
		}

		public function queryPmUsers(username:String, realname:String, py:String):void
		{
			token=service.queryPmUsers(username, realname, py);
			token.addResponder(responder);
		}

		public function insertSysUser(sysUser:SysUser):void
		{
			token=service.insertSysUser(sysUser);
			token.addResponder(responder);
		}

		public function savePmUserRoles(sysUser:SysUser):void
		{
			token=service.savePmUserRoles(sysUser);
			token.addResponder(responder);
		}

		public function updateSysUser(sysUser:SysUser):void
		{
			token=service.updateSysUser(sysUser);
			token.addResponder(responder);
		}


		public function SysUserDelegate(responder:IResponder)
		{
			this.responder=responder;
		}

		private function get service():RemoteObject
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.SYSUSER_SERVICE) as RemoteObject;
			}

			return _service;
		}

	}
}