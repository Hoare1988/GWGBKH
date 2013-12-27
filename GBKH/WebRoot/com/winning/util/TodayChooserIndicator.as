package com.winning.util
{
	import flash.display.Graphics;

	import mx.skins.halo.DateChooserIndicator;

	/**
	 * datechooser当前时间显示的背景皮肤
	 *
	 */
	public class TodayChooserIndicator extends DateChooserIndicator
	{
		public function TodayChooserIndicator()
		{
			super();
		}

		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(22, 20);
			var g:Graphics=graphics;


			g.clear();
			g.lineStyle(0, getStyle("themeColor"), 0)
			g.beginFill(!this.getStyle("todayColor") ? 0x818181 : this.getStyle("todayColor"));
			g.drawRect(4, 0, 22, 20);
			g.endFill();
		}
	}
}