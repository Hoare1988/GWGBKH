package org.just.xch.utils
{
	import mx.formatters.DateFormatter;
	public class DateFormatterUtil extends DateFormatter
	{
		public function DateFormatterUtil()
		{
			super();
		}
		
		public function parseDate (str:String,formatterStr:String):Date
		{
			this.formatString=formatterStr;
			return parseDateString(str);
		}
		
		public static function subDays (beginDate:Date,endDate:Date,range:int=0):int
		{
			var startDate:Date=new Date;
			startDate.setTime(beginDate.getTime());
			var subDates:int=0;
			if(!range)
			{
				range=7;
			}
			if(startDate.getTime()<endDate.getTime())
			{
				var flag:Boolean=false;
				for(var i:int=1;i<range+1;i++)
				{
					startDate.date=startDate.date+1;
					if(startDate.getTime()>=endDate.getTime())
					{
						subDates=i;
						flag=true;
						break;
					}
				}
				if(!flag)
				{
					subDates=range;
				}
				
			}
			return subDates;
		}
		
		//add wangyan
		public static function addDays (beginDate:Date,useDays:Number):Date
		{
			var startDate:Date=new Date;
			startDate.setTime(beginDate.getTime());
			startDate.setDate(startDate.getDate()+useDays);
			return startDate;
		}
		
		public static function getDays (beginDate:Date,endDate:Date,range:int=0):int
		{
			var subDates:int=0;
			if(beginDate.getTime()<endDate.getTime())
			{
				if(endDate.getFullYear()>beginDate.getFullYear())
				{
					subDates=getYearCount(beginDate.getFullYear(),endDate.getFullYear())+
					getCount(beginDate.getFullYear(),beginDate.getMonth()+1,beginDate.getDate(),true)+
					getCount(endDate.getFullYear(),endDate.getMonth()+1,endDate.getDate(),false)+1;
				}
				else if(endDate.getFullYear()==beginDate.getFullYear())
				{
					if(endDate.getMonth()>beginDate.getMonth())
					{
						subDates=getCount(endDate.getFullYear(),endDate.getMonth()+1,endDate.getDate(),false)-
						getCount(beginDate.getFullYear(),beginDate.getMonth()+1,beginDate.getDate(),false)+1;
					}
					else if(endDate.getMonth()==beginDate.getMonth())
					{
						subDates = endDate.getDate()-beginDate.getDate()+1;
					}
					else
					{
						
					}
				}
				else
				{
					
				}
			}
				
			return subDates;
		}
		
		private static function getCount (year:int,month:int,date:Number,isSub:Boolean):int
		{
			var count:int=0;
			var sub:int=0;
			var full:int=0;
			if(year%100==0)
			{
				if(year%400==0)
				{
					sub=-2;
					full=365;
				}
				else
				{
					sub=-1;
					full=366;
				}
			}	
			else if(year%4==0)
			{
				sub=-2;
				full=365;
			}
			else
			{
				sub=-1;
				full=366;
			}
			switch(month)
			{
				case 1:
					count=date;
					break;
				case 2:
					count=(month-1)*30+1+date;
					break;
				case 3:
					count=(month-1)*30+1+sub+date;
					break;
				case 4:
					count=(month-1)*30+1+sub+1+date;
					break;
				case 5:
					count=(month-1)*30+1+sub+1+date;
					break;
				case 6:
					count=(month-1)*30+1+sub+1+1+date;
					break;
				case 7:
					count=(month-1)*30+1+sub+1+1+date;
					break;
				case 8:
					count=(month-1)*30+1+sub+1+1+1+date;
					break;
				case 9:
					count=(month-1)*30+1+sub+1+1+1+1+date;
					break;
				case 10:
					count=(month-1)*30+1+sub+1+1+1+1+date;
					break;
				case 11:
					count=(month-1)*30+1+sub+1+1+1+1+1+date;
					break;
				case 12:
					count=(month-1)*30+1+sub+1+1+1+1+1+date;
					break;
				
			}
			if(isSub==true)
			{
				count=full-count;
			}
			return count;
		}
		
		private static function getYearCount (beginYear:int,endYear:int):int
		{
			var count:int=0;
			
			var c:int=endYear-beginYear;
			
			for(var i:int=1;i<c;i++)
			{
				var full:int=0;
				var year:int=beginYear+i;
				if(year%100==0)
				{
					if(year%400==0)
					{
						full=365;
					}
					else
					{
						full=366;
					}
				}
				else if(year%4==0)
				{
					full=365;
				}
				else
				{
					full=366;
				}
				count+=full;
			}
			return count;
		}
		
		/**
		 * 字符串转日期
		 * */
		public static function convertToDate(str:String):Date{
			
			return DateFormatter.parseDateString(str);
			
		}

		
	}
}