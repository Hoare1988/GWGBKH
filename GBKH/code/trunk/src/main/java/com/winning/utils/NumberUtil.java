package com.winning.utils;

import java.util.Random;

public class NumberUtil
{
	private static final String[] NUMBERS = { "零", "一", "二", "三", "四", "五",
			"六", "七", "八", "九", "十" };

	private static int[] toArray(String number)
	{
		int[] array = new int[number.length()];
		for (int i = 0; i < number.length(); i++)
		{
			array[i] = Integer.parseInt(number.substring(i, i + 1));
		}
		return array;
	}

	public static String toChinese(int num)
	{
		StringBuffer result = new StringBuffer();
		if (num < 100 && num > 0)
		{
			int[] integers = toArray(num + "");
			if (integers.length == 1)
			{
				result.append(NUMBERS[integers[0]]);
			}
			else
			{
				result.append(integers[0] == 1 ? "" : NUMBERS[integers[0]]);
				result.append("十");
				result.append(integers[1] == 0 ? "" : NUMBERS[integers[1]]);
			}
		}
		return result.toString();
	}
	
	public static int getNum(int num){
		Random r=new Random();
		return 12000+r.nextInt(num);
	}
	
	public static void main(String[] args){
		System.out.println(10000+getNum(3000));
	}
	
	
}
