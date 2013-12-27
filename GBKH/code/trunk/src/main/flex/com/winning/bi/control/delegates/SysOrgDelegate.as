package com.winning.bi.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.winning.bi.model.domain.SysOrg;
	import com.winning.bi.model.domain.SysUserOrgMapping;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;

	public class SysOrgDelegate
	{

		private var responder:IResponder;
		private var _service:RemoteObject;
		private var token:AsyncToken;

		
		public function saveOrUpdateSysorg(sysorg:SysOrg):void
		{
			token=service.saveOrUpdateOrg(sysorg);
			token.addResponder(responder);
		}
		
		public function queryOrgsByCondition(name:String, py:String):void
		{
			token=service.queryOrgByCondition(name, py);
			token.addResponder(responder);
		}

//		public function queryPmUsers(username:String, realname:String, py:String):void
//		{
//			token=service.queryPmUsers(username, realname, py);
//			token.addResponder(responder);
//		}
//
		public function insertSysUserOrgMap(sysUserOrgMap:SysUserOrgMapping):void
		{
			token=service.addSysUserOrgMap(sysUserOrgMap);
			token.addResponder(responder);
		}
		
		public function findSysUserByStationOrgNameMap(orgName:String,station:int):void
		{
			token=service.findUserByOrgAndStation(orgName,station);
			token.addResponder(responder);
		}
//
//		public function savePmUserRoles(sysUser:SysUser):void
//		{
//			token=service.savePmUserRoles(sysUser);
//			token.addResponder(responder);
//		}
//
//		public function updateSysUser(sysUser:SysUser):void
//		{
//			token=service.updateSysUser(sysUser);
//			token.addResponder(responder);
//		}


		public function SysOrgDelegate(responder:IResponder)
		{
			this.responder=responder;
		}

		private function get service():RemoteObject
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.SYSORG_SERVICE) as RemoteObject;
			}

			return _service;
		}

	}
}