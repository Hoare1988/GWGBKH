package com.winning.bi.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.winning.bi.model.domain.Disease;
	import com.winning.bi.model.domain.SysMemcache;
	import com.winning.bi.model.vo.condition.QueryArgVO;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class SysMemcacheDelegate
	{
		private var responder:IResponder;
		private var _service:RemoteObject;
		private var token:AsyncToken;
		
		public function SysMemcacheDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		
		private function get service():RemoteObject
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.SYSMEMCACHE_SERVICE) as RemoteObject;
			}
			return _service;
		}
		
		public function findSysMemcacheByHasCache(argVo:QueryArgVO):void
		{
			token=service.findSysMemcacheByHasCache(argVo);
			token.addResponder(responder);
		}
		
		public function insertSysMemcache(sysMemcache:SysMemcache):void
		{
			token=service.insertSysMemcache(sysMemcache);
			token.addResponder(responder);
		}
		public function updateSysMemcache(sysMemcache:SysMemcache):void
		{
			token=service.updateSysMemcache(sysMemcache);
			token.addResponder(responder);
		}
		public function deleteSysMemcacheById(sysMemcache:SysMemcache):void
		{
			token=service.deleteSysMemcacheById(sysMemcache);
			token.addResponder(responder);
		}
	}
}