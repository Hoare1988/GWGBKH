package org.just.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateHelper
{
	public static final int MONTH = Calendar.MONTH;
	public static final int YEAR = Calendar.YEAR;
	public static final int DATE = Calendar.DATE;
	public static final int SECOND = Calendar.SECOND;

	/**
	 * Create a date by the string and format it according to the pattern
	 * 
	 * @param date
	 *            the String of the date
	 * @param pattern
	 * @return
	 * @throws ParseException
	 */
	public static Date createDate(String date, String pattern)
	{
		if (date == null || "".equals(date))
		{
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date result = null;
		try
		{
			result = sdf.parse(date);
		}
		catch (ParseException e)
		{
		}
		return result;
	}

	/**
	 * Create a date by the string and format it according to a default pattern
	 * yyyy-MM-dd
	 * 
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static Date createDate(String date)
	{
		if (date == null || "".equals(date))
		{
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_PATTERN);
		Date result = null;
		try
		{
			result = sdf.parse(date);
		}
		catch (ParseException e)
		{
		}
		return result;
	}

	/**
	 * Get current date
	 * 
	 * @return the current date
	 */
	public static Date now()
	{
		return new Date();
	}

	/**
	 * Get current date with the definite pattern
	 * 
	 * @param pattern
	 * @return
	 */
	public static Date now(String pattern)
	{
		Date today = new Date();
		return formatDate(today, pattern);
	}

	public static String formatDateToString(Date date, String pattern)
	{
		if (date == null)
		{
			return "";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}

	public static Date formatDate(Date date, String pattern)
	{
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String dateStr = sdf.format(date);
		Date result = null;
		try
		{
			result = sdf.parse(dateStr);
		}
		catch (ParseException e)
		{
		}
		return result;
	}

	public static Date addDate(Date date, int field, int amount)
	{
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(field, amount);
		return cal.getTime();
	}

	public static Date increaseDay(Date date)
	{
		return addDate(date, DATE, 1);
	}

	public static Date setHour(Date date, int hour)
	{
		if (date == null)
		{
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, hour);
		return cal.getTime();
	}

	/**
	 * parse the string of date according to another pattern
	 * 
	 * @param dateStr
	 *            the string of date
	 * @param pattern
	 *            the original pattern of string
	 * @param targetPattern
	 *            the target pattern
	 * @return
	 */
	public static String parse(String dateStr, String pattern,
			String targetPattern)
	{
		if (dateStr == null || "".equals(dateStr))
		{
			return null;
		}
		String resultStr = null;
		Date date = createDate(dateStr, pattern);
		resultStr = formatDateToString(date, targetPattern);
		return resultStr;
	}

	public static long getDifference(Date beginDate, Date endDate)
	{
		return endDate.getTime() - beginDate.getTime();
	}

	public static long getDayDifference(Date beginDate, Date endDate)
	{
		return (endDate.getTime() - beginDate.getTime()) / 1000 / 60 / 60 / 24;
	}

	public static long getMinuteDifference(Date beginDate, Date endDate)
	{
		return (endDate.getTime() - beginDate.getTime()) / 1000 / 60;
	}

	public static double getSecondDifference(Date beginDate, Date endDate)
	{
		return (endDate.getTime() - beginDate.getTime()) / 1000;
	}

	public static double getHourDifference(Date beginDate, Date endDate)
	{
		return (endDate.getTime() - beginDate.getTime()) / 1000 / 3600;
	}

	public static int getYearDifference(Date beginDate, Date endDate)
	{
		int beginYear = new Integer(formatDateToString(beginDate, "yyyy"));
		int endYear = new Integer(formatDateToString(endDate, "yyyy"));

		return endYear - beginYear;
	}

	public static int getMonthDifference(Date beginDate, Date endDate)
	{
		int beginYear = new Integer(formatDateToString(beginDate, "yyyy"));
		int endYear = new Integer(formatDateToString(endDate, "yyyy"));
		int beginMonth = new Integer(formatDateToString(beginDate, "MM"));
		int endMonth = new Integer(formatDateToString(endDate, "MM"));
		int month = Math.abs((endYear - beginYear) * 12
				+ (endMonth - beginMonth));
		return month;
	}

	public static boolean before(Date date1, String date2, String pattern)
	{
		Date date = createDate(date2, pattern);
		return date1.before(date);
	}

	public static Date nextDay(Date date)
	{
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, 1);
		return formatDate(cal.getTime(), Constants.DATE_PATTERN);
	}

	public static Date previousDay(Date date)
	{
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, -1);
		return formatDate(cal.getTime(), Constants.DATE_PATTERN);
	}

	public static boolean before(Date date1, Date date2)
	{
		return date1.before(date2);
	}

	public static boolean before(String date1, String date2, String pattern)
	{
		Date dateOne = createDate(date1, pattern);
		Date dateTwo = createDate(date2, pattern);
		return dateOne.before(dateTwo);
	}

	/**
	 * 返回年份
	 * 
	 * @param date
	 *            日期
	 * @return 返回年份
	 */
	public static String getYear(java.util.Date date)
	{
		if (date == null)
		{
			return "";
		}
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return c.get(java.util.Calendar.YEAR) + "";
	}

	/**
	 * 返回月份
	 * 
	 * @param date
	 *            日期
	 * @return 返回月份
	 */
	public static String getMonth(java.util.Date date)
	{
		if (date == null)
		{
			return "";
		}
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return (c.get(java.util.Calendar.MONTH) + 1) + "";
	}

	/**
	 * 返回日份
	 * 
	 * @param date
	 *            日期
	 * @return 返回日份
	 */
	public static String getDay(java.util.Date date)
	{
		if (date == null)
		{
			return "";
		}
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return c.get(java.util.Calendar.DAY_OF_MONTH) + "";
	}

	/**
	 * 返回小时
	 * 
	 * @param date
	 *            日期
	 * @return 返回小时
	 */
	public static String getHour(java.util.Date date)
	{
		if (date == null)
		{
			return "";
		}
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return c.get(java.util.Calendar.HOUR_OF_DAY) + "";
	}

	/**
	 * 返回分钟
	 * 
	 * @param date
	 *            日期
	 * @return 返回分钟
	 */
	public static String getMinute(java.util.Date date)
	{
		if (date == null)
		{
			return "";
		}
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		String minute = c.get(java.util.Calendar.MINUTE) + "";
		if (minute != null && !"".equals(minute.trim()))
		{
			if (minute.length() != 2)
			{
				minute = "0" + minute;
			}
		}
		return minute;
	}

	/**
	 * 返回秒钟
	 * 
	 * @param date
	 *            日期
	 * @return 返回秒钟
	 */
	public static String getSecond(java.util.Date date)
	{
		if (date == null)
		{
			return "";
		}
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return c.get(java.util.Calendar.SECOND) + "";
	}

	public static String getMonthAndDay(Date date)
	{
		if (date == null)
		{
			return "";
		}
		else
		{
			return getMonth(date) + "/" + getDay(date);
		}
	}

	/**
	 * 返回上月
	 * 
	 * @param date
	 *            日期
	 * @return 返回上月
	 */
	public static Date previousMonth(Date date)
	{
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, -1);
		return calendar.getTime();
	}
	
	/**
	 * 返回下月
	 * 
	 * @param date
	 *            日期
	 * @return 返回下月
	 */
	public static Date nextMonth(Date date)
	{
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, -1);
		return calendar.getTime();
	}

	/**
	 * 返回月初
	 * 
	 * @param date
	 *            日期
	 * @return 返回月初
	 */
	public static Date getMinMonthDate(Date date)
	{
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH,
				calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	/**
	 * 返回月末
	 * 
	 * @param date
	 *            日期
	 * @return 返回月末
	 */
	public static Date getMaxMonthDate(Date date)
	{
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH,
				calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	/**
	 * 返回年龄
	 * 
	 * @param date
	 *            日期
	 * @return 返回年龄
	 */
	public static int getAge(Date birthDay)
	{
		Calendar cal = Calendar.getInstance();

		if (cal.before(birthDay))
		{
			return 0;
		}

		int yearNow = cal.get(Calendar.YEAR);
		int monthNow = cal.get(Calendar.MONTH) + 1;// 注意此处，如果不加1的话计算结果是错误的
		int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH);
		cal.setTime(birthDay);

		int yearBirth = cal.get(Calendar.YEAR);
		int monthBirth = cal.get(Calendar.MONTH);
		int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);

		int age = yearNow - yearBirth;

		if (monthNow <= monthBirth)
		{
			if (monthNow == monthBirth)
			{
				// monthNow==monthBirth
				if (dayOfMonthNow < dayOfMonthBirth)
				{
					age--;
				}
				else
				{
					// do nothing
				}
			}
			else
			{
				// monthNow>monthBirth
				age--;
			}
		}
		else
		{
			// monthNow<monthBirth
			// donothing
		}

		return age;
	}

	// 获取当月第一天
	public static Date getFirstDayOfMonth()
	{
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 0);
		c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
		return c.getTime();
	}

}
