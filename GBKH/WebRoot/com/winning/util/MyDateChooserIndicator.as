package com.winning.util
{
	import flash.display.Graphics;

	import mx.skins.halo.DateChooserIndicator;

	/**
	 * 鼠标移动到日期、选择日期背景皮肤
	 *
	 */
	public class MyDateChooserIndicator extends DateChooserIndicator
	{
		public function MyDateChooserIndicator()
		{
			super();
		}
		public var todayColor:uint=0x818181;
		public var rollOverColor:uint=0xEEFEE6;

		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(22, 20);
			var g:Graphics=graphics;


			g.clear();
			g.lineStyle(0, getStyle("themeColor"), 0)
			g.beginFill(!this.getStyle("rollOverColor") ? 0xEEFEE6 : this.getStyle("rollOverColor"));
			g.drawRect(4, 0, 22, 20);
			g.endFill();
		}
	}
}