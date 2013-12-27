package com.winning.presentation.component.common
{
	import mx.containers.accordionClasses.AccordionHeader;
	import mx.controls.Image;

	public class ImageAccordionHeader extends AccordionHeader
	{
		private var _imgSource:Class;
		private var _img:Image;

		public function ImageAccordionHeader()
		{
//			super();
			this.setStyle('paddingRight', '0');
			this.setStyle('paddingLeft', '0');
		}

		override protected function createChildren():void
		{
			super.createChildren();

			if (this.data.hasOwnProperty('icon') && this.data.hasOwnProperty('name'))
			{
				if (!_img)
				{
					_img=new Image;
					_img.source=data.icon;
					_img.toolTip=data.name;
					_img.percentWidth=100;
					_img.percentHeight=100;
//					_img.width=180;
//					_img.height=32;
					addChild(_img);
				}
			}
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			_img.x=0;
			_img.y=0;
		}
	}
}