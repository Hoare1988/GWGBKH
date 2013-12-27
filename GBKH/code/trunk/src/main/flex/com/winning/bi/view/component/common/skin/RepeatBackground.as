package com.winning.bi.view.component.common.skin
{
	import flash.geom.Rectangle;

	import mx.graphics.BitmapFill;
	import mx.skins.ProgrammaticSkin;
	import flash.text.StyleSheet;

	public class RepeatBackground extends ProgrammaticSkin
	{
		public function RepeatBackground()
		{
		}

		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);

			graphics.clear();
			var b:BitmapFill=new BitmapFill();
			b.source=getStyle("backgroundImage");
			var rectangle:Rectangle=new Rectangle(0, 0, w, h);
			b.begin(graphics, rectangle);
			//直角
			graphics.drawRect(0, 0, w, h);
			//圆角
			//graphics.drawRoundRect(0, 0, w, h, 20, 20);
			b.end(graphics);
		}
	}
}