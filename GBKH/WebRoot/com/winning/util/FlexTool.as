package com.winning.util
{
	import com.winning.bi.utils.TimeFormatter;
	
	import flash.external.ExternalInterface;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.resources.ResourceManager;
	import mx.utils.ObjectUtil;
	import mx.utils.StringUtil;

	public class FlexTool
	{
		public static function getParams():Object
		{
			var params:Object=new Object();
			var query:String=ExternalInterface.call("window.location.search.substring", 1);
			if (query)
			{
				var pairs:Array=query.split('&');
				for (var i:int=0; i < pairs.length; i++)
				{
					var pos:int=pairs[i].indexOf('=');
					if (pos != -1)
					{
						var argname:String=pairs[i].substring(0, pos);
						var value:String=pairs[i].substring(pos + 1);
						params[argname]=value;
					}
				}
			}
			return params;
		}

		public static function setAlert():void
		{
			Alert.yesLabel=ResourceManager.getInstance().getString('localization', 'yes');
			Alert.noLabel=ResourceManager.getInstance().getString('localization', 'no');
			Alert.cancelLabel=ResourceManager.getInstance().getString('localization', 'cancelLabel');
			Alert.okLabel=ResourceManager.getInstance().getString('localization', 'okLabel');
		}

		public static function stringToValue(str:String):String
		{
			var value:String="";
			if (str != null)
			{
				if (str.indexOf('?') != -1)
				{
					var start:int=str.indexOf('=');
					var end:int=str.indexOf('&');
					value=str.slice(start + 1, end == -1 ? str.length : end);
					if (end != -1)
					{
						start=str.indexOf('=', start + 1);
						end=str.indexOf('&', end + 1);
						value=value + ',' + str.slice(start + 1, end == -1 ? str.length : end);
						if (end != -1)
						{
							start=str.indexOf('=', start + 1);
							end=str.indexOf('&', end + 1);
							value=value + ',' + str.slice(start + 1, end == -1 ? str.length : end);
						}
					}
				}
				else
				{
					value=str;
				}
			}
			return value;
		}

		public static function getLocalBaseDir():String
		{
			if (null == Application.application.loaderInfo)
			{
				return null;
			}
			var url:String=Application.application.loaderInfo.url;
			var r:String="";
			var n:int=url.lastIndexOf("/");
			r=url.substr(0, n + 1);
			return r;
		}

		public static function getTempRoundId():Number
		{
			return Math.round(Math.random() * 10000000);
		}

		public static function copyObject(src:Object, dest:Object):void
		{
			var srcProperties:Array=ObjectUtil.getClassInfo(src).properties as Array;
			for (var i:int=0; i < srcProperties.length; i++)
			{
				var p:String=QName(srcProperties[i]).localName;
				if (dest.hasOwnProperty(p))
					dest[p]=src[p];
			}
		}

		public static function isStringNull(str:String):Boolean
		{
			return str == null || StringUtil.trim(str) == "";
		}

		public static function convertToTreeListAC2(menus:ArrayCollection, parent:*):ArrayCollection
		{
			var hierarchyMenus:ArrayCollection=new ArrayCollection();
			for each (var menu:Object in menus)
			{
				if (menu.parent == parent || (parent && menu.parent && menu.parent.id == parent.id))
				{
					var hierarchySubMenus:ArrayCollection=convertToTreeListAC2(menus, menu);
					if (hierarchySubMenus != null)
					{
						hierarchyMenus.addItem({parent: menu.parent, id: menu.id, name: menu.name, children: hierarchySubMenus, createDate: TimeFormatter.parse(menu.createDate, Constant.TIME_PARTTEN), updateDate: TimeFormatter.parse(menu.updateDate, Constant.TIME_PARTTEN), createBy: menu.createBy, sourceData: menu});
					}
					else
					{
						hierarchyMenus.addItem({parent: menu.parent, id: menu.id, name: menu.name, createDate: TimeFormatter.parse(menu.createDate, Constant.TIME_PARTTEN), updateDate: TimeFormatter.parse(menu.updateDate, Constant.TIME_PARTTEN), createBy: menu.createBy, sourceData: menu});
					}
				}
			}
			if (hierarchyMenus.length == 0)
			{
				return null;
			}
			return hierarchyMenus;
		}

		/*public static function convertToTreeListAC(dataAC:ArrayCollection, parent:TreeNodeVO):ArrayCollection
		{
			var hierarchyMenus:ArrayCollection=new ArrayCollection();
			for each (var itemData:Object in dataAC)
			{
				if (parent == null || parent.sourceData == null)
				{
					if (itemData.parent == null)
					{
						var node:TreeNodeVO=createNode(itemData, parent);
						var hierarchySubMenus:ArrayCollection=convertToTreeListAC(dataAC, node);
						if (hierarchySubMenus != null)
						{
							node.children=hierarchySubMenus;
						}
						hierarchyMenus.addItem(node);
					}
				}
				else
				{
					if (itemData.parent == parent.sourceData || (itemData.parent && itemData.parent.id && itemData.parent.id == parent.sourceData.id))
					{
						var node:TreeNodeVO=createNode(itemData, parent);
						var hierarchySubMenus:ArrayCollection=convertToTreeListAC(dataAC, node);
						if (hierarchySubMenus != null)
						{
							node.children=hierarchySubMenus;
						}
						hierarchyMenus.addItem(node);
					}
				}
			}
			if (hierarchyMenus.length == 0)
			{
				return null;
			}
			return hierarchyMenus;
		}

		public static function createNode(itemData:Object, parent:TreeNodeVO):TreeNodeVO
		{
			var node:TreeNodeVO=new TreeNodeVO();
			node.parent=parent;
			node.id=itemData.id;
			node.name=itemData.name;
			node.sourceData=itemData;
			return node;
		}*/

	}
}