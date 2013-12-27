package com.winning.util
{
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.utils.ObjectUtil;


	public class ArrayCollectionUtil
	{
		public static function addAll(arr:ArrayCollection, arr2:ArrayCollection):void
		{
			for each (var obj:Object in arr2)
			{
				arr.addItem(obj);
			}
		}
		
		public static function isExistGroupID(groupID:Number, arr:ArrayCollection):Boolean
		{
			var flag:Boolean=false;
			for each (var isExistGroupID:Number in arr)
			{
				if (groupID == isExistGroupID)
				{
					flag=true;
					break;
				}
			}
			return flag;
		}
		
		public static function isExist(existObj:Object, arr:ArrayCollection):Boolean
		{
			var flag:Boolean=false;
			for each (var obj:Object in arr)
			{
				if (existObj == obj)
				{
					flag=true;
					break;
				}
			}
			return flag;
		}

		public static function removeItem(arr:ArrayCollection, item:Object):void
		{
			var itemIndex:int=arr.getItemIndex(item);
			if (itemIndex != -1)
				arr.removeItemAt(itemIndex);
		}

		/**
		 *orginzing and refresh ArrayCollection to sort ArrayCollection by sortFunction
		 *
		 * @param dataAC:data
		 */
		public static function sortCompareFunction(dataAC:ArrayCollection, sortFunction:Function):ArrayCollection
		{
			var sort:Sort=new Sort();
			sort.compareFunction=sortFunction;
			dataAC.sort=sort;
			dataAC.refresh();
			return dataAC;
		}


		public static function sortByTwoProperty(ac:ArrayCollection, name1:String=null, name2:String=null, caseInsensitive:Boolean=false, descending:Boolean=false, numeric:Object=null):void
		{
			var sort:Sort=new Sort();
			//name降序，name升序
			sort.fields=[new SortField(name1), new SortField(name2)];

			// Assign the Sort object to the view.
			if (ac != null && ac.length > 0)
			{
				ac.sort=sort;
				ac.refresh();
			}
		}

		public static function sort(ac:ArrayCollection, name:String=null, caseInsensitive:Boolean=false, descending:Boolean=false, numeric:Object=null):void
		{
			var sort:mx.collections.Sort=new mx.collections.Sort();
			sort.fields=[new mx.collections.SortField(name, caseInsensitive, descending, numeric)];
			if (ac != null && ac.length > 0)
			{
				ac.sort=sort;
				ac.refresh();
			}
		}

		public static function sortBySortNum(ac:ArrayCollection, field:String='sortNum'):void
		{
			sort(ac, field, false, false, true);
		}

		public static function sortByPinyin(dataAC:ArrayCollection, field:String):ArrayCollection
		{
			if (dataAC && dataAC.length > 0 && dataAC[0].hasOwnProperty(field))
			{
				var sort:Sort=new Sort();
				sort.compareFunction=function(obj1:Object, obj2:Object, fields:Array=null):int
				{
					var value1:String=obj1[field];
					var value2:String=obj2[field];

					if (value1 == null && value2 == null)
						return 0;
					if (value1 == null)
						return 1;
					if (value2 == null)
						return -1;

					var code:ConvertToCode=new ConvertToCode();
					if (code.toPinyinCode(value1) > code.toPinyinCode(value2))
						return 1;
					else if (code.toPinyinCode(value1) < code.toPinyinCode(value2))
						return -1;
					else
						return 0;
				};
				dataAC.sort=sort;
				dataAC.refresh();
			}
			return dataAC;
		}

		public static function sortByDate(dataAC:ArrayCollection, field:String="updateDate", isDesc:Boolean=false):ArrayCollection
		{
			if (dataAC && dataAC.length > 0 && dataAC[0].hasOwnProperty(field))
			{
				var sort:Sort=new Sort();
				sort.compareFunction=function(obj1:Object, obj2:Object, fields:Array=null):int
				{
					return ObjectUtil.dateCompare(obj2[field], obj1[field]);
				};
				dataAC.sort=sort;
				dataAC.refresh();
			}
			if (isDesc)
			{
				var tempAC:ArrayCollection=new ArrayCollection();
				for (var i:int=dataAC.length - 1; i >= 0; i--)
				{
					tempAC.addItem(dataAC.getItemAt(i));
				}
				dataAC=tempAC;
			}
			return dataAC;
		}

		public static function sortBySortNumAndGroup(obj1:Object, obj2:Object, fields:Array=null):int
		{
			if (obj1 == null && obj2 == null)
				return 0;
			if (obj1 == null)
				return 1;
			if (obj2 == null)
				return -1;

			if (obj1.sortNum < obj2.sortNum)
				return -1;
			else if (obj1.sortNum > obj2.sortNum)
				return 1;
			else
			{
				if (obj1.groupChildrenNo < obj2.groupChildrenNo)
					return -1;
				else if (obj1.groupChildrenNo > obj2.groupChildrenNo)
					return 1;
				else
					return 1;
			}
		}

		public static function isRepeatFieldValue(fieldValue:String, ac:ArrayCollection, id:Number=0, filed:String="name"):Boolean
		{
			for each (var tempObj:Object in ac)
			{
				if (tempObj[filed] && tempObj[filed].toLowerCase() == fieldValue.toLowerCase())
				{
					if (!id)
					{
						return true;
					}
					else
					{
						if (tempObj['id'] != id)
						{
							return true;
						}
					}
				}
			}
			return false
		}


	}
}
