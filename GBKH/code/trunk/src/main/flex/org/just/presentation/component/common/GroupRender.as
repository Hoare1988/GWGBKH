package com.winning.presentation.component.common
{
	import com.winning.persistence.domain.Order;
	
	import flash.display.CapsStyle;
	import flash.geom.Point;
	
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	
	[Style(name="bottomLineColor", type="uint", format="Color")]
	[Style(name="lineColor", type="uint", format="Color")]
	[Style(name="uniteLineColor", type="uint", format="Color")]
	[Style(name="lineLeftPadding", type="Number")]
	[Style(name="horizontalLineWidth", type="Number")]
	[Style(name="lineThickness", type="Number")]
	[Style(name="dotThickness", type="Number")]
	public class GroupRender extends UIComponent implements IListItemRenderer
	{
		private var _isDrawUp:Boolean=false;
		private var _isDrawDown:Boolean=false;
		private var _data:Object=null;
		private var lineColorName:String="lineColor";

		private static var classConstructed:Boolean=classConstruct();

		private static function classConstruct():Boolean
		{
			if (!StyleManager.getStyleDeclaration("GroupRender"))
			{
				var defaultLinkStyles:CSSStyleDeclaration=new CSSStyleDeclaration();
				defaultLinkStyles.defaultFactory=function():void
				{
					this.bottomLineColor=0x2C2C54;
					this.lineColor=0x666666;
					this.uniteLineColor=0xfff09e;
					this.lineThickness=2;
					this.dotThickness=1;
					this.lineLeftPadding=6;
					this.horizontalLineWidth=8;
				}
				StyleManager.setStyleDeclaration("GroupRender", defaultLinkStyles, true);
			}
			return true;
		}

		public function GroupRender()
		{
			super();
		}

		public function get isDrawUp():Boolean
		{
			return _isDrawUp;
		}

		public function set isDrawUp(value:Boolean):void
		{
			if (_isDrawUp == value)
			{
				return;
			}
			_isDrawUp=value;
			invalidateDisplayList();
		}

		public function get isDrawDown():Boolean
		{
			return _isDrawDown;
		}

		public function set isDrawDown(value:Boolean):void
		{
			if (_isDrawDown == value)
			{
				return;
			}
			_isDrawDown=value;
			invalidateDisplayList();
		}

		[Bindable("dataChange")]
		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data=value;
			if(data.hasOwnProperty('groupType')&&data['groupType']&&data['groupType']==Order.GROUB_TYPE_UNITE)
			{
				lineColorName="uniteLineColor";
			}
			else
			{
				lineColorName="lineColor";
			}
			if (value != null && value.groupChildrenNum > 1)
			{
				if (value.groupChildrenNo == 1)
				{
					isDrawUp=false;
					isDrawDown=true;
				}
				else if (value.groupChildrenNo == value.groupChildrenNum)
				{
					isDrawUp=true;
					isDrawDown=false;
				}
				else if (value.groupChildrenNo > 1 && value.groupChildrenNo < value.groupChildrenNum)
				{
					isDrawUp=true;
					isDrawDown=true;
				}
			}
			else
			{
				isDrawUp=false;
				isDrawDown=false;
			}
			dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			draw(new Point(this.getStyle("lineLeftPadding"),unscaledHeight/2));
		}

		private function draw(lineCenter:Point):void
		{
			this.graphics.clear();
			var horLineWidth:Number=this.getStyle("horizontalLineWidth");
			if(_isDrawUp==true&&_isDrawDown==true)
			{
				this.graphics.lineStyle(this.getStyle("lineThickness")+2, this.getStyle("bottomLineColor"), 0.70 ,true,"normal",CapsStyle.SQUARE);
				this.graphics.moveTo(lineCenter.x, 0);
				this.graphics.lineTo(lineCenter.x, lineCenter.y*2);
				this.graphics.moveTo(lineCenter.x, lineCenter.y);
				this.graphics.lineTo(lineCenter.x+horLineWidth, lineCenter.y);
				this.graphics.lineStyle(this.getStyle("dotThickness")+2, this.getStyle("bottomLineColor"), 0.70);
				this.graphics.drawCircle(lineCenter.x+horLineWidth, lineCenter.y, 2);
				this.graphics.lineStyle(this.getStyle("lineThickness"), this.getStyle(lineColorName), 0.70 ,true,"normal",CapsStyle.SQUARE);
				this.graphics.moveTo(lineCenter.x, 0);
				this.graphics.lineTo(lineCenter.x, lineCenter.y*2);
				this.graphics.moveTo(lineCenter.x, lineCenter.y);
				this.graphics.lineTo(lineCenter.x+horLineWidth, lineCenter.y);
				this.graphics.lineStyle(this.getStyle("dotThickness"), this.getStyle(lineColorName), 0.70);
				this.graphics.drawCircle(lineCenter.x+horLineWidth, lineCenter.y, 2);
			}
			else if(_isDrawUp==true)
			{
				this.graphics.lineStyle(this.getStyle("lineThickness")+2, this.getStyle("bottomLineColor"), 0.70 ,true,"normal",CapsStyle.SQUARE);
				this.graphics.moveTo(lineCenter.x, 0);
				this.graphics.lineTo(lineCenter.x, lineCenter.y);
				this.graphics.moveTo(lineCenter.x, lineCenter.y);
				this.graphics.lineTo(lineCenter.x+horLineWidth, lineCenter.y);
				this.graphics.lineStyle(this.getStyle("dotThickness")+2, this.getStyle("bottomLineColor"));
				this.graphics.drawCircle(lineCenter.x+horLineWidth, lineCenter.y, 2);
				this.graphics.lineStyle(this.getStyle("lineThickness"), this.getStyle(lineColorName), 0.70 ,true,"normal",CapsStyle.SQUARE);
				this.graphics.moveTo(lineCenter.x, 0);
				this.graphics.lineTo(lineCenter.x, lineCenter.y);
				this.graphics.moveTo(lineCenter.x, lineCenter.y);
				this.graphics.lineTo(lineCenter.x+horLineWidth, lineCenter.y);
				this.graphics.lineStyle(this.getStyle("dotThickness"), this.getStyle(lineColorName), 0.70);
				this.graphics.drawCircle(lineCenter.x+horLineWidth, lineCenter.y, 2);
			}
			else if(_isDrawDown==true)
			{
				this.graphics.lineStyle(this.getStyle("lineThickness")+2, this.getStyle("bottomLineColor"), 0.70 ,true,"normal",CapsStyle.SQUARE);
				this.graphics.moveTo(lineCenter.x, lineCenter.y);
				this.graphics.lineTo(lineCenter.x, lineCenter.y*2);
				this.graphics.moveTo(lineCenter.x, lineCenter.y);
				this.graphics.lineTo(lineCenter.x+horLineWidth, lineCenter.y);
				this.graphics.lineStyle(this.getStyle("dotThickness")+2, this.getStyle("bottomLineColor"), 0.70);
				this.graphics.drawCircle(lineCenter.x+horLineWidth, lineCenter.y, 2);
				this.graphics.lineStyle(this.getStyle("lineThickness"), this.getStyle(lineColorName), 0.70 ,true,"normal",CapsStyle.SQUARE);
				this.graphics.moveTo(lineCenter.x, lineCenter.y);
				this.graphics.lineTo(lineCenter.x, lineCenter.y*2);
				this.graphics.moveTo(lineCenter.x, lineCenter.y);
				this.graphics.lineTo(lineCenter.x+horLineWidth, lineCenter.y);
				this.graphics.lineStyle(this.getStyle("dotThickness"), this.getStyle(lineColorName), 0.70 );
				this.graphics.drawCircle(lineCenter.x+horLineWidth, lineCenter.y, 2);
			}

		}
	}
}