package org.just.xch.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import org.just.xch.control.delegates.DataLogDelegate;
	import org.just.xch.control.events.domain.DataLogEvent;
	import org.just.xch.utils.AlertUtil;
	import org.just.xch.utils.CollectionUtil;
	import org.just.xch.utils.Constant;
	
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