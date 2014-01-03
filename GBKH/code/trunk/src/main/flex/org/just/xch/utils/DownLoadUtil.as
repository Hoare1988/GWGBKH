package org.just.xch.utils
{
	import org.just.xch.control.events.domain.ExcelExportEvent;
	import org.just.xch.control.events.domain.RptGridEvent;
	import org.just.xch.model.domain.RptGrid;
	import org.just.xch.model.vo.MethodVO;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.controls.Alert;


	public class DownLoadUtil
	{

		//private static var downloadfile:FileReference=new FileReference()

		public function DownLoadUtil()
		{
			//downloadfile.addEventListener(Event.COMPLETE, downLoadCompleteHandle);
			//downloadfile.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		}

		/* private function ioErrorHandler(event:IOErrorEvent):void
		   {
		   Alert.show("文件下载失败，请联系系统管理员！\n" + event.toString(), "温馨提示");
		   }



		   private function downLoadCompleteHandle(event:Event):void
		   {
		   Alert.okLabel="确认";
		   Alert.show("下载报表成功!", "提示");
		 } */

		public static function exportRptResult(rptGrid:RptGrid, begin:String, end:String,serverName:String,saveName:String, downloadfile:FileReference):void
		{
			if (rptGrid != null && begin != null && end != null && serverName != null)
			{
				new RptGridEvent(RptGridEvent.EVENT_EXPORT_RPTDATA, [rptGrid, begin, end, serverName]).dispatch();
				proceedWithDownLoad(serverName,saveName, downloadfile);
			}
			else
			{
				Alert.show("数据为空，无法下载!", "提示");
			}
		}
		
		
		public static function exportHandler(vo:MethodVO, downloadfile:FileReference):void
		{
			new ExcelExportEvent(ExcelExportEvent.EVENT_EXCEL,vo).dispatch();
//			proceedWithDownLoad(vo.titleName,downloadfile);
		}	
		
		
		


		public static function proceedWithDownLoad(serverName:String,saveName:String, downloadfile:FileReference):void
		{
			var request:URLRequest=new URLRequest(encodeURI("/" + Constant.APP_NAME_MMAP + "/xls/" + serverName + ".xls"));
			try
			{
//				navigateToURL(request);
				downloadfile.download(request,saveName+".xls");
				
			}
			catch (error:Error)
			{
				Alert.show(error.message);
				Alert.okLabel="确认";
				Alert.show("下载失败", "提示");
			}
		}

	}
}