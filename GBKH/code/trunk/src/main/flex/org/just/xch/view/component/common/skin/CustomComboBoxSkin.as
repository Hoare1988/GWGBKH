package org.just.xch.view.component.common.skin
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import mx.skins.halo.ComboBoxArrowSkin;
	import mx.skins.halo.HaloColors;
	import mx.styles.StyleManager;
	import mx.utils.ColorUtil;

	public class CustomComboBoxSkin extends ComboBoxArrowSkin
	{
		private static var cache:Object={};

		public function CustomComboBoxSkin()
		{
			super();
		}

		private static function calcDerivedStyles(themeColor:uint, borderColor:uint, fillColor0:uint, fillColor1:uint):Object
		{
			var key:String=HaloColors.getCacheKey(themeColor, borderColor, fillColor0, fillColor1);
			if (!cache[key])
			{
				var o:Object=cache[key]={};
				HaloColors.addHaloColors(o, themeColor, fillColor0, fillColor1);
			}
			return cache[key];
		}

		override protected function updateDisplayList(w:Number, h:Number):void
		{
			super.updateDisplayList(w, h);
			var arrowColor:uint=getStyle("iconColor");
			var borderColor:uint=getStyle("borderColor");
			var cornerRadius:Number=getStyle("cornerRadius");
			var dropdownBorderColor:Number=getStyle("dropdownBorderColor");
			var fillAlphas:Array=getStyle("fillAlphas");
			var fillColors:Array=getStyle("fillColors");
			StyleManager.getColorNames(fillColors);
			var highlightAlphas:Array=getStyle("highlightAlphas");
			var themeColor:uint=getStyle("themeColor");
			// The dropdownBorderColor is currently only used
			// when displaying an error state.
			if (!isNaN(dropdownBorderColor))
			{
				borderColor=dropdownBorderColor;
			}
			var derStyles:Object=calcDerivedStyles(themeColor, borderColor, fillColors[0], fillColors[1]);
			var borderColorDrk1:Number=ColorUtil.adjustBrightness2(borderColor, -50);
			var themeColorDrk1:Number=ColorUtil.adjustBrightness2(themeColor, -25);
			var cornerRadius1:Number=Math.max(cornerRadius - 1, 0);
			var cr:Object={tl: 0, tr: cornerRadius, bl: 0, br: cornerRadius};
			var cr1:Object={tl: 0, tr: cornerRadius1, bl: 0, br: cornerRadius1};
			var arrowOnly:Boolean=true;
			// If our name doesn't include "editable", we are drawing the non-edit
			// skin which spans the entire control
			if (name.indexOf("editable") < 0)
			{
				arrowOnly=false;
				cr.tl=cr.bl=cornerRadius;
				cr1.tl=cr1.bl=cornerRadius1;
			}
			var g:Graphics=graphics;
			g.clear();
			// Draw the border and fill.
			switch (name)
			{
				case "upSkin":
				case "editableUpSkin":
					{
						var upFillColors:Array=[fillColors[0], fillColors[1]];
						var upFillAlphas:Array=[fillAlphas[0], fillAlphas[1]];
						// border
						drawRoundRect(0, 0, w, h, cr, [borderColor, borderColorDrk1], 1, verticalGradientMatrix(0, 0, w, h), GradientType.LINEAR, null, {x: 1, y: 1, w: w - 2, h: h - 2, r: cr1});
						// button fill
						drawRoundRect(1, 1, w - 2, h - 2, cr1, upFillColors, upFillAlphas, verticalGradientMatrix(1, 1, w - 2, h - 2));
						// top highlight
						drawRoundRect(1, 1, w - 2, (h - 2) / 2, {tl: cornerRadius1, tr: cornerRadius1, bl: 0, br: 0}, [0xFFFFFF, 0xFFFFFF], highlightAlphas, verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));
						break;
					}
				case "overSkin":
				case "editableOverSkin":
					{
						var overFillColors:Array;
						if (fillColors.length > 2)
						{
							overFillColors=[fillColors[2], fillColors[3]];
						}
						else
						{
							overFillColors=[fillColors[0], fillColors[1]];
						}
						var overFillAlphas:Array;
						if (fillAlphas.length > 2)
						{
							overFillAlphas=[fillAlphas[2], fillAlphas[3]];
						}
						else
						{
							overFillAlphas=[fillAlphas[0], fillAlphas[1]];
						}
						// border
						drawRoundRect(0, 0, w, h, cr, [themeColor, themeColorDrk1], 1, verticalGradientMatrix(0, 0, w, h), GradientType.LINEAR, null, {x: 1, y: 1, w: w - 2, h: h - 2, r: cr1});
						// button fill
						drawRoundRect(1, 1, w - 2, h - 2, cr1, overFillColors, overFillAlphas, verticalGradientMatrix(1, 1, w - 2, h - 2));
						// top highlight
						drawRoundRect(1, 1, w - 2, (h - 2) / 2, {tl: cornerRadius1, tr: cornerRadius1, bl: 0, br: 0}, [0xFFFFFF, 0xFFFFFF], highlightAlphas, verticalGradientMatrix(0, 0, w - 2, (h - 2) / 2));
						break;
					}
				case "downSkin":
				case "editableDownSkin":
					{
						// border
						drawRoundRect(0, 0, w, h, cr, [themeColor, themeColorDrk1], 1, verticalGradientMatrix(0, 0, w, h));
						// button fill
						drawRoundRect(1, 1, w - 2, h - 2, cr1, [derStyles.fillColorPress1, derStyles.fillColorPress2], 1, verticalGradientMatrix(1, 1, w - 2, h - 2));
						// top highlight
						drawRoundRect(1, 1, w - 2, (h - 2) / 2, {tl: cornerRadius1, tr: cornerRadius1, bl: 0, br: 0}, [0xFFFFFF, 0xFFFFFF], highlightAlphas, verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));
						break;
					}
				case "disabledSkin":
				case "editableDisabledSkin":
					{
						var disFillColors:Array=[fillColors[0], fillColors[1]];
						var disFillAlphas:Array=[Math.max(0, fillAlphas[0] - 0.15), Math.max(0, fillAlphas[1] - 0.15)];
						// border
						drawRoundRect(0, 0, w, h, cr, [borderColor, borderColorDrk1], 0.5, verticalGradientMatrix(0, 0, w, h), GradientType.LINEAR, null, {x: 1, y: 1, w: w - 2, h: h - 2, r: cr1});
						// button fill
						drawRoundRect(1, 1, w - 2, h - 2, cr1, disFillColors, disFillAlphas, verticalGradientMatrix(0, 0, w - 2, h - 2));
						arrowColor=getStyle("disabledIconColor");
						break;
					}
			}
			// Draw the triangle.
			g.beginFill(arrowColor);
			g.moveTo(w - 11.5, h / 2 + 3);
			g.lineTo(w - 15, h / 2 - 2);
			g.lineTo(w - 8, h / 2 - 2);
			g.lineTo(w - 11.5, h / 2 + 3);
			g.endFill();
		}
	}
}