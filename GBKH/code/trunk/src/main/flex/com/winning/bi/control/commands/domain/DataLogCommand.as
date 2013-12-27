package com.winning.bi.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.winning.bi.control.delegates.DataLogDelegate;
	import com.winning.bi.control.events.domain.DataLogEvent;
	import com.winning.bi.utils.AlertUtil;
	import com.winning.bi.utils.CollectionUtil;
	import com.winning.bi.utils.Constant;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	public class DataLogCommand implements ICommand,IResponder
	{
		public function execute(event:CairngormEvent):void
		{
			switch (event.type)
			{
				case DataLogEvent.EVENT_SAVE_DATALOGS: //
					saveDataLogs(event as DataLogEvent);
					break;	
				default:
					break;
			}
		}
		
		
		private function saveDataLogs(event:DataLogEvent):void
		{
			var handler:IResponder=getHandler(result, fault);
			var dataLogDelete:DataLogDelegate=new DataLogDelegate(handler);
			dataLogDelete.insertItems(event.data as ArrayCollection);
		}
		
		public function fault(event:Object):void
		{
			AlertUtil.remoteMsg(event);
		}

		public function result(data:Object):void
		{
		}
		
		private function getHandler(result:Function, fault:Function):IResponder
		{
			return (new mx.rpc.Responder(result, fault));
		}
		
	}
}