package org.just.xch.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import org.just.xch.model.domain.ApplyRecord;
	import org.just.xch.model.vo.condition.QueryArgVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;

	public class AppDelegate
	{
		private var responder:IResponder;
		private var _service:RemoteObject;
		private var token:AsyncToken;

		public function updateSMSAfterRead(ac:ArrayCollection):void
		{
			token=service.updateSMSAfterRead(ac);
			token.addResponder(responder);
		}

		public function applyAccessLicense(ar:ApplyRecord):void
		{
			token=service.applyAccessLicense(ar);
			token.addResponder(responder);
		}

		public function saveApplyRecordVerifyResult(ar:ApplyRecord):void
		{
			token=service.saveApplyRecordVerifyResult(ar);
			token.addResponder(responder);
		}

		public function findNeedCheckApplyRecords():void
		{
			token=service.findNeedCheckApplyRecords();
			token.addResponder(responder);
		}
		
		public function queryLogs(jobName:String,status:String,beginDate:String,endDate:String,pageNum:Number,pageSize:Number):void
		{
			token=service.queryLogs(jobName,status,beginDate,endDate,pageNum,pageSize);
			token.addResponder(responder);
		}
		
		public function getSysLogCount(jobName:String,status:String,beginDate:String,endDate:String,pageNum:Number,pageSize:Number):void
		{
			token=service.getSysLogCount(jobName,status,beginDate,endDate,pageNum,pageSize);
			token.addResponder(responder);
		}

		public function AppDelegate(responder:IResponder)
		{
			this.responder=responder;
		}

		private function get service():RemoteObject
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.APP_SERVICE) as RemoteObject;
			}

			return _service;
		}
	}
}