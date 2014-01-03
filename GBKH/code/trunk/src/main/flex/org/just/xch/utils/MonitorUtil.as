package org.just.xch.utils
{
	import org.just.xch.model.domain.MMapping;
	import org.just.xch.model.mlct.AppModelLocator;
	
	import mx.collections.ArrayCollection;

	public class MonitorUtil
	{
		public function MonitorUtil()
		{
		}
		
		public static function getSelectedMMapping(zt:String,argAC:ArrayCollection):ArrayCollection{
			var ac:ArrayCollection=new ArrayCollection();
			if(argAC!=null&&argAC.length>0){
				for each (var mm:MMapping in argAC)
				{
					if (mm.zt == MMapping.ZT_0 && mm.isSelected == true)
					{
						mm.zt=zt;
						mm.shry=AppModelLocator.getInstance().loginUser;
						ac.addItem(mm);
					}
				}
			}
			return ac;
		}
	}
}