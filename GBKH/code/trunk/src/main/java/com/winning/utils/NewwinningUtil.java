package com.winning.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 */
public class NewwinningUtil
{
	public static String getHostAddressOr()
	{
		String hostAddress = "";
		InetAddress inet;
		try
		{
			inet = InetAddress.getLocalHost();
			if (inet != null)
				hostAddress = inet.getHostAddress();
		}
		catch (UnknownHostException e)
		{
			e.printStackTrace();
		}
		return hostAddress;
	}

	public static int getMaximumCommonMultiple(int[] ary)
	{
		int min = 0;
		if (ary != null & ary.length > 0)
		{
			min = ary[0];
			for (int i = 0; i < ary.length; i++)
			{
				if (ary[i] < min)
				{
					min = ary[i];
				}
			}
			while (min >= 1)
			{
				boolean isCommon = true;
				for (int i = 0; i < ary.length; i++)
				{
					if (ary[i] % min != 0)
					{
						isCommon = false;
						break;
					}
				}
				if (isCommon)
				{
					break;
				}
				min--;
			}
		}

		return min;
	}

	public static int getCharacterPosition(String string, String matchString,
			int position)
	{
		// 这里是获取"/"符号的位置
		Matcher slashMatcher = Pattern.compile(matchString).matcher(string);
		int mIdx = 0;
		while (slashMatcher.find())
		{
			mIdx++;
			// 当"/"符号第三次出现的位置
			if (mIdx == position)
			{
				break;
			}
		}
		return slashMatcher.start();
	}

	public static boolean oneMatchSome(String str, String[] strs)
	{
		boolean flag = false;
		for (String matchStr : strs)
		{
			if (str.equals(matchStr))
			{
				flag = true;
				break;
			}
		}
		return flag;
	}

	public static boolean equalsString(String str1, String str2)
	{
		return str1 == str2 || str1.equals(str2);
	}

	public static boolean isNotNull(String str)
	{
		return str != null && !"".equals(str.trim()) && str.trim() != "";
	}

	public static boolean isNotNull(Integer integer)
	{
		return integer != null && integer != 0;
	}

	public static boolean arrayIsNull(Object[] objs)
	{
		if (objs == null)
			return true;
		for (Object obj : objs)
		{
			if (obj != null)
			{
				if (!"".equals(obj.toString().trim()))
				{
					return false;
				}
			}
		}
		return true;
	}

	/**
	 * To convert the first character of string to upper case
	 * 
	 * @param srcString
	 *            the source string
	 * @return the result after converted
	 */
	public static String toUpperCaseInitial(String srcString)
	{

		StringBuilder sb = new StringBuilder();
		sb.append(Character.toUpperCase(srcString.charAt(0)));
		sb.append(srcString.substring(1));

		return sb.toString();

	}

	/**
	 * To convert the first character of string to lower case
	 * 
	 * @param srcString
	 *            the source string
	 * @return the result after converted
	 */
	public static String toLowerCaseInitial(String srcString)
	{

		StringBuilder sb = new StringBuilder();
		sb.append(Character.toLowerCase(srcString.charAt(0)));
		sb.append(srcString.substring(1));

		return sb.toString();

	}

	public static List deepcopy(List src) throws IOException,
			ClassNotFoundException
	{
		ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		ObjectOutputStream out = new ObjectOutputStream(byteOut);
		out.writeObject(src);

		ByteArrayInputStream byteIn = new ByteArrayInputStream(
				byteOut.toByteArray());
		ObjectInputStream in = new ObjectInputStream(byteIn);
		List dest = (List) in.readObject();
		return dest;
	}

}
