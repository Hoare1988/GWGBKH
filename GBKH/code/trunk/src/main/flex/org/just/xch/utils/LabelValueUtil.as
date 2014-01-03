package org.just.xch.utils
{
	import org.just.xch.model.domain.SysModule;
	
	import mx.collections.ArrayCollection;

	public class LabelValueUtil
	{
		public function LabelValueUtil()
		{
		}
		
		public static function getJKDXLabel(type:String):String
		{
			var s:String;
			switch (type)
			{
				case Constant.JKDX_CBR:
					s="参保人";
					break;
				case Constant.JKDX_YLJG:
					s="医疗机构";
					break;
				case Constant.JKDX_DDYF:
					s="定点药房";
					break;
				case Constant.JKDX_FWTGZ:
					s="服务提供者";
					break;
				default:
					s="";
					break;
			}
			return s;
		}
		
		public static function getModuleName(moduleAC:ArrayCollection,id:String)
		{
			var ac:ArrayCollection=new ArrayCollection();
			for each(var module:SysModule in moduleAC)
			{
			     for each(var item:SysModule in module.children)
				 {
					 ac.addItem(item);
				 }
			}
			for each(var i:SysModule in ac)
			{
				if((i.id+'')==id)
				{
					return i.name;
				}
			}
			return '';
		}
	}
}