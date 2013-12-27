package com.winning.test;

import java.util.Random;

public class TestUtil
{
	public static double getRandomNum(int num)
	{
		Random r = new Random();
		return r.nextInt(num);
	}

	public static String getRanStrNum(int num)
	{
		Random r = new Random();
		return r.nextInt(num) + "";
	}
}
