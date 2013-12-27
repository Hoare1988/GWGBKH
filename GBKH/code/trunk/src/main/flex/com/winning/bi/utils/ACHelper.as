package com.winning.bi.utils
{
	import mx.collections.ArrayCollection;

	public class ACHelper
	{
		public function ACHelper()
		{
		}

		public static function replaceObjById(arg:ArrayCollection, repObj:*):ArrayCollection
		{

			if (arg != null && arg.length > 0 && repObj.hasOwnProperty("id"))
			{

				for (var i:int=0; i < arg.length; i++)
				{
					var obj:*=arg.getItemAt(i);
					if (obj.hasOwnProperty("id") && obj["id"] == repObj["id"])
					{
						arg.setItemAt(i, repObj);
						break;
					}
				}
			}
			return arg;
		}


		public static function getSlectedObj(argAC:ArrayCollection):ArrayCollection
		{
			var result:ArrayCollection=new ArrayCollection();
			if (argAC != null && argAC.length > 0)
			{
				for each (var obj:Object in argAC)
				{
					if (obj.hasOwnProperty("iselected") && obj.iselected == true)
					{
						result.addItem(obj);
					}
				}
			}
			return result;
		}

	}
}