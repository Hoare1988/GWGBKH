package org.just.xch.domain;

import java.io.Serializable;
import java.util.Date;

import org.just.xch.domain.sys.SysUser;

public class ApplyRecord implements Serializable
{
	private long id;//
	private SysUser auser;// 申请用户
	private String mcode;// 申请模块CODE
	private String ammc;// 申请模块名称
	private String amwjm;// 申请模块文件名
	private String areason;// 申请理由
	private int aruntime;// 申请时长
	private int status;// 状态
	private SysUser ruser;// 审核人
	private String rreason;// 审核结果备注
	private int rruntime;// 分配时长
	private Date kssj;// 有效期开始
	private Date jssj;// 有效期结束
	private Date sqsj;// 申请时间
	private Date shsj;// 审核时间
	private int haveread;// 是否已阅

	public static final int RT_01 = 1;// 3小时
	public static final int RT_05 = 5;// 24小时
	public static final int RT_10 = 10;// 5天
	public static final int RT_20 = 20;// 1个月
	public static final int RT_25 = 25;// 3个月
	public static final int RT_30 = 30;// 1年
	public static final int RT_98 = 98;// 自定义
	public static final int RT_99 = 99;// 永久

	public static final int STATUS0 = 0;// 审核中
	public static final int STATUS1 = 1;// 审核通过
	public static final int STATUS2 = 2;// 审核不通过
	public static final int STATUS3 = 3;// 过期

	public long getId()
	{
		return id;
	}

	public void setId(long id)
	{
		this.id = id;
	}

	public SysUser getAuser()
	{
		return auser;
	}

	public void setAuser(SysUser auser)
	{
		this.auser = auser;
	}

	public String getMcode()
	{
		return mcode;
	}

	public void setMcode(String mcode)
	{
		this.mcode = mcode;
	}

	public String getAmmc()
	{
		return ammc;
	}

	public void setAmmc(String ammc)
	{
		this.ammc = ammc;
	}

	public String getAmwjm()
	{
		return amwjm;
	}

	public void setAmwjm(String amwjm)
	{
		this.amwjm = amwjm;
	}

	public String getAreason()
	{
		return areason;
	}

	public void setAreason(String areason)
	{
		this.areason = areason;
	}

	public int getAruntime()
	{
		return aruntime;
	}

	public void setAruntime(int aruntime)
	{
		this.aruntime = aruntime;
	}

	public int getStatus()
	{
		return status;
	}

	public void setStatus(int status)
	{
		this.status = status;
	}

	public SysUser getRuser()
	{
		return ruser;
	}

	public void setRuser(SysUser ruser)
	{
		this.ruser = ruser;
	}

	public String getRreason()
	{
		return rreason;
	}

	public void setRreason(String rreason)
	{
		this.rreason = rreason;
	}

	public int getRruntime()
	{
		return rruntime;
	}

	public void setRruntime(int rruntime)
	{
		this.rruntime = rruntime;
	}

	public Date getKssj()
	{
		return kssj;
	}

	public void setKssj(Date kssj)
	{
		this.kssj = kssj;
	}

	public Date getJssj()
	{
		return jssj;
	}

	public void setJssj(Date jssj)
	{
		this.jssj = jssj;
	}

	public Date getSqsj()
	{
		return sqsj;
	}

	public void setSqsj(Date sqsj)
	{
		this.sqsj = sqsj;
	}

	public Date getShsj()
	{
		return shsj;
	}

	public void setShsj(Date shsj)
	{
		this.shsj = shsj;
	}

	public int getHaveread()
	{
		return haveread;
	}

	public void setHaveread(int haveread)
	{
		this.haveread = haveread;
	}
	
