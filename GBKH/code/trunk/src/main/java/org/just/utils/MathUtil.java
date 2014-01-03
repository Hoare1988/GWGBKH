package org.just.utils;

import java.math.BigDecimal;

public class MathUtil
{

	public static double keepTwoDecimalDouble(double d)
	{
		return new BigDecimal(d).setScale(2, BigDecimal.ROUND_HALF_UP)
				.doubleValue();
	}
	
	public static double keepFourDecimalDouble(double d)
	{
		return new BigDecimal(d).setScale(4, BigDecimal.ROUND_HALF_UP)
				.doubleValue();
	}

	public static double keepDecimalByPersion(double d, int percision)
	{
		return new BigDecimal(d).setScale(percision, BigDecimal.ROUND_HALF_UP)
				.doubleValue();
	}

	public static String getValueByPercision(int percision, double value)
	{
		String s = null;
		if (percision > 0)
		{
			s = "" + keepDecimalByPersion(value, percision);
		}
		else
		{
			s = "" + rounding(value);
		}
		return s;
	}

	public static float keepTwoDecimalFloat(double d)
	{
		return new BigDecimal(d).setScale(2, BigDecimal.ROUND_HALF_UP)
				.floatValue();
	}

	public static int rounding(double d)
	{
		return new BigDecimal(d).setScale(0, BigDecimal.ROUND_HALF_UP)
				.intValue();
	}
}
