package com.winning.bi.view.component.AdvancedDataGrid.Util
{
	import com.winning.bi.view.component.AdvancedDataGrid.Renderer.Header.AdvancedDataGridHeaderRenderer;
	import com.winning.bi.view.component.AdvancedDataGrid.Renderer.Item.AdvancedDataGridItemRenderer;
	
	import mx.core.IFactory;
	
	public class ItemRendererIFactory implements mx.core.IFactory
	{
		public var classname:String="";
		
		public function newInstance():*{
			var ret:Object;
			
			switch(classname.toLowerCase()){
				case "defaultheader":
					ret=new AdvancedDataGridHeaderRenderer();
				case "defaultitem":
				default:
					ret=new AdvancedDataGridItemRenderer();
				break;
			}
			
			return ret;
		} 
	}
}