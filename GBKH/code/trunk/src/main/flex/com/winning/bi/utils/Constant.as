package com.winning.bi.utils
{
	import mx.collections.ArrayCollection;
	
	public class Constant
	{
		public function Constant()
		{
		}
	
		public static const Stations:ArrayCollection=new ArrayCollection([
		{text:"全部",value:""},
		{text:"正职",value:"1"},
		{text:"副职",value:"2"}]
		);
		public static const AccessYears:Array=['2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023'];

		public static const dayNames:Array=['日','一','二','三','四','五','六'];
		
		public static const monthNames:Array=['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'];
		public static const APP_NAME:String="GBKH";
		
		public static const APP_NAME_MMAP:String="GBKH";
		
		public static const TRUE:int=1;
		public static const FALSE:int=0;
		public static const NULL:int=-1;
		
		public static const LANG_ZH:int=1;
		public static const LANG_EN:int=2;
		
		public static const DX_1:int=1; //参保人
		public static const DX_2:int=2; //机构
		public static const DX_3:int=3; //药房
		public static const DX_4:int=4; //医生
		
		public static const PAGESIZE:int=20;
		public static const COLORS:Array=[0xe48701, 0xa5bc4e, 0x1b95d9, 0xcaca9e, 0x6693b0, 0xf05e27, 0x86d1e4, 0xe4f9a0, 0xffd512, 0x75b000, 0x662b0, 0xede8c6, 0xcc3300, 0xd1dfe7];
		
		public static const CP_DIM_HOS:String="DIM000001"; //全院
		public static const CP_DIM_DEPT:String="DIM000002"; //科室
		public static const CP_DIM_PATHWAY:String="DIM000003"; //路径
		public static const CP_DIM_DOCTOR:String="DIM000004"; //医生
		
		public static const TW_ADD:int=1; //添加
		public static const TW_EDIT:int=2; //修改
		public static const TW_DETAIL:int=3; //查询
		
		public static const FREQUENCY_M:String='M'; //month
		public static const FREQUENCY_D:String='D'; //day
		public static const FREQUENCY_Y:String='Y'; //year
		public static const FREQUENCY_SM:String='月'; //month
		public static const FREQUENCY_SD:String='天'; //day
		public static const FREQUENCY_SY:String='年'; //year
		
		public static const MODULE_NAME_CPDISEASE:String='单病种指标报表';
		
		public static const GY_SUM:String="SUM";
		public static const GY_AVG:String="AVG";
		public static const GY_MAX:String="MAX";
		public static const GY_MIN:String="MIN";
		public static const GYS_SUM:String="求和";
		public static const GYS_AVG:String="平均值";
		public static const GYS_MAX:String="最大值";
		public static const GYS_MIN:String="最小值";
		
		public static const UNIT_0:String="";
		public static const UNIT_1:String="%";
		public static const UNIT_2:String="天";
		public static const UNIT_3:String="人";
		public static const UNIT_4:String="次";
		public static const UNIT_5:String="元";
		public static const UNIT_6:String="万元";
		public static const UNIT_7:String="月";
		public static const UNIT_8:String="年";
		public static const UNIT_9:String="个";
		
		public static const SCRIPT_SQL:String="SQL";
		public static const SCRIPT_PROC:String="PROC";
		
		public static const COL_TYPE_VAR:String="varchar";
		public static const COL_TYPE_INT:String="int";
		public static const COL_TYPE_NUM:String="numeric";
		public static const COL_TYPE_DATE:String="date";
		public static const COL_STYPE_VAR:String="字符串";
		public static const COL_STYPE_INT:String="整数";
		public static const COL_STYPE_NUM:String="小数";
		public static const COL_STYPE_DATE:String="日期";
		
		
		public static const YY:int=0; //医院
		public static const YD:int=1; //药店
		
		public static const SYS_NAME:String="上海公卫中心干部考核系统"; //
		
		public static const STR_TRUE:String="1";
		public static const STR_FALSE:String="0";
		public static const STR_NULL:String="-1";
		
		public static const YES:String="1";
		public static const NO:String="0";
		public static const YN_1:String="是";
		public static const YN_0:String="否";
		public static const YX_1:String="有效";
		public static const YX_0:String="无效";
		
		public static const YJZ_1:String='1'; //
		public static const YJZ_2:String='2'; //
		public static const YJZ_3:String='3'; //
		
		
		public static const PAGESIZE30:int=30; //
		public static const PAGESIZE50:int=50; //
		public static const PAGESIZE100:int=100; //
		
		public static const ERROR_TYPE01:String="1"; //首次申请
		public static const ERROR_TYPE02:String="2"; //正在审核中
		public static const ERROR_TYPE03:String="3"; //登录超时
		
		public static const RED:Number=0xff0000;
		public static const YELLOW:Number=0xFF9900;
		public static const GRAY:Number=0x808080;
		public static const BLACK:Number=0x000000;
		
		public static const DHY:String="f12060000200";
		
		public static const RFZK:String="N64.901";
		
		public static const _16To39Ac:ArrayCollection=new ArrayCollection([16, 17, 18, 19, 20, 21, 22, 23, 24, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39]);
		
		public static const _unitAcs:String='16,17,18,19,20,21,22,23,24,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39';

		
		public static const DATE_SCOPE_1:Number=0; //按月份
		public static const DATE_SCOPE_2:Number=1; //按季度
		public static const DATE_SCOPE_3:Number=2; //按年份
		
		public static const THEME_0:Number=0; //机构
		public static const THEME_1:Number=1; //疾病
		public static const THEME_2:Number=2; //药品
		//solrSearchTypeCollection

		public static const KSLX_MZ:String='1';//门诊
		public static const KSLX_JY:String='2';//住院
		
		public static const TIME_PARTTEN:String = "YYYY-MM-DD";
		public static const TIME_PARTTEN_TWO:String = "MM-DD HH";
		public static const TIME_PARTTEN_THREE:String = "YYYY-MM-DD HH:NN";
		public static const TIME_PARTTEN_FOUR:String = "YYYY/MM/DD";
		public static const TIME_PARTTEN_FIVE:String = "MM/DD";
		public static const TIME_PARTTEN_SIX:String = "MM月DD日HH时";
		public static const TIME_PARTTEN_SEVEN:String = "MM-DD";
		public static const TIME_PARTTEN_EIGHT:String = "MM-DD HH:NN";
		public static const WS_TIME_PARTTEN:String = "YYYYMMDDHHNNSS";
		
		public static const ALERT_CONTENT_FZYC:String="分值异常!";
		public static const EDITEABLE_FLAG:String="@@@@@@";
		
	}
}