package com.winning.presentation.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class ExportEvent extends CairngormEvent
	{
		public static const EXPORT_EXCEL_FILE:String="exportExcelFile";
		public function ExportEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data=value;
		}
	}
}