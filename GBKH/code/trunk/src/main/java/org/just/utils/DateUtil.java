package org.just.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.just.xch.domain.ApplyRecord;

public class DateUtil {
	public static final String YYYY_MM = "yyyy-MM";

	public static final SimpleDateFormat default_sdf = new SimpleDateFormat(
			"yyyy-MM-dd");
	public static final SimpleDateFormat sdf_ym = new SimpleDateFormat(
			"yyyy-MM");
	public static final SimpleDateFormat full_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public static final int BIG_MONTH = 31;

	public static final int SMALL_MONTH = 30;

	public static final int FEBRUARY_MONTH_BIG = 29;

	public static final int FEBRUARY_MONTH_SMALL = 28;

	// public static final SimpleDateFormat default_sdf2 = new SimpleDateFormat
	// ("yyyy-MM-dd HH:mm:ss");

	public static Date createDate(String date, String pattern) {
		Date result = null;
		if (!NewwinningUtil.isNotNull(date)) {
			return null;
		}
		if (!NewwinningUtil.isNotNull(pattern)) {
			return null;
		}
		if (!NewwinningUtil.isNotNull(date)) {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			
			try {
				result = sdf.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static Date createDate(String date) {
		Date result = null;
		if (!NewwinningUtil.isNotNull(date)) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			result = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static Date formatDate(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String dateStr = sdf.format(date);
		Date result = null;
		try {
			result = sdf.parse(dateStr);
		} catch (ParseException e) {
		}
		return result;
	}

	public static Date getStartDate(String date) {
		if (!NewwinningUtil.isNotNull(date)) {
			return null;
		}
		date += " 00:00:00";
		Date result = createDate(date, "yyyy-MM-dd HH:mm:ss");
		return result;
	}

	public static String getStartDateStr(String date) {
		if (!NewwinningUtil.isNotNull(date)) {
			return null;
		}
		date += " 00:00:00";
		return date;
	}

	public static Date getEndDate(String date) {
		if (!NewwinningUtil.isNotNull(date)) {
			return null;
		}
		date += " 23:59:59";
		Date result = createDate(date, "yyyy-MM-dd HH:mm:ss");
		return result;
	}

	public static String getEndDateStr(String date) {
		if (!NewwinningUtil.isNotNull(date)) {
			return null;
		}
		date += " 23:59:59";
		return date;
	}

	public static int getYear(java.util.Date date) {
		if (date == null) {
			return -1;
		}
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return c.get(java.util.Calendar.YEAR);
	}

	public static int getMonth(java.util.Date date) {
		if (date == null) {
			return -1;
		}
		java.util.Calendar c = java.util.Calendar.getInstance();
		c.setTime(date);
		return (c.get(java.util.Calendar.MONTH) + 1);
	}

	public static Date preMonthDay(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, -1);
		return formatDate(cal.getTime(), "yyyy-MM-dd HH:mm:ss");
	}

	public static Date firstDayTimeOfMonth(Date date) {
		Date newDate = createDate(getYear(date) + "-" + getMonth(date) + "-1");
		Calendar cal = Calendar.getInstance();
		cal.setTime(newDate);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		return cal.getTime();
	}

	public static Date lastDayTimeOfMonth(Date date) {
		Date newDate = createDate(getYear(date) + "-" + (getMonth(date) + 1)
				+ "-1");
		Calendar cal = Calendar.getInstance();
		cal.setTime(newDate);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.MILLISECOND, -1000);
		return cal.getTime();
	}

	public static String formatDateToString(Date date) {
		if (date == null) {
			return "";
		}
		return default_sdf.format(date);
	}

	public static String formatDateToYM(Date date) {
		if (date == null) {
			return "";
		}
		return sdf_ym.format(date);
	}
	
	public static String formatDateToPreYM(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, -1);
		 int month = cal.get(Calendar.MONTH) + 1;
		 int year = cal.get(Calendar.YEAR);
		return year+(month<10?"-0":"-")+month;
	}

	public static Date nextDay(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, 1);
		return formatDate(cal.getTime(), "yyyy-MM-dd");
	}

