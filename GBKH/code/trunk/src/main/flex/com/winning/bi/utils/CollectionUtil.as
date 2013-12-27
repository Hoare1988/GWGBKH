package com.winning.bi.utils
{
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;

	public class CollectionUtil
	{
		public function CollectionUtil()
		{
		}

		public static function emptyArrayCollection(ac:ArrayCollection):ArrayCollection
		{
			if (ac == null)
			{
				ac=new ArrayCollection();
			}
			else
			{
				ac.removeAll();
			}
			return ac;
		}


		public static function orderArrayOfCPDataVO(nature:int, ac:ArrayCollection):ArrayCollection
		{
			var result:ArrayCollection=null;
			if (ac && ac.length > 0)
			{
				var arr:Array;
				if (nature == Constant.TRUE)
				{
					arr=ac.toArray().sort(SortUtil.sortCPDataVOOnValueAsc);
				}
				else
				{
					arr=ac.toArray().sort(SortUtil.sortCPDataVOOnValueDesc);
				}
				if (arr && arr.length > 0)
				{
					result=new ArrayCollection(arr);
				}
			}
			return result;
		}

		public static function top10ArrayOfCPDataVO(flag:Boolean, nature:int, ac:ArrayCollection):ArrayCollection
		{
			var result:ArrayCollection=null;
			if (ac && ac.length > 0)
			{
				var arr:Array;
				if (nature == Constant.TRUE)
				{
					if (flag)
					{
						arr=ac.toArray().sort(SortUtil.sortCPDataVOOnValueDesc);
					}
					else
					{
						arr=ac.toArray().sort(SortUtil.sortCPDataVOOnValueAsc);
					}
				}
				else
				{
					if (flag)
					{
						arr=ac.toArray().sort(SortUtil.sortCPDataVOOnValueAsc);
					}
					else
					{
						arr=ac.toArray().sort(SortUtil.sortCPDataVOOnValueDesc);
					}
				}
				if (arr && arr.length > 0)
				{
					result=new ArrayCollection(arr.length > 10 ? arr.slice(0, 10) : arr);
				}
			}
			return result;
		}

		public static function sortBySortNum(arrayy:ArrayCollection,field:String="sortNum"):ArrayCollection
		{
			var sort:Sort=new Sort(); 
			sort.fields=[new SortField(field,false,false,null)];
			arrayy.sort=sort;
			arrayy.refresh();
			return arrayy;
		}
	}
}