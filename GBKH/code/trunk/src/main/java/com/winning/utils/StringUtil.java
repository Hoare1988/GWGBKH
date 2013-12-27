package com.winning.utils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.record.PageBreakRecord.Break;

public class StringUtil
{
	public static String cutMessage(String message)
	{
		if (message != null && message.length() > 1000)
		{
			return message.substring(999);
		}
		else
		{
			return message;
		}
	}

	public static String getPreviousMonth(String ym)
	{
		String result = "";
		int m = Integer.valueOf(ym.substring(5, 7));
		int y = Integer.valueOf(ym.substring(0, 4));
		if (m == 1)
		{
			result = (y - 1) + "-12";
		}
		else if (m == 11 || m == 12)
		{
			result = y + "-" + (m - 1);
		}
		else
		{
			result = y + "-0" + (m - 1);
		}
		return result;
	}
	
	public static Object[] getSplitArr(String ghdjids,int num)
	{
		List<Object> list=new ArrayList<Object>();
		String[] arr=null;
		if(ghdjids!=null && !"".equals(ghdjids))
		{
			arr=ghdjids.split(",");
		}
		if(arr.length>1)
		{
			StringBuffer sb=new StringBuffer();
			for (int i = 0; i < arr.length; i++){
				sb.append(","+arr[i]);
				if(i+1==arr.length){
					list.add(sb);
					break;
				}else{
					if(sb.length()>num){
						list.add(sb);
						sb=new StringBuffer();
					}		
				}
			}
		}else{
			list.add(ghdjids);
		}
		return list.toArray();
	}
	
	/**
	 * 四舍五入
	 * @param d double数值
	 * @param n 保留的小数位个数
	 * @return
	 */
	public static double myRound(double d, int n) {
		// 分别以A:d = 0.514d, n = 1和B:d = 0.514d, n = 2为例进行分析
		d = d * Math.pow(10, n);
		// A: 0.514 * 10 -> 5.14
		// B: 0.514 * 100 -> 51.4
		d += 0.5d;
		// A: 5.14 + 0.5 -> 5.64
		// B: 51.4 + 0.5 -> 51.9
		d = (long)d;
		// A: (long)5.64 -> 5
		// B: (long)51.9 -> 51
		d = d / Math.pow(10d, n);
		// A: 5 / 10d -> 0.5
		// B: 51 / 100d -> 0.51
		return d;
		// 合起来写
		// return (long)(d * Math.pow(10d, n) + 0.5d) / Math.pow(10d, n);	
	}

	public static void main(String[] args)
	{
//		String ym1=StringUtil.getPreviousMonth(DateUtil.formatDateToYM(new Date()));
//		String ym2=StringUtil.getPreviousMonth(ym1);
//		String ym3=StringUtil.getPreviousMonth(ym2);
//		System.out.println(ym1);
//		System.out.println(ym2);
//		System.out.println(ym3);
		
//		String parStrings="8192,1";
//		Object[] arr=getSplitArr(parStrings,7);
//		for (int i = 0; i < arr.length; i++)
//		{
//				System.out.println(arr[i]);
//		}
		
		System.out.println(myRound(100.13556, 2));
	}
}
