package com.winning.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeoutException;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;

import org.apache.log4j.Logger;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.springframework.web.context.WebApplicationContext;

public final class Constant
{
	private final static Logger logger = Logger.getLogger(Constant.class);
	public static WebApplicationContext SPRING_CONTAINER = null;
	public static  MemcachedClient MEMCACHED_CLIENT=null;
	public static Map<String,Object> GLOBAL_POOL = new HashMap<String,Object>();
	public static final int TRUE = 1;
	public static final int FALSE = 0;
	public static final int NULL = -1;
	public static final int LOG_OUT =2;
	public static final int SESSION_TIMEOUT=30*60; //预设会话超时时间
	
	public static final String STR_TRUE = "1";
	public static final String STR_FALSE = "0";
	public static final String STR_NULL = "-1";


	public static final int YY = 0;// 医院
	public static final int YD = 1;// 药店
	
	// constant for sex 
	public static final String SEX_MAN="男";
	public static final String SEX_GIRL="女";

	public static final String SESSION_ID = "sessionID";
	public static final String SESSION_SYSUSER = "sysuser";
	public static final String CP_DIM_DEPT = "DIM000002";// 科室
	public static final String CP_DIM_PATHWAY = "DIM000003";// 路径
	public static final String CP_DIM_DOCTOR = "DIM000004";// 医生
	
	
	
	public static final String YJZ_1="1";//
	public static final String YJZ_2="2";//
	public static final String YJZ_3="3";//
	public static final String YJZMC_1="黄色预警";//
	public static final String YJZMC_2="橙色预警";//
	public static final String YJZMC_3="红色预警";//
	
	public static final String ERROR_TYPE01 = "1";//首次申请
	public static final String ERROR_TYPE02 = "2";//正在审核中
	public static final String ERROR_TYPE03 = "3";//登录超时
	public static final String MSG001 = "对不起,您未取得本页面的数据访问权限!\n是否向管理员申请获得权限？";
	public static final String MSG002 = "管理员正在审核您的访问请求，请耐心等待.";
	public static final String MSG003 = "抱歉，由于您长时间未做任何操作，系统已帮您自动退出，请重新登录后再进行操作！";
	
	public static final int JZLX_MZ=1;//门诊
	public static final int JZLX_JZ=3;//药店购药
	public static final int JZLX_ZY=2;//住院
	public static final int JZLX_QT=4;//其他
	
	public static final int FASTQUERY_1=1;//近6个月
	public static final int FASTQUERY_2=2;//近12个月
	public static final int FASTQUERY_3=3;//近24个月
	public static final int FASTQUERY_4=4;//近4个季度
	public static final int FASTQUERY_5=5;//近8个季度
	public static final int FASTQUERY_6=6;//近12个季度
	public static final int FASTQUERY_7=7;//近3年
	public static final int FASTQUERY_8=8;//近5年
	public static final int FASTQUERY_9=9;//近10年
	
	public static final int DATE_SCOPE_1=0;//月份
	public static final int DATE_SCOPE_2=1;//季度
	public static final int DATE_SCOPE_3=2;//年份
	
	public static final String MEMCACHE_ALL_FA_INDICATORS="FAIndicator";
	
	public static final String MEMCACHE_ORG_YD="Memcache_org_yd";
	public static final String MEMCACHE_ORG_YY="Memcache_org_yy";
	public static final String MEMCACHE_ORG="Memcache_org";
	
	
	//！！！以下供基金分析专用！！！
	public static final String SPLIT_JZDM = "JZDM";//就诊代码
	public static final String SPLIT_DJDM = "DJDM";//医院等级
	public static final String SPLIT_RID = "RID";//指标
	public static final String JZDM_MZ = "1";//门诊
	public static final String JZDM_ZY = "2";//住院
	public static final String DJDM_3 = "3";//三级医院
	public static final String DJDM_2 = "2";//二级医院
	public static final String DJDM_1 = "1";//一级医院
	
	public static final String UN_WAN = "万";//万
	//！！！以上供基金分析专用！！！
	
	public static Object getResultByMemcache(String key)
	{
		Object obj = null;
		try
		{
			obj= MEMCACHED_CLIENT.get(key);
		}
		catch (TimeoutException e)
		{
			logger.error("连接超时");
		}
		catch (InterruptedException e)
		{
			MEMCACHED_CLIENT=null;
			e.printStackTrace();
		}
		catch (MemcachedException e)
		{
			MEMCACHED_CLIENT=null;
			e.printStackTrace();
		}
		catch (NullPointerException e)
		{
			logger.error("缓存服务器未找到");
			obj=GLOBAL_POOL.get(key);
		}
		return obj;
	}
	
	/**
	 * 设置要缓存key的时间秒数
	 * @description:
	 * @time: 上午9:55:01 2013-1-16
	 * @param key
	 * @param seconds 缓存时间，单位：秒
	 * @param obj
	 * @return
	 */
	public static boolean setResultByMemcache(String key,int seconds,Object obj)
	{
		try
		{
			MEMCACHED_CLIENT.set(key,seconds, obj);
			return true;
		}
		catch (TimeoutException e)
		{
			logger.error("连接超时");
		}
		catch (InterruptedException e)
		{
			MEMCACHED_CLIENT=null;
			e.printStackTrace();
		}
		catch (MemcachedException e)
		{
			MEMCACHED_CLIENT=null;
			e.printStackTrace();
		}
		catch (NullPointerException e)
		{
			logger.error("缓存服务器未找到");
		    GLOBAL_POOL.put(key, obj);
		}
		return false;
	}
	
	
	
	public static boolean replaceResultByMemcache(String key,int seconds,Object obj)
	{
		try
		{
			MEMCACHED_CLIENT.replace(key, seconds, obj);
			return true;
		}
		catch (TimeoutException e)
		{
			logger.error("连接超时");
		}
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		catch (MemcachedException e)
		{
			e.printStackTrace();
		}
		catch (NullPointerException e)
		{
			logger.error("缓存服务器未找到");
			GLOBAL_POOL.put(key, obj);
		}
		return false;
	}
}
