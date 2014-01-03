package org.just.xch.utils
{
	import flash.net.LocalConnection;
	
	import mx.controls.Alert;

	public class ClearMemory
	{
		private static var Instance:ClearMemory=new ClearMemory;

		public static function getInstance():ClearMemory
		{
			return Instance;
		}

		public function runClear():void
		{
			try
			{
				new LocalConnection().connect('shch8.com');
				new LocalConnection().connect('shch8.com');
			}
			catch (e:*)
			{
			}
		}
	}
}