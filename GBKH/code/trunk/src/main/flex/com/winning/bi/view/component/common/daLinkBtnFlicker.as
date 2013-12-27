package com.winning.bi.view.component.common
{
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import mx.controls.LinkButton;

	[Bindable]
	public class daLinkBtnFlicker extends LinkButton
	{
		private var blinkTimer:Timer;
		[Bindable]
		public var unread:int=0;

		public function daLinkBtnFlicker()
		{
			this.setStyle('color', '0xffffff');
			this.blinkTimer=new Timer(1000, 0);
			this.blinkTimer.addEventListener("timer", toggleText);
			this.blinkTimer.start();
		}

		public function toggleText( event:TimerEvent ):void
		{
			if(unread>0){
				if( this.visible ){			
					this.visible = false;				
				}else{			
					this.visible = true;				
				}	
			}else{
				this.visible = true;	
			}
				
		}

		public function get interval():uint
		{
			return this.blinkTimer.delay;
		}

		public function set interval(value:uint):void
		{
			this.blinkTimer.delay=value;
		}

		protected override function rollOverHandler(event:MouseEvent):void
		{
			this.setStyle('textDecoration', 'underline');
			this.setStyle('color', '0xff0000');
		}

		protected override function rollOutHandler(event:MouseEvent):void
		{
			this.setStyle('textDecoration', 'none');
			this.setStyle('color', '0xffffff');
		}
	}
}