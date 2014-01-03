package org.just.xch.utils
{
	import org.just.xch.model.vo.CPDataVO;

	public class SortUtil
	{
		public function SortUtil()
		{
		}
		public static var sortCPDataVOOnValueDesc=function(a:CPDataVO, b:CPDataVO):Number
			{
				var aValue:Number=a.value;
				var bValue:Number=b.value;
				if (aValue > bValue)
				{
					return 1;
				}
				else if (aValue < bValue)
				{
					return -1;
				}
				else
				{
					return 0;
				}
			}
		public static var sortCPDataVOOnValueAsc=function(a:CPDataVO, b:CPDataVO):Number
			{
				var aValue:Number=a.value;
				var bValue:Number=b.value;
				if (aValue > bValue)
				{
					return -1;
				}
				else if (aValue < bValue)
				{
					return 1;
				}
				else
				{
					return 0;
				}
			}

	}
}