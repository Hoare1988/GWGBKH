package com.winning.bi.view.component.common{
	
	import mx.controls.Text;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
	[Bindable]
	public class Blink extends Text
	{
		private var blinkTimer:Timer;
		
		public function Blink():void
		{	
			this.blinkTimer = new Timer( 1000 , 0 );
				this.blinkTimer.addEventListener( "timer" , toggleText );
				this.blinkTimer.start();
		}
		
		public function toggleText( event:TimerEvent ):void
		{
			if( this.visible ){			
				this.visible = false;				
			}else{			
				this.visible = true;				
			}		
		}
		
		public function get interval():uint
		{
			return this.blinkTimer.delay;
		}
		public function set interval( value:uint ):void
		{
			this.blinkTimer.delay = value;		
		}
				
	}
	
}