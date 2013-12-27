package com.winning.bi.utils
{
	import mx.formatters.DateFormatter;
	

	public class TimeFormatter
	{
		public function TimeFormatter()
		{
			df.formatString="YYYY-MM-DD";
		}

		private static var df:DateFormatter=new DateFormatter();

		public static function parse(date:Date, formatString:String):String
		{
			df.formatString=formatString;
			return df.format(date);
		}

	}
}