package org.just.utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.just.exception.BusinessException;


public class AppAssist
{

	public static String getUniqueCode(String uniqueCode) throws Exception
	{
		CallableStatement proc = null;
		String uniqueValue = null;
		Connection conn = null;
		try
		{
			conn = DBAssist.getConnection();
			proc = conn.prepareCall("{ call Prc_get_UniqueCode(?,?,?,?,?,?) }");
			proc.setString(1, "da");
			proc.setString(2, uniqueCode);
			proc.setString(3, "1");
			proc.registerOutParameter(4, 12);
			proc.registerOutParameter(5, 8);
			proc.registerOutParameter(6, 12);
			proc.execute();

			conn.commit();
			Double returnValue = (Double) proc.getObject(5);
			if (returnValue.intValue() == -1)
			{
				throw new Exception("执行存储过程Prc_get_UniqueCode出错!"
						+ proc.getObject(6).toString());
			}

			uniqueValue = proc.getString(4);

		}
		catch (SQLException e)
		{
			throw new Exception("获取编码失败!");
		}
		finally
		{
			proc.close();
			conn.close();
		}
		return uniqueValue;
	}

	public static String repalceTimeVariable(String orginSqlStr,
			String startDate, String endDate)
	{
		String newSqlStr = "";
		if (orginSqlStr != null && !"".equals(orginSqlStr))
		{
			newSqlStr = orginSqlStr.replaceAll("#startDate", "'" + startDate
					+ "'");
			newSqlStr = newSqlStr.replaceAll("#endDate", "'" + endDate + "'");
		}
		return newSqlStr;
	}

	public static List<String> getDateList(String begin, String end)
	{
		List<String> dateList = DateUtil.getMonthDifferenceByYm(begin, end);
		if (dateList.size() > 15)
		{
			throw new BusinessException("日期跨度不要超过15！");
		}
		return dateList;
	}
}
