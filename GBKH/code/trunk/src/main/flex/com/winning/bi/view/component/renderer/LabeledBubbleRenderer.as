package com.winning.bi.view.component.renderer
{
	import com.winning.bi.view.component.series.LabeledBubbleSeries;
	
	import flash.display.Graphics;
	import flash.geom.Rectangle;
	
	import mx.charts.ChartItem;
	import mx.charts.chartClasses.GraphicsUtilities;
	import mx.controls.Label;
	import mx.graphics.IFill;
	import mx.graphics.IStroke;
	import mx.graphics.SolidColor;
	import mx.styles.StyleManager;
	import mx.utils.ColorUtil;
	
	/**
	 * Renders a chart bubble with a label. The label will only display properly if the
	 * parent series is an instance of LabeledBubbleSeries. 
	 */
	public class LabeledBubbleRenderer extends Label
	{
		public function LabeledBubbleRenderer()
		{
			super();
		}
		
		override public function set data(value:Object):void
		{
			_chartItem = value;
			invalidateProperties();
			invalidateDisplayList();
		}
		
		override public function get data():Object
		{
			return _chartItem;
		}
		
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			/* 
			*    Circle-drawing code is adapted from Adobe"s CircleItemRenderer 
			*/
			var fill:IFill;
			var state:String = "";
			var color:uint;
			var adjustedRadius:Number = 0;
			// Get fill and state from chartItem if applicable, else use the style property
			if(_chartItem is ChartItem && _chartItem.hasOwnProperty("fill"))
			{
				fill = _chartItem.fill;
				state = _chartItem.currentState;
			}
			else
			{
				fill = GraphicsUtilities.fillFromStyle(getStyle("fill"));
			}
			// If indicated in chartItem, set color and radius based on mouse-state
			switch(state)
			{
				case ChartItem.FOCUSED:
				case ChartItem.ROLLOVER:
					if(StyleManager.isValidStyleValue(getStyle("itemRollOverColor")))
						color = getStyle("itemRollOverColor");
					else
						color = ColorUtil.adjustBrightness2(GraphicsUtilities.colorFromFill(fill),-20);
					fill = new SolidColor(color);
					adjustedRadius = getStyle("adjustedRadius");
					if(!adjustedRadius)
						adjustedRadius = 0;
					break;
				case ChartItem.DISABLED:
				if(StyleManager.isValidStyleValue(getStyle("itemDisabledColor")))
					color = getStyle("itemDisabledColor");
				else
					color = ColorUtil.adjustBrightness2(GraphicsUtilities.colorFromFill(fill),20);
				fill = new SolidColor(GraphicsUtilities.colorFromFill(color));
				break;
				case ChartItem.FOCUSEDSELECTED:
				case ChartItem.SELECTED:
					if(StyleManager.isValidStyleValue(getStyle("itemSelectionColor")))
						color = getStyle("itemSelectionColor");
					else
						color = ColorUtil.adjustBrightness2(GraphicsUtilities.colorFromFill(fill),-30);
					fill = new SolidColor(color);
					adjustedRadius = getStyle("adjustedRadius");
					if(!adjustedRadius)
						adjustedRadius = 0;
					break;
			}
			
			// Establish the stroke, width, and height
			var stroke:IStroke = getStyle("stroke");
			var weight:Number = stroke ? stroke.weight / 2 : 0;
			_rcFill.right = unscaledWidth;
			_rcFill.bottom = unscaledHeight;
			var ht:Number = unscaledHeight - 2 * weight + adjustedRadius * 2;
			var wd:Number = unscaledWidth - 2 * weight + adjustedRadius * 2;
			// Draw the circle
			var g:Graphics = graphics;
			g.clear();        
			if (stroke)
				stroke.apply(g);
			if (fill)
				fill.begin(g, _rcFill);
			g.drawEllipse(weight - adjustedRadius, weight - adjustedRadius, wd, ht);
			if (fill)
				fill.end(g); 
			// end circle-drawing code
			
			// Set the label properties
			var labelParent:LabeledBubbleSeries = parent as LabeledBubbleSeries;
			var vAlign:String;
			var halfFont:Number;
			var topPadding:Number = 3;
			if(labelParent)
			{
				text = _chartItem.item[labelParent.labelField];
				vAlign = getStyle("textVAlign");
				if(vAlign != "top")
				{
					halfFont = getStyle("fontSize")/2;
					if(vAlign == "middle")
					{
						topPadding = (ht/2) - halfFont;
					}
					else if(vAlign == "bottom")
					{
						topPadding = ht - (getStyle("fontSize") + 7);
					}
				}
				setStyle("paddingTop", topPadding);
			}
			
		}
		
		private static var _rcFill:Rectangle = new Rectangle;
		private var _chartItem:Object;
	}

}