	public static String getModuleNameByCode(String code){
		String name=null;
		if(ApplyRecord.CODE001.equals(code)){
			name=ApplyRecord.SCODE001;
		}else if(ApplyRecord.CODE002.equals(code)){
			name=ApplyRecord.SCODE002;
		}else if(ApplyRecord.CODE003.equals(code)){
			name=ApplyRecord.SCODE003;
		}else if(ApplyRecord.CODE004.equals(code)){
			name=ApplyRecord.SCODE004;
		}else if(ApplyRecord.CODE005.equals(code)){
			name=ApplyRecord.SCODE005;
		}else if(ApplyRecord.CODE006.equals(code)){
			name=ApplyRecord.SCODE006;
		}else if(ApplyRecord.CODE007.equals(code)){
			name=ApplyRecord.SCODE007;
		}else if(ApplyRecord.CODE008.equals(code)){
			name=ApplyRecord.SCODE008;
		}else if(ApplyRecord.CODE009.equals(code)){
			name=ApplyRecord.SCODE009;
		}else if(ApplyRecord.CODE010.equals(code)){
			name=ApplyRecord.SCODE010;
		}else if(ApplyRecord.CODE030.equals(code)){
			name=ApplyRecord.SCODE030;
		}else if(ApplyRecord.CODE031.equals(code)){
			name=ApplyRecord.SCODE031;
		}else if(ApplyRecord.CODE032.equals(code)){
			name=ApplyRecord.SCODE032;
		}else if(ApplyRecord.CODE033.equals(code)){
			name=ApplyRecord.SCODE033;
		}else if(ApplyRecord.CODE034.equals(code)){
			name=ApplyRecord.SCODE034;
		}else if(ApplyRecord.CODE035.equals(code)){
			name=ApplyRecord.SCODE035;
		}else if(ApplyRecord.CODE036.equals(code)){
			name=ApplyRecord.SCODE036;
		}else if(ApplyRecord.CODE037.equals(code)){
			name=ApplyRecord.SCODE037;
		}else if(ApplyRecord.CODE038.equals(code)){
			name=ApplyRecord.SCODE038;
		}else if(ApplyRecord.CODE039.equals(code)){
			name=ApplyRecord.SCODE039;
		}else if(ApplyRecord.CODE070.equals(code)){
			name=ApplyRecord.SCODE070;
		}else if(ApplyRecord.CODE071.equals(code)){
			name=ApplyRecord.SCODE071;
		}else if(ApplyRecord.CODE072.equals(code)){
			name=ApplyRecord.SCODE072;
		}else if(ApplyRecord.CODE073.equals(code)){
			name=ApplyRecord.SCODE073;
		}else if(ApplyRecord.CODE074.equals(code)){
			name=ApplyRecord.SCODE074;
		}else if(ApplyRecord.CODE075.equals(code)){
			name=ApplyRecord.SCODE075;
		}
		
		return name;
	}
	
	//
	public static final String CODE001 = "001";// 监控审核首页
	public static final String CODE002 = "002";//
	public static final String CODE003 = "003";//
	public static final String CODE004 = "004";//
	public static final String CODE005 = "005";//
	public static final String CODE006 = "006";//
	public static final String CODE007 = "007";//
	public static final String CODE008 = "008";//
	public static final String CODE009 = "009";//
	public static final String CODE010 = "010";//
	
	//分析
	public static final String CODE030 = "030";//
	public static final String CODE031 = "031";//
	public static final String CODE032 = "032";//
	public static final String CODE033 = "033";//
	public static final String CODE034 = "034";//
	public static final String CODE035 = "035";//
	public static final String CODE036 = "036";//
	public static final String CODE037 = "037";//
	public static final String CODE038 = "038";//
	public static final String CODE039 = "039";//
	
	//报表
	public static final String CODE070 = "070";//
	public static final String CODE071 = "071";//
	public static final String CODE072 = "072";//
	public static final String CODE073 = "073";//
	public static final String CODE074 = "074";//
	public static final String CODE075 = "075";//
	//其他
	
	public static final String SCODE001="监控审核首页"; // 
	public static final String SCODE002="002"; //
	public static final String SCODE003="003"; //
	public static final String SCODE004="004"; //
	public static final String SCODE005="005"; //
	public static final String SCODE006="006"; //
	public static final String SCODE007="007"; //
	public static final String SCODE008="008"; //
	public static final String SCODE009="009"; //
	public static final String SCODE010="010"; //
	
	public static final String SCODE030="药店交易量分析"; //
	public static final String SCODE031="机构门特费用分析"; //
	public static final String SCODE032="参保类型费用分析"; //
	public static final String SCODE033="机构类型费用分析"; //
	public static final String SCODE034="机构均次费用分析"; //
	public static final String SCODE035="医保支付构成分析"; //
	public static final String SCODE036="036"; //
	public static final String SCODE037="037"; //
	public static final String SCODE038="038"; //
	public static final String SCODE039="039"; //
	
	public static final String SCODE070=""; //
	public static final String SCODE071=""; //
	public static final String SCODE072=""; //
	public static final String SCODE073=""; //
	public static final String SCODE074=""; //
	public static final String SCODE075=""; //
}