	public static List<String> getMonthDifferenceByYm(String begin, String end) {
		return getMonthDifferenceString(createDate(begin + "-01"),
				createDate(end + "-01"));
	}

	public static List<String> getMonthDifferenceString(Date begin, Date end) {
		List<String> list = new ArrayList<String>();
		if (begin.after(end)) {
			return list;
		}
		int yearBegin = getYear(begin);
		int yearEnd = getYear(end);
		int monthBegin = getMonth(begin);
		int monthEnd = getMonth(end);
		if ((yearEnd - yearBegin) == 0) {
			for (int i = monthBegin; i <= monthEnd; i++) {
				if (i < 10) {
					list.add(yearBegin + "0" + i);
				} else {
					list.add(yearBegin + "" + i);
				}
			}
		} else if ((yearEnd - yearBegin) == 1) {
			for (int i = monthBegin; i <= 12; i++) {
				if (i < 10) {
					list.add(yearBegin + "0" + i);
				} else {
					list.add(yearBegin + "" + i);
				}
			}
			for (int i = 1; i <= monthEnd; i++) {
				if (i < 10) {
					list.add(yearEnd + "0" + i);
				} else {
					list.add(yearEnd + "" + i);
				}
			}
		} else {
			for (int i = monthBegin; i <= 12; i++) {
				if (i < 10) {
					list.add(yearBegin + "0" + i);
				} else {
					list.add(yearBegin + "" + i);
				}
			}
			for (int y = 1; y < (yearEnd - yearBegin); y++) {
				for (int i = 1; i <= 12; i++) {
					if (i < 10) {
						list.add((yearBegin + y) + "0" + i);
					} else {
						list.add((yearBegin + y) + "" + i);
					}
				}
			}
			for (int i = 1; i <= monthEnd; i++) {
				if (i < 10) {
					list.add(yearEnd + "0" + i);
				} else {
					list.add(yearEnd + "" + i);
				}
			}
		}

		return list;
	}

	public static void main(String[] args) {
		// System.out.println (lastDayTimeOfMonth(createDate
		// ("2011-12-05 23:59:59", "yyyy-MM-dd HH:mm:ss")));
		// System.out.println (firstDayTimeOfMonth (createDate
		// ("2011-12-05 23:59:59", "yyyy-MM-dd HH:mm:ss")));
		// System.out.println (getMonthDifferenceByYm ("2008-12", "2011-10"));
		String begin = "2010-10";
		String end = "2011-10";
		String newBegin = "" + (Integer.parseInt(begin.substring(0, 4)) - 1)
				+ "-" + begin.substring(5, 7);
		String newEnd = "" + (Integer.parseInt(end.substring(0, 4)) - 1) + "-"
				+ end.substring(5, 7);
		System.out.println(begin + "  " + end);
		System.out.println(newBegin + "  " + newEnd);
		System.out.println(getMonthDifferenceByYm(newBegin, newEnd));
		System.out.println();
		System.out.println();
		// System.out.println ();
		// System.out.println (""+(Integer.parseInt (begin.substring
		// (0,4))-1)+begin.substring (5,7));

	}

