package com.winning.bi.utils
{
	public class LVUtil
	{
		public function LVUtil()
		{
		}
		
		public static function getYesOrNoLabel(value:int):String{
			if(value==Constant.TRUE){
				return "是";
			}else{
				return "否";
			}
		}

	}
}