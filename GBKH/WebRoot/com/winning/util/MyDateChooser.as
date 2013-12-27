package com.winning.util
{
	import mx.controls.DateChooser;
	import mx.core.mx_internal;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	use namespace mx_internal;
	[Style(name="todayIndicatorSkin", type="Class", inherit="no")]
	[Style(name="rollOverIndicatorSkin", type="Class", inherit="no")]
	[Style(name="selectionIndicatorSkin",type="Class",inherit="no") ]
	
	/**
	 *  重写DateChooser
	 *  设置默认中文显示
	 *  添加了时分秒的选择
	 *
	 */
	public class MyDateChooser extends DateChooser
	{
		public var times:MyTimeChooser;
		// Define a static variable.
		private static var stylesInited:Boolean=initStyles();
		
		
		// Define a static method.
		private static function initStyles():Boolean
		{
			if (!StyleManager.getStyleDeclaration("MyDateChooser"))
			{
				// If there is no CSS definition for MyDateChooser, 
				// then create one and set the default value.
				var dateChooserStyle:CSSStyleDeclaration=new CSSStyleDeclaration();
				dateChooserStyle.defaultFactory=function():void
				{
					this.todayIndicatorSkin = TodayChooserIndicator;
					this.rollOverIndicatorSkin = MyDateChooserIndicator;
					this.selectionIndicatorSkin = MyDateChooserIndicator;
				}
				//如果第三个参数设置为true，在使用该组件的页面加载时会有一个蒙板闪一下的问题
				StyleManager.setStyleDeclaration("MyDateChooser", dateChooserStyle,false);
				
				
			}
			return true;
		}
		
		
		public function MyDateChooser()
		{
			super();
			this.width=270;
			this.height=290;
			this.dayNames=["日", "一", "二", "三", "四", "五", "六"];
			this.monthNames=["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
			times=new MyTimeChooser();
			times.width=this.width;
			times.x=10;
			times.y=230;
		}
		
		
		protected override function createChildren():void
		{
			super.createChildren();
			addChild(times);
		}
		
		/**
		 * 重写显示方法，设置日期dateGrid显示高度，控制按钮不被日期遮挡
		 * @param unscaledWidth
		 * @param unscaledHeight
		 */
		override protected function updateDisplayList(unscaledWidth:Number,
													  unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight); 
			var dg:Object = this.mx_internal::dateGrid;
			if(dg && dg.hasOwnProperty("height")){
				dg["height"] = 210;
			}
		}
	}

}