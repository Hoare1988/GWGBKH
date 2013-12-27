package com.winning.util
{
	import mx.collections.ArrayCollection;
	import mx.utils.StringUtil;

	public class DataHelper
	{

		public static function passwordCheck(password:String):Boolean
		{
			var regExp:RegExp=/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[!@#$%^*()_:.,-]).*$/;
			return regExp.test(password);
		}

		/**
		 *initialize dataAC to add sortNum by default prop groupId
		 *
		 *@param dataAC:data
		 */
		public static function setSortNum(dataAC:ArrayCollection):void
		{
			setSortNumByProp(dataAC, "groupId");
		}

		/**
		 *initialize dataAC to add sortNum by prop
		 *
		 *@param dataAC:data
		 */
		public static function setSortNumByProp(dataAC:ArrayCollection, prop:String):void
		{
			if (dataAC == null || dataAC.length < 1)
				return;
			var length:Number=dataAC.length;
			var sortNum:Number=findMinSortNum(dataAC);
			for (var i:Number=0; i < length; i++)
			{
				if (!dataAC[i].hasOwnProperty("sortNum"))
					return;
				dataAC[i].sortNum=sortNum++;
			}
			if (prop == null || StringUtil.trim(prop) == "")
				return;
			if (dataAC[0].hasOwnProperty(prop))
			{
				var groupIDAC:ArrayCollection=new ArrayCollection();
				for each (var data1:* in dataAC)
				{
					if (((data1[prop] is Number || data1[prop] is int || data1[prop] is uint) && (data1[prop] != 0 && !isNaN(data1[prop]))) || (data1[prop] is String && data1[prop] != "0" && data1[prop] != null))
					{
						if (!groupIDAC.contains(data1[prop]))
							groupIDAC.addItem(data1[prop]);
					}
				}
				for each (var groupId:* in groupIDAC)
				{
					var groupDataAC:ArrayCollection=findDatasByProp(dataAC, prop, groupId);
					var sortNumTmp:Number=DataHelper.findMinSortNum(groupDataAC);
					for each (var data2:* in groupDataAC)
					{
						data2.sortNum=sortNumTmp;
					}
				}
			}
		}

		/**
		 * According to dataAC to set groupChildrenNo and groupChildrenNum by default prop groupId
		 *
		 * @param dataAC:data
		 */
		public static function setGroup(dataAC:ArrayCollection):void
		{
			setGroupByProp(dataAC, "groupId");
		}

		/**
		 * According to dataAC to set groupChildrenNo and groupChildrenNum by prop
		 *
		 * @param dataAC:data
		 */
		public static function setGroupByProp(dataAC:ArrayCollection, prop:String):void
		{
			if (dataAC == null || dataAC.length < 1 || prop == null || StringUtil.trim(prop) == "")
				return;
			var groupIds:ArrayCollection=new ArrayCollection();
			var length:int=dataAC.length;
			for each (var data1:* in dataAC)
			{
				if (!(data1.hasOwnProperty(prop) && data1.hasOwnProperty("groupChildrenNo") && data1.hasOwnProperty("groupChildrenNum")))
					return;
				if (((data1[prop] is Number || data1[prop] is int || data1[prop] is uint) && (data1[prop] != 0 && !isNaN(data1[prop]))) || (data1[prop] is String && data1[prop] != "0" && data1[prop] != "" && data1[prop] != null))
				{
					if (!groupIds.contains(data1[prop]))
						groupIds.addItem(data1[prop])
				}
				data1.groupChildrenNo=0;
				data1.groupChildrenNum=0;
			}
			var groupDataAC:ArrayCollection;
			for each (var groupId:* in groupIds)
			{
				groupDataAC=new ArrayCollection();
				for each (var data2:* in dataAC)
				{
					if (data2[prop] == groupId)
					{
						groupDataAC.addItem(data2);
					}
				}
				var groupNum:Number=1;
				var groupChildrenNum:Number=groupDataAC.length;
				if (groupChildrenNum != 1)
				{
					for each (var groupData:* in groupDataAC)
					{
						groupData.groupChildrenNo=groupNum;
						groupData.groupChildrenNum=groupChildrenNum;
						groupNum++;
					}
				}
			}
		}

		/**
		 * find dataAC by group id
		 *
		 * @param dataAC:data
		 * @param groupId:group id
		 */
		public static function findDatasByGroupId(dataAC:ArrayCollection, groupId:Number):ArrayCollection
		{
			var dataGroupAC:ArrayCollection=new ArrayCollection();
			var length:Number=dataAC.length;
			for (var i:Number=0; i < length; i++)
			{
				if (!dataAC[i].hasOwnProperty("groupId"))
					continue;
				if (dataAC[i].groupId == groupId)
					dataGroupAC.addItem(dataAC[i]);
			}
			return dataGroupAC;
		}

		/**
		 * find dataAC by prop
		 *
		 * @param dataAC:data
		 * @param prop:String of prop
		 * @param value:prop value
		 */
		public static function findDatasByProp(dataAC:ArrayCollection, prop:String, value:Object):ArrayCollection
		{
			var dataGroupAC:ArrayCollection=new ArrayCollection();
			var length:int=dataAC.length;
			for (var i:int=0; i < length; i++)
			{
				if (!dataAC[i].hasOwnProperty(prop))
					continue;
				if (dataAC[i][prop] == value)
					dataGroupAC.addItem(dataAC[i]);
			}
			return dataGroupAC;
		}

		/**
		 *find min sortNum from dataAC
		 *
		 *@param dataAC:data
		 */
		public static function findMinSortNum(dataAC:ArrayCollection):int
		{
			var sortNumDataAC:ArrayCollection=new ArrayCollection();
			for each (var data:* in dataAC)
			{
				if (data.hasOwnProperty("sortNum"))
					sortNumDataAC.addItem(data);
			}
			var minSortNum:int=0;
			if (sortNumDataAC && sortNumDataAC.length > 0)
			{
				minSortNum=sortNumDataAC[0].sortNum;
				for each (var item:* in sortNumDataAC)
				{
					if (item.sortNum < minSortNum)
					{
						minSortNum=item.sortNum;
					}
				}
			}
			return minSortNum;
		}

		/**
		 *find max sortNum from dataAC
		 *
		 *@param dataAC:data
		 */
		public static function findMaxSortNum(dataAC:ArrayCollection):int
		{
			var sortNumDataAC:ArrayCollection=new ArrayCollection();
			for each (var data:* in dataAC)
			{
				if (data.hasOwnProperty("sortNum"))
					sortNumDataAC.addItem(data);
			}
			var maxSortNum:int=0;
			for each (var item:* in sortNumDataAC)
			{
				if (item.sortNum > maxSortNum)
				{
					maxSortNum=item.sortNum;
				}
			}
			return maxSortNum;
		}


		/**
		 *cancel items's group in itemAC
		 *
		 *@param itemAC:items to cancel group
		 *@param allItemAC:itemAC is part of it
		 */
		public static function unCombineItems(itemAC:ArrayCollection, allItemAC:ArrayCollection):ArrayCollection
		{
			if (itemAC == null || itemAC.length == 0 || allItemAC == null || allItemAC.length == 0)
				return null;

			var tempAC:ArrayCollection=new ArrayCollection();
			var groupIDAC:ArrayCollection=new ArrayCollection();
			for each (var selectItem:Object in itemAC)
			{
				if (selectItem.hasOwnProperty("groupId") && selectItem.groupId != 0)
				{
					if (!groupIDAC.contains(selectItem.groupId))
						groupIDAC.addItem(selectItem.groupId);
				}
			}
			for each (var groupId:Number in groupIDAC)
			{
				for each (var temp1:* in DataHelper.findDatasByGroupId(allItemAC, groupId))
				{
					tempAC.addItem(temp1);
				}
			}
			var maxSortNum:Number=DataHelper.findMaxSortNum(allItemAC) + 1
			for each (var temp2:* in tempAC)
			{
				temp2.groupId=0;
				temp2.sortNum=maxSortNum;
				if (temp2.hasOwnProperty("groupType"))
					temp2.groupType=0;
			}
			DataHelper.setGroup(allItemAC);
			return tempAC;
		}

		/**
		 *combine items to set those groupId
		 *
		 *@param itemAC:items to combine group
		 *@param allItemAC:itemAC is part of it
		 *@param groupId:groupId
		 */
		public static function combineItemsByGroupId(itemAC:ArrayCollection, allItemAC:ArrayCollection, groupId:Number):ArrayCollection
		{
			if (itemAC == null || itemAC.length == 0 || allItemAC == null || allItemAC.length == 0)
				return null;

			var tempAC:ArrayCollection=new ArrayCollection();
			var groupIDAC:ArrayCollection=new ArrayCollection();
			for each (var selectItem:Object in itemAC)
			{
				if (selectItem.hasOwnProperty("groupId") && selectItem.groupId != 0)
				{
					if (!groupIDAC.contains(selectItem.groupId))
						groupIDAC.addItem(selectItem.groupId);
				}
				else if (selectItem.hasOwnProperty("groupId"))
					tempAC.addItem(selectItem);
			}
			for each (var groupId:Number in groupIDAC)
			{
				for each (var temp1:* in DataHelper.findDatasByGroupId(allItemAC, groupId))
				{
					tempAC.addItem(temp1);
				}
			}
			var sortNumTmp:Number=DataHelper.findMinSortNum(tempAC);
			for each (var item:Object in tempAC)
			{
				item["groupId"]=groupId;
				item["sortNum"]=sortNumTmp;
			}
			DataHelper.setGroup(allItemAC);
			return tempAC;
		}

		/**
		 *combine items to set those groupId
		 *
		 *@param itemAC:items to combine group
		 *@param allItemAC:itemAC is part of it
		 */
		public static function combineItems(itemAC:ArrayCollection, allItemAC:ArrayCollection):ArrayCollection
		{
			var groupIDTmp:Number=MathUtil.round();
			return combineItemsByGroupId(itemAC, allItemAC, groupIDTmp);
		}

		public static function divisionFormat(value:Number, len:int):String
		{
			var result:String=value.toString();
			var valueStr:String=value.toString();
			if (valueStr.indexOf(".") > -1)
			{
				var fractionStr:String=valueStr.split(".")[1];
				if (fractionStr.length > len)
				{
					result=value.toPrecision(len);
				}
			}
			return result;
		}

		public static function isLimittedLevel(level:Number, limitLevel:Number):Boolean
		{
			var limitedFlag:Boolean=false;
			if (level)
			{
				if (limitLevel && limitLevel > level)
				{
					limitedFlag=true;
				}
			}
			else
			{
				if (limitLevel)
				{
					limitedFlag=true;
				}
			}
			return limitedFlag;
		}
	}
}