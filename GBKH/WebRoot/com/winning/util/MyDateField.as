package com.winning.util
{
	import flash.events.MouseEvent;
	
	import mx.controls.DateChooser;
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.events.CalendarLayoutChangeEvent;
	import mx.events.DropdownEvent;
	import mx.formatters.DateFormatter;


	/**

	 *  重写DateField

	 *  设置默认中文显示

	 *  添加了时分秒的选择

	 * 当时分秒值改变时显示值也改变

	 */

	public class MyDateField extends DateField
	{

		public var chooser:MyDateChooser;
		public var isStart:Boolean=true;

		public function MyDateField()
		{

			super();
			this.formatString="YYYY-MM-DD";
			this.dayNames=["日", "一", "二", "三", "四", "五", "六"];
			this.monthNames=["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
			this.dropdownFactory=new ClassFactory(MyDateChooser);
			this.labelFunction=formatDate;
			this.yearNavigationEnabled=true;

			//监听时间值变化
			this.addEventListener(CalendarLayoutChangeEvent.CHANGE, onChange);

			//监听dateChooser的打开事件
			this.addEventListener(DropdownEvent.OPEN, checkDateChooserPosition);
		}

		private function formatDate(currentDate:Date):String
		{

			if (!chooser)
			{
				chooser=this.dropdown as MyDateChooser;
			}

			if (currentDate)
			{
				if (chooser.times.nmsHour)
				{
					/*currentDate.hours=chooser.times.nmsHour.value;
					currentDate.minutes=chooser.times.nmsMinute.value;
					currentDate.seconds=chooser.times.nmsSecond.value;*/
				}
			}

			var df:DateFormatter=new DateFormatter();

			//df.formatString="YYYY-MM-DD JJ:NN:SS";
			df.formatString="YYYY-MM-DD";

			var times:String=df.format(currentDate);

			return times;

		}




		/**

		 * 时间值变化监听函数

		 * 单击日期值不关闭datechooser

		 */

		private function onChange(event:CalendarLayoutChangeEvent):void

		{

			this.open();

			this.labelFunction=formatDate;
			if (isStart)
			{
				chooser.times.nmsHour.value=00;
				chooser.times.nmsMinute.value=00;
				chooser.times.nmsSecond.value=00;
			}
			else
			{
				chooser.times.nmsHour.value=23;
				chooser.times.nmsMinute.value=59;
				chooser.times.nmsSecond.value=59;
			}
			
		}

		/**

		 * DateChooser显示监听

		 * 检查DateChooser的显示位置，如果为窗口遮挡则移动它的位置

		 */

		private function checkDateChooserPosition(event:DropdownEvent):void
		{
			var dateChooser:DateChooser=this.dropdown as DateChooser;

			if (dateChooser.y < 0)
			{
				dateChooser.move(dateChooser.x, 0);
			}
		}

	}
}