package com.winning.presentation.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.winning.hra.model.ExportModel;
	import com.winning.hra.model.HraModelLocator;
	import com.winning.hra.model.vo.ExportExcelFileVO;
	import com.winning.presentation.control.delegates.ExportServiceDelegate;
	import com.winning.presentation.control.events.domain.ExportEvent;
	import com.winning.util.MathUtil;
	
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.rpc.IResponder;

	public class ExportCommand implements ICommand, IResponder
	{
		public function execute(event:CairngormEvent):void
		{
			switch (event.type)
			{
				case ExportEvent.EXPORT_EXCEL_FILE:
					exportExcelFile(event as ExportEvent);
				default:
					break;
			}
		}

		public function exportExcelFile(event:ExportEvent):void
		{
			var handler:IResponder=getHandler(eExportExcelFile_Result, fault);
			var exportServiceDelegate:ExportServiceDelegate=new ExportServiceDelegate(handler);
			exportServiceDelegate.exportExcelXls((event.data as ExportExcelFileVO).dataSet, (event.data as ExportExcelFileVO).headers, (event.data as ExportExcelFileVO).fileName);
		}

		// *************************************************************
		// Private result Function
		// *************************************************************
		public function eExportExcelFile_Result(data:Object):void
		{
			if (data.result == true)
			{
				Alert.show("导出病患病症Excel文件", "确认导出", Alert.YES | Alert.NO, null, proceedWithDownLoad);
			}
			else
			{
				Alert.show("信息有误，无法下载！", "提示");
			}
		}

		private function proceedWithDownLoad(event:CloseEvent):void
		{
			if (event.detail == Alert.YES)
			{
				var request:URLRequest=new URLRequest("/DrugMgt/xls/Applyexcel.xls?" + MathUtil.round());
				try
				{
					_exportModel.downloadFile.download(request);
				}
				catch (error:Error)
				{
					Alert.show("导出失败", "提示");
				}
			}
		}

		// *************************************************************
		// IResponder Interface Method stubs
		// *************************************************************

		public function fault(info:Object):void
		{
			Alert.show(info.toString());
		}

		private function getHandler(result:Function, fault:Function):IResponder
		{
			return (new mx.rpc.Responder(result, fault));
		}

		public function result(data:Object):void
		{ /* no longer used */
		}
		private var _exportModel:ExportModel=HraModelLocator.getInstance().exportModel;
		private var _model:HraModelLocator=HraModelLocator.getInstance();

	}
}
