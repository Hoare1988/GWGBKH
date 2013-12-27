package com.winning.bi.view.component.renderer
{
	import flash.display.DisplayObject;
	
	import mx.charts.LegendItem;
	import mx.charts.series.LineSeries;

	public class FontStyleLegendItem extends LegendItem
	{
		public function FontStyleLegendItem()
		{
			super();
			this.styleName = "legendItemStyle";
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			if(element is LineSeries)
			{
				var lineSer:LineSeries = element as LineSeries;
				var serStr:String = lineSer.yField.substring(0, 3);
				if(serStr == "std")
				{
					parent.removeChild(this as DisplayObject);
				} 
			}
		}
		
	}
}