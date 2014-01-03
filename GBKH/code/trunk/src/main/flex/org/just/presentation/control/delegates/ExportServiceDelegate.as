package com.winning.presentation.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import org.just.xch.control.delegates.Services;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;

	public class ExportServiceDelegate
	{
		private var _responder:IResponder;
		private var _service:Object;

		public function ExportServiceDelegate(responder:IResponder)
		{
			_responder=responder;
		}

		public function exportExcelXls(dataList:ArrayCollection, headers:Array, fileName:String):void
		{
			var call:Object=service.exportXls(dataList, headers, fileName);
			call.addResponder(_responder);
		}

		private function get service():Object
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.EXPORT_SERVUCE);
			}

			return _service;
		}
	}
}
