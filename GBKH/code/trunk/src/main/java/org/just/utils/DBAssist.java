package org.just.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.just.exception.BusinessException;
import org.just.xch.domain.DbConn;

public class DBAssist
{
	public static Connection getConnection() throws Exception
	{
		DataSource ds = (DataSource) LocatorService.getInstance().getService(
				"dataSource");
		Connection conn = null;
		try
		{
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			return conn;
		}
		catch (SQLException e)
		{
			throw new BusinessException("获取数据连接出错!", e);
		}
	}

	public static ResultSet executeQuery(Connection conn, String sql)
			throws BusinessException
	{
		ResultSet rs = null;

		PreparedStatement stmt = null;
		try
		{
			stmt = conn.prepareStatement(sql);

			rs = stmt.executeQuery();
		}
		catch (SQLException e)
		{
			throw new BusinessException("执行SQL语句出错", e);
		}

		return rs;
	}

	public static Connection getConnection(String dbName)
			throws BusinessException
	{
		return null;
	}

	public static void setObject(PreparedStatement ps, int parameterIndex,
			Object ob) throws BusinessException
	{
		try
		{
			if (ob == null)
			{
				ps.setNull(parameterIndex, 12);
				return;
			}

			ps.setObject(parameterIndex, ob);
		}
		catch (SQLException e)
		{
			throw new BusinessException("(SQL预处理设置错误):\n" + e.toString());
		}
	}

	public static boolean testConnection(DbConn dbConn)
			throws BusinessException
	{
		boolean result = false;
		Connection conn = null;
		try
		{
			Class.forName(dbConn.getDrivername());
			conn = DriverManager.getConnection(dbConn.getUrl(),
					dbConn.getUsername(), dbConn.getPassword());
			result = true;
		}
		catch (Exception e)
		{
			throw new BusinessException("数据库连接失败!\n" + e.toString());
		}
		finally
		{
			if (conn != null)
			{
				try
				{
					conn.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
		return result;

	}
	/**
	 * public static void setSqlParam(PreparedStatement ps, Object[] obs) throws
	 * HIEAppException { int i; try { for (i = 0; i < obs.length; ++i) { if
	 * (obs[i] == null) { ps.setNull(i + 1, 12); } else { ps.setObject(i + 1,
	 * obs[i]); } }
	 * 
	 * } catch (SQLException e) { throw new HIEAppException("(SQL预处理设置错误):\n" +
	 * e.toString()); } }
	 */
}