	public static Date createDateByFormat(String date, String format) {
		if (!NewwinningUtil.isNotNull(date)) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date result = null;
		try {
			result = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String createDateStrings(String date, int n) {
		SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM");
		Date tempDate;
		try {
			tempDate = dft.parse(date);
			Calendar cDate = Calendar.getInstance();
			cDate.setTime(tempDate);
			cDate.set(Calendar.MONTH, cDate.get(Calendar.MONTH) + n);
			Date endDate = dft.parse(dft.format(cDate.getTime()));
			return dft.format(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	// check big or small month
	public static int daysOfMonth(String date, String format) {
		SimpleDateFormat dft = new SimpleDateFormat(format);
		int days = 0;
		Date tempDate;
		try {
			tempDate = dft.parse(date);
			Calendar cDate = Calendar.getInstance();
			cDate.setTime(tempDate);
			int month = cDate.get(Calendar.MONTH) + 1;
			switch (month) {
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				days = DateUtil.BIG_MONTH;
				break;
			case 2:
				days = isBigYear(date) ? DateUtil.FEBRUARY_MONTH_BIG
						: DateUtil.FEBRUARY_MONTH_SMALL;
				break;
			default:
				days = DateUtil.SMALL_MONTH;
				break;
			}
			return days;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return days;
		}
	}

	public static boolean isBigYear(String date) {
		SimpleDateFormat dft = new SimpleDateFormat(DateUtil.YYYY_MM);
		Date tempDate;
		try {
			tempDate = dft.parse(date);
			Calendar cDate = Calendar.getInstance();
			cDate.setTime(tempDate);
			int year = cDate.get(Calendar.YEAR);
			return (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) ? true
					: false;
		} catch (ParseException e) {
			return false;
		}

	}

	public static String changeYear(String date, int n) {
		SimpleDateFormat dft = new SimpleDateFormat("yyyy");
		Date tempDate;
		try {
			tempDate = dft.parse(date);
			Calendar cDate = Calendar.getInstance();
			cDate.setTime(tempDate);
			cDate.set(Calendar.YEAR, cDate.get(Calendar.YEAR) + n);
			Date endDate = dft.parse(dft.format(cDate.getTime()));
			return dft.format(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public static Date getEndDateByType(int type, Date customDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		switch (type) {
		case ApplyRecord.RT_01:
			cal.add(Calendar.HOUR_OF_DAY, 3);
			break;
		case ApplyRecord.RT_05:
			cal.add(Calendar.HOUR_OF_DAY, 24);
			break;
		case ApplyRecord.RT_10:
			cal.add(Calendar.DAY_OF_YEAR, 5);
			break;
		case ApplyRecord.RT_20:
			cal.add(Calendar.MONTH, 1);
			break;
		case ApplyRecord.RT_25:
			cal.add(Calendar.MONTH, 3);
			break;
		case ApplyRecord.RT_30:
			cal.add(Calendar.YEAR, 1);
			break;
		case ApplyRecord.RT_98:
			break;
		case ApplyRecord.RT_99:
			cal.add(Calendar.YEAR, 100);
			break;
		default:
			cal.add(Calendar.YEAR, 100);
			break;
		}
		Date date = customDate;
		if (type != ApplyRecord.RT_98) {
			date = formatDate(cal.getTime(), "yyyy-MM-dd HH:mm:ss");
		}
		return date;
	}

	public static int subMonth(String startDate, String endDate) {
		SimpleDateFormat dft = new SimpleDateFormat(DateUtil.YYYY_MM);
		Date tempStartDate;
		Date tempEndDate;
		Calendar cSDate = Calendar.getInstance();
		Calendar cEDate = Calendar.getInstance();
		int n=0;
		int subMonths=0;
		try {
			tempStartDate = dft.parse(startDate);
			tempEndDate = dft.parse(endDate);
			cSDate.setTime(tempStartDate);
			cEDate.setTime(tempEndDate);
			n=cEDate.get(Calendar.YEAR)-cSDate.get(Calendar.YEAR);
			subMonths=n*12+cEDate.get(Calendar.MONTH)-cSDate.get(Calendar.MONTH);
		} catch (ParseException e) {
			e.getMessage();
		}
		return subMonths;
	}

	
	public static Timestamp dateToTimestamp(Date date){
		if(date==null) return null;
		String dateStr = full_time.format(date);
		Timestamp ts = Timestamp.valueOf(dateStr);
		return ts;
	}
	
	public static String getPreMonth(String currMonth){
		
		return null;
	}
	
	
}
