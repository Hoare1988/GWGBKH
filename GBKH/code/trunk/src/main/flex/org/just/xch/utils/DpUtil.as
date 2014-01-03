package org.just.xch.utils
{
	import org.just.xch.model.domain.Indicator;

	
	import mx.collections.ArrayCollection;

	public class DpUtil
	{
		public function DpUtil()
		{
		}

		public static function getIsValid():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			
			return ac;
		}

		public static function getEnable():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			return ac;
		}

		public static function getQueryEnable():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			return ac;
		}


		public static function getLanguage():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}

		public static function getScript():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
	
			return ac;
		}

		public static function getFunc():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}

		public static function getUnit():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}


		public static function getColType():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}


		public static function getNature():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
	
			return ac;
		}

		public static function getSuccessQuery():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}

		public static function getFrequency():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}

		public static function getIndStatus():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}

		public static function getPercision():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}

		public static function getPercisionLabel(type:int):String
		{
			var s:String;
			switch (type)
			{
				case 0:
					s="整数";
					break;
				case 1:
					s="保留1位小数";
					break;
				case 2:
					s="保留2位小数";
					break;
				case 3:
					s="保留3位小数";
					break;
				default:
					s="";
					break;
			}
			return s;
		}

		public static function getEnableLabel(type:int):String
		{
			var s:String;
			switch (type)
			{
				case Constant.TRUE:
					s="启用";
					break;
				case Constant.FALSE:
					s="停用";
					break;
				default:
					s="";
					break;
			}
			return s;
		}


		public static function getLanguageLabel(type:int):String
		{
			var s:String;
			switch (type)
			{
				case Constant.LANG_ZH:
					s="中文";
					break;
				case Constant.LANG_EN:
					s="English";
					break;
				default:
					s="";
					break;
			}
			return s;
		}

		public static function getSuccessLabel(type:int):String
		{
			var s:String;
			switch (type)
			{
				case Constant.TRUE:
					s="成功";
					break;
				case Constant.FALSE:
					s="失败";
					break;
				default:
					s="";
					break;
			}
			return s;
		}

		public static function getScriptLabel(type:String):String
		{
			var s:String;
			switch (type)
			{
				case Constant.SCRIPT_SQL:
					s=Constant.SCRIPT_SQL;
					break;
				case Constant.SCRIPT_PROC:
					s=Constant.SCRIPT_PROC;
					break;
				default:
					s="";
					break;
			}
			return s;
		}


		public static function getColTypeLabel(type:String):String
		{
			var s:String;
			switch (type)
			{
				case Constant.COL_TYPE_VAR:
					s=Constant.COL_STYPE_VAR;
					break;
				case Constant.COL_TYPE_INT:
					s=Constant.COL_STYPE_INT;
					break;
				case Constant.COL_TYPE_NUM:
					s=Constant.COL_STYPE_NUM;
					break;
				case Constant.COL_TYPE_DATE:
					s=Constant.COL_STYPE_DATE;
					break;
				default:
					s="";
					break;
			}
			return s;
		}

		public static function getFrequencyLabel(type:String):String
		{
			var s:String;
			switch (type)
			{
				case Constant.FREQUENCY_M:
					s=Constant.FREQUENCY_SM;
					break;
				case Constant.FREQUENCY_D:
					s=Constant.FREQUENCY_SD;
					break;
				case Constant.FREQUENCY_Y:
					s=Constant.FREQUENCY_SY;
					break;
				default:
					s="";
					break;
			}
			return s;
		}


		public static function getFuncLabel(type:String):String
		{
			var s:String;
			switch (type)
			{
				case Constant.GY_SUM:
					s=Constant.GYS_SUM;
					break;
				case Constant.GY_AVG:
					s=Constant.GYS_AVG;
					break;
				case Constant.GY_MAX:
					s=Constant.GYS_MAX;
					break;
				case Constant.GY_MIN:
					s=Constant.GYS_MIN;
					break;
				default:
					s="";
					break;
			}
			return s;
		}

		public static function getCPDimLabel(type:String):String
		{
			var s:String;
			switch (type)
			{
				case Constant.CP_DIM_HOS:
					s="全院";
					break;
				case Constant.CP_DIM_DEPT:
					s="科室";
					break;
				case Constant.CP_DIM_PATHWAY:
					s="路径";
					break;
				case Constant.CP_DIM_DOCTOR:
					s="医生";
					break;
				default:
					s="";
					break;
			}
			return s;
		}

		public static function random4Num():Number
		{
			return Math.round(Math.random() * (9999 - 1000)) + 1000;
		}

		public static function random5Num():Number
		{
			return Math.round(Math.random() * (99999 - 10000)) + 10000;
		}


		public static function get1TrueOr0False(str:String):Boolean
		{
			if (str == '1')
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		public static function getYesOrNoLabel(type:int):String
		{
			var s:String;
			switch (type)
			{
				case Constant.TRUE:
					s="是";
					break;
				case Constant.FALSE:
					s="否";
					break;
				default:
					s="";
					break;
			}
			return s;
		}


		public static function getYesOrNoLabelByStr(type:String):String
		{
			var s:String;
			switch (type)
			{
				case Constant.STR_TRUE:
					s="是";
					break;
				case Constant.STR_FALSE:
					s="否";
					break;
				default:
					s="";
					break;
			}
			return s;
		}


		
		//demo begin
		public static function getGender():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
	
			return ac;
		}

		public static function getRyzt():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}

		//demo end


		//Finance end
		public static function getFastQueryModeTypes():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}
		
		public static function getQueryScopeType():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			
			return ac;
		}
		
		
		public static function getTestData():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			
			
		
			return ac;
		}
		
		
		public static function getJzlbMc(type:String):String
		{
			var s:String;
			switch (type)
			{
				case null:
					s="全部";
					break;
				case "1":
					s="门诊";
					break;
				case "2":
					s="住院";
					break;
				default:
					s="其他";
					break;
			}
			return s;
		}
		
		public static function getXmdjMc(type:String):String
		{
			var s:String;
			switch (type)
			{
				case "0":
					s="未填";
					break;
				case "1":
					s="甲类";
					break;
				case "2":
					s="乙类";
					break;
				case "3":
					s="丙类";
					break;
				default:
					s="未填";
					break;
			}
			return s;
		}
		
		
		public static function getTheme():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
		
			return ac;
		}

		//Finance end

	}
}